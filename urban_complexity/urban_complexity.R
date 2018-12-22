#Urban Complexity

library(tidyverse)
library(tmap)
library(tmaptools)
library(osmdata)
library(sf)
library(stplanr)
library(igraph)

#==============================#
#------ Utility Func ----------#
#==============================#

#If we store node information in the edges
#Then we can calculate slope and angles
#g is a graph we want to get angle information for
#lout is either a layout function or a layout matrix
customize_graph <- function(g, lout){
  #we can provide either a layout function or a layout matrix
  if(is.matrix(lout)){
    l <- lout
  } else {
    set.seed(4321)
    l <- lout(g)
  }
  
  
  g %>%
    set_graph_attr(., 'layout', l)%>%
    set_vertex_attr('size', value = 5) %>%
    set_vertex_attr('label', value = '') %>%
    set_vertex_attr('x', value = .$layout[,1]) %>%
    set_vertex_attr('y', value = .$layout[,2]) %>%
    set_edge_attr('head_x', value = head_of(., E(.))$x) %>%
    set_edge_attr('tail_x', value = tail_of(., E(.))$x) %>%
    set_edge_attr('head_y', value = head_of(., E(.))$y) %>%
    set_edge_attr('tail_y', value = tail_of(., E(.))$y) %>%
    
    # Slope is calculated as (y2 - y1)/(x2-x1)
    set_edge_attr('slope', value = map_dbl(E(.), function(e){
      slope = (e$tail_y - e$head_y)/(e$tail_x - e$head_x)
      if(is.infinite(slope)) return(Inf)
      return(slope)
    })) %>%
    set_edge_attr('color', value = map_chr(E(.)$slope, function(e){
      if(e < 0) return('red')
      return('blue')
    })) %>%
    
    #Tangent = Opposite/Adjacent
    #Tangent = (y2-y1)/(x2-x1)
    #Tangent = Slope
    #ArcTan(Slope) = The angle we are looking for
    set_edge_attr('angle', value = map_dbl(E(.)$slope, function(e){
      atan(e) * 180 / pi
    })) %>%
    set_edge_attr('width', value = 1.5)
}


#this creates the data for the compass
#g must be a graph from the customize_graph function
#intervals are the bin intervals between +90 degrees and -90 degrees
graph_orientation <- function(g, intervals = 10){
  break_points <- seq(90, -90, -intervals) #%>% .[2:(length(.) - 1)]
  
  #North-South Orientation is essentially angles with +-90 degrees
  #East West Orientation is essentially angles with 0 degrees
  cut(E(g)$angle, 
#      c(Inf, break_points, -Inf)) %>%
    break_points, include.lowest = T) %>%
    factor(levels = rev(levels(.))) %>%
    {
      tmp <- table(.)
      tibble(direction = names(tmp),
             count = as.numeric(tmp))
    } %>%
    
    #We only calculated the right side of the compass
    #We go off the assumption that any road that
    #orients east also orients west
    #orients North East also orients South West
    #orients Southe East also orients North West
    {
      rbind(
        .,
        mutate(.,
               direction = paste0('-', direction))
      ) %>%
        mutate(direction = factor(direction, direction))
    }
}

#plot the 
plot_entropy <- function(x, title){
  ggplot(x) +
    geom_col(aes(x = direction, y = count)) +
    coord_polar() + 
    # # let's nudge the coordinates a bit so that north is pointing straight up
    # # coord_polar(start = -2 * pi / nrow(x) / 2) +
    theme_bw() +
    labs(title = title)
}

get_city_graph <- function(city, road_types){
  city_bbox <- getbb(city)
  
  city_roads <- road_types %>%
    setNames(., .) %>%
    map(function(x){
      opq(bbox = city_bbox) %>%
        add_osm_feature(key = 'highway', value = x) %>%
        osmdata_sf() 
    }) %>%
    do.call(c, .) %>%
    .$osm_lines %>%
    select(geometry, highway)
  
  city_g <- city_roads %>%
    as('Spatial') %>%
    SpatialLinesNetwork() %>%
    .@g %>%
    set_vertex_attr('x', value = .$x) %>%
    set_vertex_attr('y', value = .$y)
}

#==============================#
#------ DC Info ---------------#
#==============================#

dc_g <- get_city_graph('Washington, DC',  c("primary", "secondary", "tertiary"))
plot(dc_g, vertex.size = .1, vertex.label = '')

dc_l <- c(V(dc_g)$x, V(dc_g)$y) %>%
  matrix(ncol = 2)

dc_custom <- customize_graph(dc_g, dc_l)
dc_orientation <- graph_orientation(dc_custom, 12)
plot(dc_custom, vertex.size = .1)
plot_entropy(dc_orientation, title = "DC")

#==============================#
#--- Charlotte Info -----------#
#==============================#

charlotte_g <- get_city_graph('Charlotte, NC', 
                              c("primary", "secondary", "tertiary"))
plot(charlotte_g, vertex.size = .1, vertex.label = '')

charlotte_l <- c(V(charlotte_g)$x, V(charlotte_g)$y) %>%
  matrix(ncol = 2)

charlotte_custom <- customize_graph(charlotte_g, charlotte_l)
charlotte_orientation <- graph_orientation(charlotte_custom, 10)
plot(charlotte_custom, vertex.size = .1)
plot_entropy(charlotte_orientation, title = "Charlotte, NC")


cities <- c('Washington, DC', 
            'Philadelphia, PA', 
            "New Haven, CT", 
            "New York, New York", 
            "Boston, MA", 
            "Santiago, Chile")

city_graphs <- map(setNames(cities, cities), function(cty){
  get_city_graph(cty, 
                 c("primary", "secondary", "tertiary"))
})

saveRDS(city_graphs, 'city_graphs.rds')

map2(city_graphs, names(city_graphs), function(cg, nm){
  cg_l <- c(V(cg)$x, V(cg)$y) %>%
    matrix(ncol = 2)
  
  cg_custom <- customize_graph(cg, cg_l)
  
  cg_orientation <- graph_orientation(cg_custom, 10)
  
  png(str_c(str_replace_all(nm, ' ', '_'), '_graph.png'))
  # cairo_pdf(str_c(str_replace_all(nm, ' ', '_'), '_graph.pdf'), 8, 11)
  print(
    plot(cg_custom, vertex.size = .1)
  )
  dev.off()
  
  png(str_c(str_replace_all(nm, ' ', '_'), '_entropy.png'))
  # cairo_pdf(str_c(str_replace_all(nm, ' ', '_'), '_entropy.pdf'), 8, 11)
  print(
    plot_entropy(cg_orientation, title = nm)
  )
  dev.off()
})
