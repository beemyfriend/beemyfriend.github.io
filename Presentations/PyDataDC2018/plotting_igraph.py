from igraph import *
import pandas as pd
import random

sw = pd.read_csv('char_film_starwars.csv')
nl = list(set(sw['name'])) + list(set(sw['films']))
el = list(zip(sw['name'], sw["films"]))

sw_g = Graph()
sw_g.add_vertices(nl)
sw_g.vs['type'] = [(n in list(sw['name'])) for n in sw_g.vs['name']]
sw_g.add_edges(el)

sw_films, sw_char = sw_g.bipartite_projection()
sw_films['name'] = "Film Projection"
sw_films['info'] = "Vertices are Star Wars films.\nEdge weights are number of characters shared between films."

sw_char['name'] = "Character Projection"
sw_char['info'] = "Vertices"


random.seed(4321)
film_layout = sw_films.layout_fruchterman_reingold()
max_film_weight = max(sw_films.es['weight'])

plot(sw_films,
     layout = film_layout,
     vertex_label = sw_films.vs['name'],
     edge_width = [w/max_film_weight * 10 for w in sw_films.es['weight']])

char_layout = sw_char.layout_fruchterman_reingold()
max_char_weight = max(sw_char.es['weight'])
plot(sw_char,
     layout = char_layout,
     vertex_label = sw_char.vs['name'],
     edge_width = [w/max_char_weight * 10 for w in sw_char.es['weight']])

edges_lt4 = sw_char.es.select(weight_lt = 3).indices
sw_char.delete_edges(edges_lt4)
sw_char.delete_vertices(sw_char.vs.select(_degree = 0))

char_layout = sw_char.layout_fruchterman_reingold()
max_char_weight = max(sw_char.es['weight'])
plot(sw_char,
     layout = char_layout,
     vertex_label = sw_char.vs['name'],
     edge_width = [w/max_char_weight * 4 for w in sw_char.es['weight']],
     margin = 20)
