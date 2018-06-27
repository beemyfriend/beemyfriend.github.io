2013 PEW LGBTQ Survey ...but as a graph
========================================================
author: Benjamin Ortiz Ulloa
date: 
autosize: true

<style>
.small-code pre code {
  font-size: 1em;
}

.myTable td {  /* Table  */
  font-size: 17px;
}

normal-text ol {
  font-size: 10px
}
</style>


What's a Graph?
========================================================

![plot of chunk unnamed-chunk-1](2013_LGBTQ_SURVEY-figure/unnamed-chunk-1-1.png)

What's a Graph?
========================================================

![plot of chunk unnamed-chunk-2](2013_LGBTQ_SURVEY-figure/unnamed-chunk-2-1.png)

What's a Graph?
========================================================

![plot of chunk unnamed-chunk-3](2013_LGBTQ_SURVEY-figure/unnamed-chunk-3-1.png)

What's a Graph?
============
![plot of chunk unnamed-chunk-4](2013_LGBTQ_SURVEY-figure/unnamed-chunk-4-1.png)

What's a Graph?
============
![plot of chunk unnamed-chunk-5](2013_LGBTQ_SURVEY-figure/unnamed-chunk-5-1.png)

What's a Graph?
============
![plot of chunk unnamed-chunk-6](2013_LGBTQ_SURVEY-figure/unnamed-chunk-6-1.png)

What's a Graph?
============
![plot of chunk unnamed-chunk-7](2013_LGBTQ_SURVEY-figure/unnamed-chunk-7-1.png)

What's a Graph?
============
![plot of chunk unnamed-chunk-8](2013_LGBTQ_SURVEY-figure/unnamed-chunk-8-1.png)

What's a Graph?
============
![plot of chunk unnamed-chunk-9](2013_LGBTQ_SURVEY-figure/unnamed-chunk-9-1.png)

What's a Graph?
============
![plot of chunk unnamed-chunk-10](2013_LGBTQ_SURVEY-figure/unnamed-chunk-10-1.png)

Why graph? Social Network Analysis
=========
![plot of chunk unnamed-chunk-11](2013_LGBTQ_SURVEY-figure/unnamed-chunk-11-1.png)

Why graph? Maps, paths, and supply chains
========
![plot of chunk unnamed-chunk-12](2013_LGBTQ_SURVEY-figure/unnamed-chunk-12-1.png)

Why graph? Recommendation Systems
==========
![plot of chunk unnamed-chunk-13](2013_LGBTQ_SURVEY-figure/unnamed-chunk-13-1.png)

Why graph? Recommendation Systems
============
![plot of chunk unnamed-chunk-14](2013_LGBTQ_SURVEY-figure/unnamed-chunk-14-1.png)

Why graph? Recommendation Systems
============
![plot of chunk unnamed-chunk-15](2013_LGBTQ_SURVEY-figure/unnamed-chunk-15-1.png)

Data
======
Online survey of self-identified lesbian, gay, bisexual and transgender adults in the U.S., ages 18 or older. 

Sample sizes:
+  Full sample =1,197
+  Gay men n=398
+  Lesbians n=277
+  Bisexuals n=479
+  Transgender adults n=43

[http://www.pewsocialtrends.org/2014/09/18/2013-survey-of-lgbt-adults/]()

Data
==== 
class:small-code
It's a `.sav`  file (SPSS), but luckily the **foreign** package in **R** can import it painlessly. 


```r
foreign::read.spss('pew2013lgbtpublicdatarelease.sav') %>%
  as.tibble() -> survey
```


Data
====

```
[1] 1197  181
```



| NEWCASEID|Q1            |Q2              |Q3_A               |Q3_B               |Q3_C               |Q3_D               |
|---------:|:-------------|:---------------|:------------------|:------------------|:------------------|:------------------|
|         1|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|         2|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|         3|Not too happy |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|         4|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |
|         5|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|         6|Pretty happy  |Wrong track     |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |
|         7|Pretty happy  |Wrong track     |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|         8|Pretty happy  |Right direction |Mostly favorable   |Mostly unfavorable |Very unfavorable   |Mostly unfavorable |
|         9|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|        10|Very happy    |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Very favorable     |
|        11|Very happy    |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|        12|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|        13|Very happy    |Right direction |Very favorable     |Very favorable     |Very unfavorable   |Mostly favorable   |
|        14|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|        15|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|        16|Very happy    |Wrong track     |Very unfavorable   |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |
|        17|Not too happy |Wrong track     |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |Mostly favorable   |
|        18|Very happy    |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|        19|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|        20|Not too happy |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|        21|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|        22|Pretty happy  |Wrong track     |Very unfavorable   |Very unfavorable   |Mostly unfavorable |Mostly unfavorable |
|        23|Very happy    |Right direction |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |
|        24|Pretty happy  |Wrong track     |Mostly unfavorable |Very unfavorable   |Mostly unfavorable |Mostly unfavorable |
|        25|Very happy    |Wrong track     |Very unfavorable   |Very unfavorable   |Very unfavorable   |Mostly unfavorable |
|        26|Not too happy |Wrong track     |Very unfavorable   |Very unfavorable   |Very unfavorable   |Mostly favorable   |
|        27|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|        28|Pretty happy  |Right direction |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |
|        29|Pretty happy  |Right direction |Mostly favorable   |Very unfavorable   |Very unfavorable   |Mostly favorable   |
|        30|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|        31|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|        32|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|        33|Very happy    |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|        34|Pretty happy  |Wrong track     |Very unfavorable   |Very unfavorable   |Mostly unfavorable |Mostly unfavorable |
|        35|Very happy    |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|        36|Very happy    |Right direction |Very favorable     |Very favorable     |Very unfavorable   |Mostly favorable   |
|        37|Pretty happy  |Right direction |Very favorable     |Very favorable     |Very unfavorable   |Mostly favorable   |
|        38|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|        39|Not too happy |Wrong track     |Mostly unfavorable |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|        40|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|        41|Very happy    |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|        42|Pretty happy  |Wrong track     |Mostly favorable   |Mostly unfavorable |Very unfavorable   |Mostly unfavorable |
|        43|Pretty happy  |Wrong track     |Mostly unfavorable |Mostly unfavorable |Very unfavorable   |Mostly favorable   |
|        44|Pretty happy  |Right direction |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |
|        45|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|        46|Very happy    |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|        47|Very happy    |Right direction |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|        48|Very happy    |Right direction |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|        49|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|        50|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|        51|Pretty happy  |Right direction |Very favorable     |Very favorable     |Very unfavorable   |Mostly favorable   |
|        52|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |
|        53|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|        54|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |
|        55|Pretty happy  |Wrong track     |Very unfavorable   |Very unfavorable   |Mostly favorable   |Mostly unfavorable |
|        56|Pretty happy  |Right direction |Very favorable     |Very favorable     |Very unfavorable   |Mostly favorable   |
|        57|Pretty happy  |Wrong track     |Mostly favorable   |Mostly unfavorable |Very unfavorable   |Mostly unfavorable |
|        58|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|        59|Pretty happy  |Wrong track     |Very unfavorable   |Very unfavorable   |Very unfavorable   |Very unfavorable   |
|        60|Very happy    |Right direction |Mostly favorable   |Mostly favorable   |Mostly favorable   |Mostly favorable   |
|        61|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|        62|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Very unfavorable   |
|        63|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Mostly favorable   |Mostly favorable   |
|        64|Very happy    |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|        65|Pretty happy  |Wrong track     |Mostly favorable   |Very unfavorable   |Very unfavorable   |Mostly unfavorable |
|        66|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Mostly favorable   |Mostly favorable   |
|        67|Very happy    |Wrong track     |Very unfavorable   |Mostly unfavorable |Mostly unfavorable |Very unfavorable   |
|        68|Pretty happy  |Wrong track     |Mostly unfavorable |Very unfavorable   |Mostly favorable   |Mostly favorable   |
|        69|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|        70|Not too happy |Wrong track     |Very unfavorable   |Very unfavorable   |Mostly favorable   |Mostly favorable   |
|        71|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|        72|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|        73|Very happy    |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|        74|Pretty happy  |Wrong track     |Very unfavorable   |Very unfavorable   |Very unfavorable   |Very unfavorable   |
|        75|Very happy    |Right direction |Very favorable     |Very favorable     |Mostly unfavorable |Mostly favorable   |
|        76|Pretty happy  |Right direction |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |Mostly favorable   |
|        77|Pretty happy  |Wrong track     |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |
|        78|Not too happy |Right direction |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |
|        79|Very happy    |Wrong track     |Very unfavorable   |Very unfavorable   |Very unfavorable   |Very unfavorable   |
|        80|Pretty happy  |Wrong track     |Very unfavorable   |Very unfavorable   |Mostly favorable   |Mostly favorable   |
|        81|Not too happy |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|        82|Pretty happy  |Wrong track     |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|        83|Very happy    |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|        84|Not too happy |Right direction |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|        85|Very happy    |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|        86|Not too happy |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Very unfavorable   |
|        87|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|        88|Not too happy |Wrong track     |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |
|        89|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|        90|Very happy    |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|        91|Pretty happy  |Wrong track     |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|        92|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|        93|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|        94|Not too happy |Wrong track     |Mostly unfavorable |Very unfavorable   |Very unfavorable   |Mostly favorable   |
|        95|Very happy    |Right direction |Very favorable     |Very favorable     |Very unfavorable   |Mostly favorable   |
|        96|Pretty happy  |Wrong track     |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |
|        97|Not too happy |Wrong track     |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |
|        98|Pretty happy  |Right direction |Very favorable     |Mostly unfavorable |Very unfavorable   |Mostly favorable   |
|        99|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       100|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       101|Very happy    |Right direction |Very favorable     |Mostly favorable   |Mostly favorable   |Mostly favorable   |
|       102|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       103|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       104|Not too happy |Wrong track     |Mostly favorable   |Mostly favorable   |Mostly favorable   |Mostly favorable   |
|       105|Very happy    |Wrong track     |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |
|       106|Pretty happy  |Right direction |Very favorable     |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |
|       107|Not too happy |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       108|Very happy    |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       109|Pretty happy  |Right direction |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |
|       110|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       111|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       112|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       113|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       114|Pretty happy  |Wrong track     |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       115|Pretty happy  |Wrong track     |Very unfavorable   |Very unfavorable   |Mostly unfavorable |Mostly unfavorable |
|       116|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |
|       117|Not too happy |Wrong track     |Very favorable     |Very favorable     |Very unfavorable   |Mostly favorable   |
|       118|Pretty happy  |Wrong track     |Mostly unfavorable |Mostly unfavorable |Very unfavorable   |Mostly unfavorable |
|       119|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       120|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Refused            |
|       121|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       122|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       123|Not too happy |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       124|Pretty happy  |Wrong track     |Very unfavorable   |Very unfavorable   |Mostly unfavorable |Mostly unfavorable |
|       125|Very happy    |Wrong track     |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |
|       126|Not too happy |Wrong track     |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       127|Pretty happy  |Wrong track     |Very unfavorable   |Very unfavorable   |Very unfavorable   |Mostly unfavorable |
|       128|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       129|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       130|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       131|Pretty happy  |Wrong track     |Mostly favorable   |Refused            |Very unfavorable   |Mostly favorable   |
|       132|Pretty happy  |Wrong track     |Very unfavorable   |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |
|       133|Not too happy |Right direction |Mostly favorable   |Mostly unfavorable |Very unfavorable   |Mostly favorable   |
|       134|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       135|Very happy    |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       136|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       137|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       138|Very happy    |Wrong track     |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |
|       139|Pretty happy  |Right direction |Mostly favorable   |Very favorable     |Very favorable     |Mostly favorable   |
|       140|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       141|Pretty happy  |Wrong track     |Very unfavorable   |Very unfavorable   |Mostly favorable   |Mostly unfavorable |
|       142|Very happy    |Right direction |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       143|Very happy    |Wrong track     |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |
|       144|Not too happy |Right direction |Mostly favorable   |Mostly unfavorable |Very unfavorable   |Mostly unfavorable |
|       145|Very happy    |Right direction |Mostly favorable   |Mostly favorable   |Mostly favorable   |Mostly favorable   |
|       146|Very happy    |Wrong track     |Mostly favorable   |Mostly unfavorable |Mostly favorable   |Mostly favorable   |
|       147|Very happy    |Wrong track     |Very unfavorable   |Very unfavorable   |Very unfavorable   |Very unfavorable   |
|       148|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       149|Not too happy |Wrong track     |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       150|Very happy    |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       151|Pretty happy  |Wrong track     |Very unfavorable   |Very unfavorable   |Very unfavorable   |Very unfavorable   |
|       152|Not too happy |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       153|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       154|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       155|Very happy    |Right direction |Very favorable     |Very favorable     |Very unfavorable   |Mostly favorable   |
|       156|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       157|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       158|Not too happy |Right direction |Mostly favorable   |Mostly unfavorable |Very unfavorable   |Mostly favorable   |
|       159|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Mostly favorable   |Mostly favorable   |
|       160|Very happy    |Right direction |Mostly favorable   |Mostly unfavorable |Very unfavorable   |Mostly unfavorable |
|       161|Pretty happy  |Right direction |Very favorable     |Very favorable     |Very unfavorable   |Mostly favorable   |
|       162|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       163|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       164|Very happy    |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       165|Pretty happy  |Wrong track     |Very unfavorable   |Very unfavorable   |Mostly unfavorable |Mostly unfavorable |
|       166|Pretty happy  |Wrong track     |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |
|       167|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       168|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |
|       169|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       170|Pretty happy  |Wrong track     |Very unfavorable   |Very unfavorable   |Mostly unfavorable |Mostly unfavorable |
|       171|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       172|Very happy    |Wrong track     |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       173|Pretty happy  |Wrong track     |Very favorable     |Mostly unfavorable |Very unfavorable   |Mostly favorable   |
|       174|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       175|Very happy    |Right direction |Mostly favorable   |Very favorable     |Very unfavorable   |Mostly favorable   |
|       176|Very happy    |Right direction |Very favorable     |Very favorable     |Mostly unfavorable |Mostly favorable   |
|       177|Not too happy |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       178|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       179|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       180|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       181|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       182|Very happy    |Wrong track     |Very unfavorable   |Very unfavorable   |Mostly favorable   |Mostly favorable   |
|       183|Not too happy |Right direction |Very favorable     |Very favorable     |Very unfavorable   |Mostly favorable   |
|       184|Not too happy |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       185|Not too happy |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       186|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       187|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       188|Pretty happy  |Wrong track     |Very favorable     |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |
|       189|Very happy    |Right direction |Very favorable     |Very favorable     |Very unfavorable   |Very favorable     |
|       190|Not too happy |Wrong track     |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |
|       191|Pretty happy  |Right direction |Very favorable     |Very favorable     |Very unfavorable   |Mostly favorable   |
|       192|Not too happy |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       193|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       194|Very happy    |Right direction |Very favorable     |Mostly favorable   |Mostly unfavorable |Very favorable     |
|       195|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       196|Not too happy |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       197|Very happy    |Right direction |Very favorable     |Very favorable     |Very unfavorable   |Mostly favorable   |
|       198|Not too happy |Wrong track     |Very unfavorable   |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |
|       199|Very happy    |Wrong track     |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |
|       200|Pretty happy  |Right direction |Very unfavorable   |Very unfavorable   |Very unfavorable   |Very unfavorable   |
|       201|Very happy    |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       202|Very happy    |Right direction |Mostly favorable   |Mostly unfavorable |Very unfavorable   |Mostly favorable   |
|       203|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       204|Pretty happy  |Right direction |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |
|       205|Very happy    |Wrong track     |Very favorable     |Mostly unfavorable |Very unfavorable   |Mostly unfavorable |
|       206|Very happy    |Right direction |Very favorable     |Very favorable     |Very unfavorable   |Mostly unfavorable |
|       207|Not too happy |Wrong track     |Mostly favorable   |Mostly unfavorable |Very unfavorable   |Mostly unfavorable |
|       208|Very happy    |Right direction |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       209|Pretty happy  |Wrong track     |Mostly unfavorable |Mostly unfavorable |Very unfavorable   |Mostly unfavorable |
|       210|Pretty happy  |Wrong track     |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       211|Pretty happy  |Wrong track     |Mostly unfavorable |Very unfavorable   |Mostly unfavorable |Mostly unfavorable |
|       212|Very happy    |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       213|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       214|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       215|Not too happy |Wrong track     |Very unfavorable   |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |
|       216|Pretty happy  |Wrong track     |Mostly favorable   |Mostly unfavorable |Very unfavorable   |Very unfavorable   |
|       217|Pretty happy  |Wrong track     |Mostly favorable   |Mostly unfavorable |Very unfavorable   |Mostly favorable   |
|       218|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       219|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       220|Very happy    |Right direction |Very favorable     |Very favorable     |Mostly unfavorable |Mostly favorable   |
|       221|Pretty happy  |Right direction |Very favorable     |Very favorable     |Very unfavorable   |Mostly favorable   |
|       222|Very happy    |Wrong track     |Very favorable     |Very favorable     |Very unfavorable   |Mostly unfavorable |
|       223|Very happy    |Right direction |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |
|       224|Very happy    |Wrong track     |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |
|       225|Pretty happy  |Right direction |Mostly unfavorable |Very unfavorable   |Mostly unfavorable |Mostly unfavorable |
|       226|Pretty happy  |Wrong track     |Very unfavorable   |Mostly unfavorable |Mostly favorable   |Mostly favorable   |
|       227|Very happy    |Wrong track     |Very unfavorable   |Very unfavorable   |Mostly favorable   |Very unfavorable   |
|       228|Pretty happy  |Right direction |Very favorable     |Very favorable     |Very unfavorable   |Mostly unfavorable |
|       229|Pretty happy  |Wrong track     |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |
|       230|Pretty happy  |Right direction |Very favorable     |Very favorable     |Very unfavorable   |Mostly unfavorable |
|       231|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       232|Very happy    |Right direction |Very favorable     |Mostly unfavorable |Very unfavorable   |Mostly favorable   |
|       233|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       234|Very happy    |Right direction |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       235|Pretty happy  |Wrong track     |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |
|       236|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       237|Pretty happy  |Wrong track     |Very unfavorable   |Mostly unfavorable |Mostly favorable   |Mostly favorable   |
|       238|Very happy    |Wrong track     |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |
|       239|Not too happy |Wrong track     |Mostly unfavorable |Very unfavorable   |Mostly unfavorable |Very favorable     |
|       240|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       241|Very happy    |Right direction |Very favorable     |Very favorable     |Very unfavorable   |Mostly favorable   |
|       242|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       243|Pretty happy  |Wrong track     |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |
|       244|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       245|Very happy    |Right direction |Mostly favorable   |Mostly unfavorable |Very unfavorable   |Mostly favorable   |
|       246|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       247|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       248|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       249|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       250|Very happy    |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       251|Pretty happy  |Right direction |Very favorable     |Very favorable     |Very unfavorable   |Very favorable     |
|       252|Pretty happy  |Refused         |Mostly favorable   |Mostly unfavorable |Mostly favorable   |Mostly favorable   |
|       253|Pretty happy  |Wrong track     |Mostly unfavorable |Mostly favorable   |Mostly unfavorable |Very unfavorable   |
|       254|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       255|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       256|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       257|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       258|Very happy    |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       259|Pretty happy  |Wrong track     |Mostly favorable   |Very unfavorable   |Very unfavorable   |Mostly favorable   |
|       260|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       261|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       262|Pretty happy  |Wrong track     |Very unfavorable   |Very unfavorable   |Very unfavorable   |Mostly unfavorable |
|       263|Very happy    |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       264|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       265|Very happy    |Right direction |Very favorable     |Very favorable     |Mostly unfavorable |Mostly favorable   |
|       266|Pretty happy  |Wrong track     |Very unfavorable   |Very unfavorable   |Mostly unfavorable |Mostly unfavorable |
|       267|Very happy    |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       268|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       269|Pretty happy  |Right direction |Mostly favorable   |Mostly unfavorable |Very unfavorable   |Mostly favorable   |
|       270|Pretty happy  |Wrong track     |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |
|       271|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       272|Very happy    |Right direction |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       273|Very happy    |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       274|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Very favorable     |
|       275|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       276|Very happy    |Wrong track     |Very unfavorable   |Very unfavorable   |Mostly unfavorable |Mostly unfavorable |
|       277|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       278|Very happy    |Wrong track     |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |
|       279|Not too happy |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       280|Very happy    |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       281|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       282|Not too happy |Wrong track     |Very unfavorable   |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |
|       283|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       284|Pretty happy  |Right direction |Very favorable     |Very favorable     |Very unfavorable   |Mostly favorable   |
|       285|Pretty happy  |Right direction |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |
|       286|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       287|Very happy    |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       288|Pretty happy  |Wrong track     |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |
|       289|Pretty happy  |Wrong track     |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |
|       290|Pretty happy  |Wrong track     |Mostly unfavorable |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       291|Very happy    |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       292|Pretty happy  |Wrong track     |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |
|       293|Pretty happy  |Wrong track     |Very unfavorable   |Very unfavorable   |Very unfavorable   |Very unfavorable   |
|       294|Pretty happy  |Right direction |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |
|       295|Very happy    |Wrong track     |Very favorable     |Very favorable     |Very unfavorable   |Mostly unfavorable |
|       296|Not too happy |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       297|Pretty happy  |Wrong track     |Very unfavorable   |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |
|       298|Very happy    |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       299|Pretty happy  |Wrong track     |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |
|       300|Very happy    |Right direction |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       301|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       302|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       303|Not too happy |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       304|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       305|Pretty happy  |Right direction |Mostly favorable   |Mostly unfavorable |Very unfavorable   |Mostly unfavorable |
|       306|Very happy    |Right direction |Mostly unfavorable |Mostly favorable   |Mostly favorable   |Mostly unfavorable |
|       307|Very happy    |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |
|       308|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |
|       309|Pretty happy  |Right direction |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |
|       310|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       311|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       312|Very happy    |Wrong track     |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       313|Not too happy |Wrong track     |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       314|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       315|Very happy    |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |
|       316|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       317|Very happy    |Right direction |Very favorable     |Very favorable     |Mostly unfavorable |Mostly favorable   |
|       318|Very happy    |Wrong track     |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       319|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       320|Very happy    |Wrong track     |Very unfavorable   |Very unfavorable   |Mostly unfavorable |Very unfavorable   |
|       321|Pretty happy  |Wrong track     |Mostly unfavorable |Mostly unfavorable |Very unfavorable   |Mostly unfavorable |
|       322|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Mostly favorable   |Mostly favorable   |
|       323|Very happy    |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       324|Pretty happy  |Right direction |Very favorable     |Very favorable     |Very unfavorable   |Mostly unfavorable |
|       325|Pretty happy  |Wrong track     |Mostly favorable   |Mostly unfavorable |Very unfavorable   |Very favorable     |
|       326|Very happy    |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       327|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       328|Pretty happy  |Right direction |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |
|       329|Pretty happy  |Wrong track     |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       330|Not too happy |Right direction |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       331|Pretty happy  |Right direction |Mostly favorable   |Very favorable     |Mostly unfavorable |Mostly favorable   |
|       332|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       333|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       334|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       335|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |
|       336|Not too happy |Wrong track     |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       337|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       338|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       339|Not too happy |Wrong track     |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       340|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       341|Not too happy |Wrong track     |Mostly favorable   |Mostly unfavorable |Very unfavorable   |Mostly unfavorable |
|       342|Not too happy |Wrong track     |Very unfavorable   |Very unfavorable   |Mostly unfavorable |Mostly unfavorable |
|       343|Very happy    |Right direction |Mostly favorable   |Mostly favorable   |Mostly favorable   |Mostly favorable   |
|       344|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Mostly favorable   |Mostly unfavorable |
|       345|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       346|Pretty happy  |Wrong track     |Mostly favorable   |Mostly unfavorable |Very unfavorable   |Mostly unfavorable |
|       347|Pretty happy  |Right direction |Very favorable     |Very favorable     |Very unfavorable   |Mostly favorable   |
|       348|Not too happy |Wrong track     |Very unfavorable   |Mostly unfavorable |Very unfavorable   |Very unfavorable   |
|       349|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Mostly unfavorable |Very favorable     |
|       350|Very happy    |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       351|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       352|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       353|Pretty happy  |Right direction |Mostly unfavorable |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |
|       354|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       355|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       356|Very happy    |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       357|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       358|Very happy    |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       359|Very happy    |Wrong track     |Very unfavorable   |Very unfavorable   |Mostly favorable   |Very favorable     |
|       360|Very happy    |Right direction |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       361|Pretty happy  |Right direction |Mostly favorable   |Mostly unfavorable |Very unfavorable   |Mostly unfavorable |
|       362|Pretty happy  |Wrong track     |Mostly favorable   |Mostly unfavorable |Very unfavorable   |Mostly favorable   |
|       363|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       364|Not too happy |Wrong track     |Mostly favorable   |Mostly unfavorable |Very unfavorable   |Mostly unfavorable |
|       365|Very happy    |Wrong track     |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |Mostly favorable   |
|       366|Pretty happy  |Right direction |Very unfavorable   |Very unfavorable   |Mostly favorable   |Very favorable     |
|       367|Pretty happy  |Wrong track     |Very unfavorable   |Very unfavorable   |Very unfavorable   |Very unfavorable   |
|       368|Pretty happy  |Wrong track     |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       369|Pretty happy  |Right direction |Very favorable     |Very favorable     |Mostly unfavorable |Mostly favorable   |
|       370|Not too happy |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       371|Not too happy |Wrong track     |Mostly favorable   |Mostly unfavorable |Very unfavorable   |Mostly favorable   |
|       372|Pretty happy  |Wrong track     |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |
|       373|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       374|Very happy    |Wrong track     |Very unfavorable   |Very favorable     |Very unfavorable   |Very unfavorable   |
|       375|Pretty happy  |Wrong track     |Very unfavorable   |Very unfavorable   |Very unfavorable   |Very unfavorable   |
|       376|Pretty happy  |Right direction |Very favorable     |Very favorable     |Mostly favorable   |Very favorable     |
|       377|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       378|Pretty happy  |Wrong track     |Mostly favorable   |Mostly unfavorable |Very unfavorable   |Very unfavorable   |
|       379|Pretty happy  |Right direction |Very favorable     |Very favorable     |Very unfavorable   |Mostly favorable   |
|       380|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       381|Very happy    |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       382|Very happy    |Right direction |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |
|       383|Very happy    |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       384|Very happy    |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       385|Not too happy |Wrong track     |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       386|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       387|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       388|Very happy    |Wrong track     |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       389|Not too happy |Right direction |Very favorable     |Very favorable     |Mostly favorable   |Mostly favorable   |
|       390|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       391|Pretty happy  |Right direction |Very favorable     |Very favorable     |Very unfavorable   |Mostly favorable   |
|       392|Not too happy |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       393|Pretty happy  |Wrong track     |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |
|       394|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Mostly favorable   |Mostly favorable   |
|       395|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       396|Pretty happy  |Wrong track     |Very unfavorable   |Very unfavorable   |Mostly favorable   |Very unfavorable   |
|       397|Pretty happy  |Wrong track     |Very unfavorable   |Very unfavorable   |Very unfavorable   |Very unfavorable   |
|       398|Very happy    |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       399|Very happy    |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       400|Not too happy |Wrong track     |Mostly unfavorable |Mostly unfavorable |Very unfavorable   |Very unfavorable   |
|       401|Pretty happy  |Right direction |Very favorable     |Very favorable     |Very unfavorable   |Mostly unfavorable |
|       402|Not too happy |Wrong track     |Mostly favorable   |Mostly favorable   |Mostly favorable   |Mostly favorable   |
|       403|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       404|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Very unfavorable   |
|       405|Very happy    |Right direction |Mostly favorable   |Mostly unfavorable |Very unfavorable   |Very favorable     |
|       406|Very happy    |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       407|Pretty happy  |Wrong track     |Mostly unfavorable |Mostly unfavorable |Very unfavorable   |Mostly unfavorable |
|       408|Not too happy |Wrong track     |Very favorable     |Very favorable     |Very unfavorable   |Very favorable     |
|       409|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       410|Pretty happy  |Right direction |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |
|       411|Pretty happy  |Right direction |Very favorable     |Very favorable     |Mostly unfavorable |Mostly favorable   |
|       412|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       413|Not too happy |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       414|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |
|       415|Very happy    |Wrong track     |Mostly unfavorable |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       416|Not too happy |Wrong track     |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |
|       417|Not too happy |Wrong track     |Mostly unfavorable |Very favorable     |Very unfavorable   |Mostly favorable   |
|       418|Very happy    |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       419|Not too happy |Wrong track     |Mostly favorable   |Very favorable     |Very unfavorable   |Mostly unfavorable |
|       420|Not too happy |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       421|Very happy    |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       422|Pretty happy  |Right direction |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |
|       423|Not too happy |Right direction |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       424|Pretty happy  |Wrong track     |Mostly favorable   |Mostly unfavorable |Very unfavorable   |Mostly favorable   |
|       425|Pretty happy  |Wrong track     |Very favorable     |Very favorable     |Very unfavorable   |Mostly favorable   |
|       426|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       427|Very happy    |Wrong track     |Very unfavorable   |Very unfavorable   |Mostly favorable   |Very unfavorable   |
|       428|Not too happy |Wrong track     |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |
|       429|Pretty happy  |Wrong track     |Mostly unfavorable |Mostly unfavorable |Very unfavorable   |Mostly favorable   |
|       430|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       431|Very happy    |Right direction |Very favorable     |Very favorable     |Very unfavorable   |Mostly unfavorable |
|       432|Not too happy |Right direction |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |
|       433|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       434|Pretty happy  |Wrong track     |Very unfavorable   |Very unfavorable   |Very unfavorable   |Very unfavorable   |
|       435|Not too happy |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       436|Pretty happy  |Wrong track     |Very unfavorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       437|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       438|Not too happy |Right direction |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       439|Not too happy |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       440|Pretty happy  |Right direction |Very favorable     |Mostly unfavorable |Very unfavorable   |Mostly favorable   |
|       441|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       442|Pretty happy  |Wrong track     |Very unfavorable   |Very unfavorable   |Very unfavorable   |Mostly unfavorable |
|       443|Pretty happy  |Right direction |Very favorable     |Very favorable     |Mostly unfavorable |Mostly favorable   |
|       444|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       445|Very happy    |Right direction |Mostly favorable   |Very favorable     |Very unfavorable   |Mostly favorable   |
|       446|Very happy    |Wrong track     |Very unfavorable   |Very unfavorable   |Mostly favorable   |Mostly favorable   |
|       447|Not too happy |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |
|       448|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       449|Pretty happy  |Wrong track     |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |
|       450|Very happy    |Wrong track     |Very unfavorable   |Very unfavorable   |Very favorable     |Very favorable     |
|       451|Pretty happy  |Right direction |Very favorable     |Very favorable     |Mostly unfavorable |Mostly favorable   |
|       452|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       453|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |
|       454|Not too happy |Wrong track     |Mostly unfavorable |Mostly unfavorable |Very unfavorable   |Mostly unfavorable |
|       455|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       456|Pretty happy  |Wrong track     |Mostly favorable   |Very favorable     |Very unfavorable   |Mostly unfavorable |
|       457|Pretty happy  |Right direction |Very favorable     |Very favorable     |Very unfavorable   |Mostly favorable   |
|       458|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       459|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       460|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       461|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       462|Pretty happy  |Wrong track     |Very favorable     |Very favorable     |Very unfavorable   |Very favorable     |
|       463|Very happy    |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       464|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       465|Pretty happy  |Wrong track     |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |
|       466|Very happy    |Right direction |Very favorable     |Very favorable     |Very unfavorable   |Mostly favorable   |
|       467|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       468|Not too happy |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       469|Not too happy |Wrong track     |Mostly unfavorable |Very favorable     |Very unfavorable   |Mostly unfavorable |
|       470|Pretty happy  |Wrong track     |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       471|Not too happy |Right direction |Very favorable     |Very favorable     |Very unfavorable   |Mostly unfavorable |
|       472|Very happy    |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       473|Pretty happy  |Wrong track     |Very unfavorable   |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |
|       474|Very happy    |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       475|Pretty happy  |Wrong track     |Very unfavorable   |Mostly unfavorable |Mostly favorable   |Mostly favorable   |
|       476|Pretty happy  |Right direction |Refused            |Very favorable     |Very unfavorable   |Mostly favorable   |
|       477|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       478|Very happy    |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       479|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       480|Very happy    |Right direction |Very favorable     |Very favorable     |Mostly unfavorable |Mostly favorable   |
|       481|Not too happy |Wrong track     |Very unfavorable   |Very unfavorable   |Mostly favorable   |Very unfavorable   |
|       482|Not too happy |Wrong track     |Very unfavorable   |Very unfavorable   |Very unfavorable   |Very unfavorable   |
|       483|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |
|       484|Pretty happy  |Wrong track     |Very unfavorable   |Very unfavorable   |Very unfavorable   |Very unfavorable   |
|       485|Very happy    |Right direction |Very favorable     |Very favorable     |Very favorable     |Mostly favorable   |
|       486|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       487|Pretty happy  |Wrong track     |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |Mostly favorable   |
|       488|Pretty happy  |Wrong track     |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       489|Not too happy |Wrong track     |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |Mostly favorable   |
|       490|Not too happy |Right direction |Mostly favorable   |Mostly favorable   |Mostly favorable   |Mostly favorable   |
|       491|Pretty happy  |Right direction |Very favorable     |Very favorable     |Very unfavorable   |Mostly favorable   |
|       492|Not too happy |Wrong track     |Very unfavorable   |Very unfavorable   |Mostly favorable   |Mostly unfavorable |
|       493|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       494|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       495|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       496|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       497|Very happy    |Right direction |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       498|Very happy    |Right direction |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |
|       499|Very happy    |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       500|Very happy    |Right direction |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |
|       501|Pretty happy  |Wrong track     |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |
|       502|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       503|Pretty happy  |Wrong track     |Very unfavorable   |Very unfavorable   |Mostly favorable   |Very unfavorable   |
|       504|Pretty happy  |Wrong track     |Very unfavorable   |Very unfavorable   |Mostly unfavorable |Mostly unfavorable |
|       505|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       506|Pretty happy  |Right direction |Very favorable     |Very favorable     |Very unfavorable   |Very favorable     |
|       507|Pretty happy  |Right direction |Very favorable     |Very favorable     |Very unfavorable   |Mostly unfavorable |
|       508|Pretty happy  |Wrong track     |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |Mostly favorable   |
|       509|Pretty happy  |Wrong track     |Very favorable     |Very favorable     |Very unfavorable   |Mostly favorable   |
|       510|Very happy    |Right direction |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |
|       511|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       512|Pretty happy  |Right direction |Very favorable     |Very favorable     |Mostly unfavorable |Mostly favorable   |
|       513|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       514|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       515|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       516|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       517|Pretty happy  |Right direction |Very favorable     |Very favorable     |Very unfavorable   |Mostly favorable   |
|       518|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       519|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       520|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       521|Pretty happy  |Wrong track     |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       522|Pretty happy  |Right direction |Mostly favorable   |Mostly unfavorable |Very unfavorable   |Very unfavorable   |
|       523|Pretty happy  |Wrong track     |Very unfavorable   |Very unfavorable   |Very unfavorable   |Very unfavorable   |
|       524|Very happy    |Right direction |Mostly favorable   |Mostly unfavorable |Very unfavorable   |Mostly favorable   |
|       525|Pretty happy  |Wrong track     |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |
|       526|Not too happy |Wrong track     |Mostly favorable   |Mostly favorable   |Mostly favorable   |Mostly favorable   |
|       527|Pretty happy  |Right direction |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |
|       528|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       529|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       530|Pretty happy  |Wrong track     |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |Mostly unfavorable |
|       531|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       532|Very happy    |Right direction |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |
|       533|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       534|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Refused            |
|       535|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Mostly favorable   |Very favorable     |
|       536|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       537|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |
|       538|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       539|Pretty happy  |Wrong track     |Mostly favorable   |Mostly unfavorable |Very unfavorable   |Mostly unfavorable |
|       540|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       541|Pretty happy  |Wrong track     |Very unfavorable   |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |
|       542|Very happy    |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       543|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       544|Very happy    |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       545|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       546|Pretty happy  |Wrong track     |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |Mostly favorable   |
|       547|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       548|Pretty happy  |Right direction |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |Mostly favorable   |
|       549|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |
|       550|Pretty happy  |Wrong track     |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |Very unfavorable   |
|       551|Not too happy |Wrong track     |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |
|       552|Not too happy |Right direction |Mostly favorable   |Very favorable     |Very unfavorable   |Mostly favorable   |
|       553|Very happy    |Wrong track     |Mostly favorable   |Mostly favorable   |Mostly favorable   |Mostly favorable   |
|       554|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       555|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       556|Pretty happy  |Wrong track     |Mostly favorable   |Mostly unfavorable |Very unfavorable   |Mostly unfavorable |
|       557|Pretty happy  |Wrong track     |Very unfavorable   |Very unfavorable   |Mostly favorable   |Mostly favorable   |
|       558|Pretty happy  |Wrong track     |Very unfavorable   |Very unfavorable   |Very unfavorable   |Mostly unfavorable |
|       559|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Refused            |
|       560|Not too happy |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       561|Pretty happy  |Wrong track     |Mostly unfavorable |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       562|Very happy    |Right direction |Very favorable     |Very favorable     |Very unfavorable   |Mostly favorable   |
|       563|Very happy    |Wrong track     |Very unfavorable   |Very unfavorable   |Very unfavorable   |Very unfavorable   |
|       564|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       565|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       566|Pretty happy  |Wrong track     |Very unfavorable   |Very unfavorable   |Mostly unfavorable |Very unfavorable   |
|       567|Not too happy |Wrong track     |Mostly unfavorable |Mostly unfavorable |Very unfavorable   |Mostly unfavorable |
|       568|Pretty happy  |Wrong track     |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |Mostly favorable   |
|       569|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       570|Pretty happy  |Wrong track     |Very unfavorable   |Very unfavorable   |Very unfavorable   |Very unfavorable   |
|       571|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       572|Refused       |Wrong track     |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |
|       573|Very happy    |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       574|Pretty happy  |Wrong track     |Very unfavorable   |Mostly unfavorable |Very unfavorable   |Mostly unfavorable |
|       575|Pretty happy  |Wrong track     |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |
|       576|Very happy    |Right direction |Mostly favorable   |Very favorable     |Mostly unfavorable |Very favorable     |
|       577|Pretty happy  |Wrong track     |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       578|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       579|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       580|Pretty happy  |Wrong track     |Very unfavorable   |Very unfavorable   |Very unfavorable   |Very unfavorable   |
|       581|Pretty happy  |Wrong track     |Mostly unfavorable |Mostly unfavorable |Very unfavorable   |Very unfavorable   |
|       582|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       583|Pretty happy  |Wrong track     |Very unfavorable   |Very unfavorable   |Mostly favorable   |Mostly favorable   |
|       584|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       585|Not too happy |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       586|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Mostly favorable   |Mostly favorable   |
|       587|Very happy    |Right direction |Very favorable     |Very favorable     |Very unfavorable   |Mostly favorable   |
|       588|Very happy    |Right direction |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       589|Pretty happy  |Wrong track     |Mostly favorable   |Very unfavorable   |Very unfavorable   |Mostly unfavorable |
|       590|Not too happy |Wrong track     |Mostly unfavorable |Very unfavorable   |Very unfavorable   |Mostly unfavorable |
|       591|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Mostly favorable   |Mostly favorable   |
|       592|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       593|Not too happy |Right direction |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       594|Pretty happy  |Wrong track     |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       595|Very happy    |Right direction |Very favorable     |Mostly unfavorable |Mostly favorable   |Very unfavorable   |
|       596|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       597|Very happy    |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |
|       598|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Very favorable     |
|       599|Very happy    |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       600|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Mostly favorable   |Mostly favorable   |
|       601|Pretty happy  |Wrong track     |Very unfavorable   |Very unfavorable   |Very unfavorable   |Very unfavorable   |
|       602|Very happy    |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       603|Pretty happy  |Right direction |Mostly favorable   |Mostly unfavorable |Very unfavorable   |Mostly favorable   |
|       604|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       605|Very happy    |Right direction |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       606|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       607|Very happy    |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |
|       608|Not too happy |Wrong track     |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |Mostly favorable   |
|       609|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       610|Not too happy |Wrong track     |Mostly unfavorable |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       611|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       612|Very happy    |Wrong track     |Mostly favorable   |Mostly unfavorable |Very unfavorable   |Mostly unfavorable |
|       613|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       614|Pretty happy  |Right direction |Very favorable     |Very favorable     |Mostly unfavorable |Mostly favorable   |
|       615|Pretty happy  |Wrong track     |Very unfavorable   |Very unfavorable   |Mostly favorable   |Mostly unfavorable |
|       616|Very happy    |Right direction |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       617|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       618|Pretty happy  |Wrong track     |Very unfavorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       619|Very happy    |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       620|Not too happy |Right direction |Very favorable     |Mostly unfavorable |Very unfavorable   |Mostly favorable   |
|       621|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       622|Not too happy |Wrong track     |Mostly favorable   |Mostly favorable   |Refused            |Mostly unfavorable |
|       623|Very happy    |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       624|Pretty happy  |Wrong track     |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       625|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       626|Very happy    |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       627|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       628|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       629|Pretty happy  |Wrong track     |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |
|       630|Very happy    |Wrong track     |Very unfavorable   |Very unfavorable   |Mostly favorable   |Mostly favorable   |
|       631|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       632|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       633|Pretty happy  |Wrong track     |Very unfavorable   |Mostly unfavorable |Mostly favorable   |Very unfavorable   |
|       634|Pretty happy  |Wrong track     |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |
|       635|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       636|Pretty happy  |Wrong track     |Mostly favorable   |Mostly unfavorable |Very unfavorable   |Mostly unfavorable |
|       637|Pretty happy  |Wrong track     |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       638|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       639|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       640|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       641|Very happy    |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       642|Pretty happy  |Right direction |Very favorable     |Very favorable     |Very unfavorable   |Mostly favorable   |
|       643|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Refused            |
|       644|Not too happy |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       645|Not too happy |Wrong track     |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |
|       646|Very happy    |Right direction |Very favorable     |Very favorable     |Very unfavorable   |Mostly favorable   |
|       647|Pretty happy  |Wrong track     |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       648|Not too happy |Wrong track     |Mostly favorable   |Mostly unfavorable |Very unfavorable   |Mostly unfavorable |
|       649|Not too happy |Wrong track     |Mostly unfavorable |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       650|Very happy    |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       651|Pretty happy  |Wrong track     |Very unfavorable   |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |
|       652|Pretty happy  |Wrong track     |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |
|       653|Pretty happy  |Right direction |Mostly favorable   |Very favorable     |Very unfavorable   |Mostly favorable   |
|       654|Very happy    |Right direction |Very favorable     |Very favorable     |Very unfavorable   |Very favorable     |
|       655|Pretty happy  |Wrong track     |Mostly unfavorable |Mostly favorable   |Very unfavorable   |Very unfavorable   |
|       656|Pretty happy  |Right direction |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |
|       657|Very happy    |Right direction |Mostly favorable   |Very favorable     |Mostly favorable   |Mostly favorable   |
|       658|Very happy    |Right direction |Very favorable     |Very favorable     |Very unfavorable   |Mostly unfavorable |
|       659|Pretty happy  |Wrong track     |Mostly favorable   |Very unfavorable   |Very unfavorable   |Mostly favorable   |
|       660|Very happy    |Right direction |Very favorable     |Very favorable     |Mostly unfavorable |Mostly favorable   |
|       661|Pretty happy  |Wrong track     |Very unfavorable   |Very unfavorable   |Very unfavorable   |Very unfavorable   |
|       662|Not too happy |Wrong track     |Mostly favorable   |Mostly unfavorable |Very unfavorable   |Mostly unfavorable |
|       663|Not too happy |Right direction |Mostly favorable   |Mostly favorable   |Mostly favorable   |Very favorable     |
|       664|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Mostly favorable   |Mostly favorable   |
|       665|Very happy    |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       666|Pretty happy  |Right direction |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |
|       667|Not too happy |Right direction |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |
|       668|Pretty happy  |Wrong track     |Mostly unfavorable |Mostly favorable   |Mostly favorable   |Mostly unfavorable |
|       669|Very happy    |Right direction |Very favorable     |Very favorable     |Very favorable     |Very favorable     |
|       670|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       671|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       672|Not too happy |Wrong track     |Very unfavorable   |Very unfavorable   |Mostly favorable   |Mostly unfavorable |
|       673|Very happy    |Wrong track     |Very unfavorable   |Very unfavorable   |Mostly favorable   |Mostly favorable   |
|       674|Very happy    |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Very favorable     |
|       675|Not too happy |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       676|Pretty happy  |Right direction |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |
|       677|Not too happy |Wrong track     |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |Mostly unfavorable |
|       678|Pretty happy  |Wrong track     |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       679|Very happy    |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       680|Pretty happy  |Right direction |Very favorable     |Very favorable     |Mostly unfavorable |Mostly favorable   |
|       681|Pretty happy  |Wrong track     |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |
|       682|Pretty happy  |Right direction |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |
|       683|Very happy    |Wrong track     |Very unfavorable   |Very unfavorable   |Very unfavorable   |Very unfavorable   |
|       684|Pretty happy  |Wrong track     |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |Mostly favorable   |
|       685|Very happy    |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       686|Pretty happy  |Wrong track     |Very favorable     |Very favorable     |Very unfavorable   |Refused            |
|       687|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       688|Not too happy |Wrong track     |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       689|Pretty happy  |Wrong track     |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |
|       690|Not too happy |Wrong track     |Very unfavorable   |Very unfavorable   |Very unfavorable   |Very unfavorable   |
|       691|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       692|Very happy    |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       693|Pretty happy  |Wrong track     |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |Mostly favorable   |
|       694|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       695|Very happy    |Right direction |Mostly favorable   |Mostly favorable   |Mostly favorable   |Mostly unfavorable |
|       696|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       697|Very happy    |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       698|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       699|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       700|Pretty happy  |Wrong track     |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |
|       701|Pretty happy  |Wrong track     |Mostly unfavorable |Very unfavorable   |Very unfavorable   |Very unfavorable   |
|       702|Very happy    |Right direction |Very favorable     |Very favorable     |Mostly unfavorable |Mostly unfavorable |
|       703|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Refused            |
|       704|Pretty happy  |Wrong track     |Refused            |Refused            |Refused            |Refused            |
|       705|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       706|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       707|Pretty happy  |Right direction |Mostly favorable   |Mostly unfavorable |Mostly favorable   |Mostly favorable   |
|       708|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       709|Not too happy |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       710|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       711|Very happy    |Wrong track     |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       712|Not too happy |Wrong track     |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       713|Not too happy |Wrong track     |Very unfavorable   |Very unfavorable   |Mostly favorable   |Mostly favorable   |
|       714|Pretty happy  |Wrong track     |Very unfavorable   |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |
|       715|Pretty happy  |Wrong track     |Mostly unfavorable |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       716|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       717|Very happy    |Right direction |Very favorable     |Very unfavorable   |Mostly unfavorable |Mostly favorable   |
|       718|Very happy    |Right direction |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       719|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       720|Pretty happy  |Wrong track     |Very unfavorable   |Mostly unfavorable |Mostly favorable   |Mostly unfavorable |
|       721|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       722|Very happy    |Wrong track     |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       723|Pretty happy  |Wrong track     |Very unfavorable   |Mostly unfavorable |Mostly favorable   |Mostly unfavorable |
|       724|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       725|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       726|Pretty happy  |Right direction |Very favorable     |Very favorable     |Very unfavorable   |Mostly unfavorable |
|       727|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       728|Not too happy |Right direction |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |
|       729|Very happy    |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       730|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       731|Pretty happy  |Wrong track     |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       732|Very happy    |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       733|Very happy    |Right direction |Very favorable     |Very favorable     |Mostly unfavorable |Mostly favorable   |
|       734|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Refused            |Mostly favorable   |
|       735|Not too happy |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       736|Pretty happy  |Wrong track     |Very unfavorable   |Very unfavorable   |Very unfavorable   |Very unfavorable   |
|       737|Very happy    |Wrong track     |Very unfavorable   |Very unfavorable   |Mostly favorable   |Mostly favorable   |
|       738|Pretty happy  |Wrong track     |Very unfavorable   |Mostly unfavorable |Mostly unfavorable |Very favorable     |
|       739|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       740|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       741|Pretty happy  |Wrong track     |Very unfavorable   |Mostly unfavorable |Mostly favorable   |Mostly favorable   |
|       742|Pretty happy  |Wrong track     |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |Mostly favorable   |
|       743|Pretty happy  |Right direction |Very favorable     |Very favorable     |Very unfavorable   |Mostly favorable   |
|       744|Not too happy |Wrong track     |Very unfavorable   |Very unfavorable   |Mostly favorable   |Mostly unfavorable |
|       745|Pretty happy  |Wrong track     |Very unfavorable   |Very unfavorable   |Mostly favorable   |Mostly unfavorable |
|       746|Very happy    |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       747|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       748|Pretty happy  |Right direction |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |Mostly favorable   |
|       749|Very happy    |Wrong track     |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |Mostly favorable   |
|       750|Pretty happy  |Wrong track     |Very favorable     |Very favorable     |Very unfavorable   |Very unfavorable   |
|       751|Pretty happy  |Right direction |Very favorable     |Very favorable     |Mostly unfavorable |Mostly favorable   |
|       752|Pretty happy  |Wrong track     |Mostly unfavorable |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       753|Very happy    |Right direction |Very unfavorable   |Very unfavorable   |Very unfavorable   |Very unfavorable   |
|       754|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       755|Not too happy |Wrong track     |Very favorable     |Mostly favorable   |Very unfavorable   |Very unfavorable   |
|       756|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       757|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |
|       758|Very happy    |Right direction |Mostly favorable   |Mostly favorable   |Mostly favorable   |Mostly favorable   |
|       759|Very happy    |Right direction |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |
|       760|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |
|       761|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       762|Pretty happy  |Right direction |Very favorable     |Very favorable     |Mostly unfavorable |Mostly favorable   |
|       763|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       764|Pretty happy  |Right direction |Very favorable     |Very favorable     |Mostly favorable   |Mostly favorable   |
|       765|Pretty happy  |Right direction |Mostly favorable   |Mostly unfavorable |Very unfavorable   |Mostly unfavorable |
|       766|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       767|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       768|Pretty happy  |Wrong track     |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       769|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       770|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       771|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       772|Pretty happy  |Right direction |Very favorable     |Mostly unfavorable |Very unfavorable   |Mostly favorable   |
|       773|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       774|Pretty happy  |Wrong track     |Mostly favorable   |Mostly unfavorable |Very unfavorable   |Mostly unfavorable |
|       775|Not too happy |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       776|Pretty happy  |Right direction |Very favorable     |Very favorable     |Mostly unfavorable |Mostly favorable   |
|       777|Pretty happy  |Right direction |Very unfavorable   |Mostly unfavorable |Very unfavorable   |Very unfavorable   |
|       778|Pretty happy  |Wrong track     |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |
|       779|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       780|Not too happy |Wrong track     |Mostly unfavorable |Mostly unfavorable |Very unfavorable   |Very unfavorable   |
|       781|Pretty happy  |Right direction |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |
|       782|Not too happy |Wrong track     |Very unfavorable   |Very unfavorable   |Very unfavorable   |Very unfavorable   |
|       783|Pretty happy  |Wrong track     |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |
|       784|Pretty happy  |Wrong track     |Mostly unfavorable |Mostly unfavorable |Very favorable     |Mostly unfavorable |
|       785|Pretty happy  |Wrong track     |Very favorable     |Very favorable     |Mostly unfavorable |Very unfavorable   |
|       786|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       787|Not too happy |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       788|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       789|Pretty happy  |Wrong track     |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       790|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |
|       791|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       792|Very happy    |Wrong track     |Very favorable     |Very favorable     |Very unfavorable   |Mostly unfavorable |
|       793|Pretty happy  |Wrong track     |Mostly unfavorable |Mostly unfavorable |Very unfavorable   |Mostly unfavorable |
|       794|Not too happy |Wrong track     |Very unfavorable   |Very unfavorable   |Mostly favorable   |Mostly unfavorable |
|       795|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       796|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Very favorable     |
|       797|Very happy    |Right direction |Very favorable     |Very favorable     |Very unfavorable   |Mostly favorable   |
|       798|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       799|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Mostly favorable   |Mostly favorable   |
|       800|Very happy    |Right direction |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       801|Not too happy |Right direction |Very favorable     |Very favorable     |Very unfavorable   |Mostly favorable   |
|       802|Pretty happy  |Wrong track     |Mostly favorable   |Mostly unfavorable |Very unfavorable   |Mostly favorable   |
|       803|Pretty happy  |Wrong track     |Mostly favorable   |Mostly unfavorable |Very unfavorable   |Very unfavorable   |
|       804|Very happy    |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       805|Not too happy |Wrong track     |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       806|Pretty happy  |Wrong track     |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |Mostly favorable   |
|       807|Not too happy |Wrong track     |Very favorable     |Mostly favorable   |Mostly favorable   |Mostly favorable   |
|       808|Pretty happy  |Wrong track     |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |
|       809|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Very unfavorable   |
|       810|Very happy    |Wrong track     |Very unfavorable   |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |
|       811|Pretty happy  |Wrong track     |Very favorable     |Refused            |Very unfavorable   |Mostly favorable   |
|       812|Very happy    |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       813|Very happy    |Right direction |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |Mostly favorable   |
|       814|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       815|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       816|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       817|Pretty happy  |Wrong track     |Very unfavorable   |Very unfavorable   |Very unfavorable   |Very unfavorable   |
|       818|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       819|Pretty happy  |Wrong track     |Mostly unfavorable |Very unfavorable   |Very unfavorable   |Mostly favorable   |
|       820|Very happy    |Right direction |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |
|       821|Pretty happy  |Wrong track     |Very unfavorable   |Very unfavorable   |Mostly favorable   |Mostly favorable   |
|       822|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       823|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       824|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       825|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |
|       826|Not too happy |Wrong track     |Very unfavorable   |Very unfavorable   |Very unfavorable   |Very unfavorable   |
|       827|Pretty happy  |Wrong track     |Mostly favorable   |Very favorable     |Very unfavorable   |Mostly unfavorable |
|       828|Pretty happy  |Wrong track     |Very unfavorable   |Mostly unfavorable |Very unfavorable   |Very unfavorable   |
|       829|Pretty happy  |Wrong track     |Very unfavorable   |Very unfavorable   |Mostly unfavorable |Very unfavorable   |
|       830|Very happy    |Right direction |Very favorable     |Very favorable     |Mostly unfavorable |Very unfavorable   |
|       831|Very happy    |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       832|Very happy    |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       833|Pretty happy  |Right direction |Very favorable     |Very favorable     |Very unfavorable   |Mostly unfavorable |
|       834|Not too happy |Wrong track     |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       835|Pretty happy  |Right direction |Very favorable     |Very favorable     |Mostly unfavorable |Mostly favorable   |
|       836|Pretty happy  |Wrong track     |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |
|       837|Not too happy |Wrong track     |Very favorable     |Very favorable     |Very unfavorable   |Mostly favorable   |
|       838|Very happy    |Wrong track     |Very unfavorable   |Very unfavorable   |Mostly unfavorable |Very unfavorable   |
|       839|Very happy    |Right direction |Very favorable     |Very favorable     |Very unfavorable   |Mostly favorable   |
|       840|Pretty happy  |Wrong track     |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |
|       841|Pretty happy  |Wrong track     |Very unfavorable   |Very unfavorable   |Very favorable     |Mostly favorable   |
|       842|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Very unfavorable   |
|       843|Pretty happy  |Wrong track     |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       844|Not too happy |Wrong track     |Mostly favorable   |Mostly unfavorable |Very unfavorable   |Very favorable     |
|       845|Very happy    |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       846|Not too happy |Wrong track     |Very unfavorable   |Very unfavorable   |Mostly unfavorable |Mostly favorable   |
|       847|Pretty happy  |Right direction |Mostly favorable   |Mostly unfavorable |Very unfavorable   |Mostly favorable   |
|       848|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Very unfavorable   |
|       849|Pretty happy  |Wrong track     |Very unfavorable   |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |
|       850|Very happy    |Refused         |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       851|Pretty happy  |Wrong track     |Mostly favorable   |Mostly unfavorable |Very unfavorable   |Very favorable     |
|       852|Refused       |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       853|Pretty happy  |Wrong track     |Very unfavorable   |Mostly unfavorable |Mostly favorable   |Very unfavorable   |
|       854|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       855|Not too happy |Wrong track     |Very unfavorable   |Mostly unfavorable |Mostly favorable   |Mostly favorable   |
|       856|Not too happy |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       857|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Very unfavorable   |
|       858|Pretty happy  |Wrong track     |Mostly favorable   |Mostly unfavorable |Very unfavorable   |Mostly unfavorable |
|       859|Pretty happy  |Right direction |Very favorable     |Very favorable     |Mostly unfavorable |Mostly favorable   |
|       860|Pretty happy  |Wrong track     |Very unfavorable   |Very unfavorable   |Refused            |Refused            |
|       861|Not too happy |Wrong track     |Very unfavorable   |Very unfavorable   |Very unfavorable   |Very unfavorable   |
|       862|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       863|Pretty happy  |Wrong track     |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |
|       864|Pretty happy  |Right direction |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |
|       865|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Refused            |Very favorable     |
|       866|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       867|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Mostly favorable   |Mostly favorable   |
|       868|Pretty happy  |Wrong track     |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |
|       869|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       870|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       871|Very happy    |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Very favorable     |
|       872|Pretty happy  |Right direction |Mostly favorable   |Very favorable     |Very unfavorable   |Mostly favorable   |
|       873|Not too happy |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       874|Pretty happy  |Wrong track     |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |
|       875|Very happy    |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       876|Pretty happy  |Wrong track     |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |
|       877|Very happy    |Right direction |Mostly favorable   |Mostly unfavorable |Very unfavorable   |Mostly unfavorable |
|       878|Pretty happy  |Wrong track     |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |
|       879|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       880|Very happy    |Wrong track     |Very unfavorable   |Very unfavorable   |Mostly unfavorable |Mostly unfavorable |
|       881|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Mostly unfavorable |Very favorable     |
|       882|Pretty happy  |Wrong track     |Very unfavorable   |Very unfavorable   |Very favorable     |Mostly favorable   |
|       883|Very happy    |Wrong track     |Mostly unfavorable |Very unfavorable   |Very unfavorable   |Mostly favorable   |
|       884|Very happy    |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       885|Pretty happy  |Wrong track     |Mostly favorable   |Mostly unfavorable |Very unfavorable   |Mostly favorable   |
|       886|Pretty happy  |Right direction |Mostly favorable   |Mostly unfavorable |Very unfavorable   |Mostly unfavorable |
|       887|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       888|Pretty happy  |Wrong track     |Very favorable     |Very unfavorable   |Mostly unfavorable |Mostly favorable   |
|       889|Not too happy |Right direction |Very favorable     |Very favorable     |Very unfavorable   |Mostly favorable   |
|       890|Not too happy |Right direction |Very favorable     |Very favorable     |Mostly unfavorable |Mostly favorable   |
|       891|Very happy    |Wrong track     |Very unfavorable   |Very unfavorable   |Mostly favorable   |Mostly favorable   |
|       892|Pretty happy  |Wrong track     |Mostly favorable   |Very favorable     |Very unfavorable   |Mostly unfavorable |
|       893|Refused       |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       894|Pretty happy  |Wrong track     |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |
|       895|Pretty happy  |Wrong track     |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |
|       896|Very happy    |Wrong track     |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |Mostly unfavorable |
|       897|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       898|Very happy    |Right direction |Mostly favorable   |Mostly unfavorable |Very unfavorable   |Mostly favorable   |
|       899|Pretty happy  |Wrong track     |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |
|       900|Pretty happy  |Right direction |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |
|       901|Pretty happy  |Wrong track     |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |Mostly unfavorable |
|       902|Not too happy |Wrong track     |Very favorable     |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |
|       903|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |
|       904|Not too happy |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       905|Very happy    |Wrong track     |Mostly favorable   |Mostly unfavorable |Very unfavorable   |Mostly unfavorable |
|       906|Pretty happy  |Wrong track     |Very unfavorable   |Very unfavorable   |Mostly unfavorable |Mostly unfavorable |
|       907|Very happy    |Right direction |Mostly favorable   |Refused            |Mostly favorable   |Mostly favorable   |
|       908|Pretty happy  |Right direction |Very favorable     |Very favorable     |Mostly unfavorable |Very favorable     |
|       909|Very happy    |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       910|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Mostly favorable   |Mostly favorable   |
|       911|Pretty happy  |Right direction |Mostly favorable   |Mostly unfavorable |Very unfavorable   |Mostly favorable   |
|       912|Pretty happy  |Right direction |Mostly favorable   |Mostly unfavorable |Very unfavorable   |Mostly unfavorable |
|       913|Refused       |Right direction |Very favorable     |Very favorable     |Very unfavorable   |Mostly unfavorable |
|       914|Pretty happy  |Right direction |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |
|       915|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       916|Not too happy |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       917|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Mostly favorable   |Mostly favorable   |
|       918|Pretty happy  |Wrong track     |Very unfavorable   |Mostly unfavorable |Mostly favorable   |Very favorable     |
|       919|Not too happy |Wrong track     |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |
|       920|Not too happy |Wrong track     |Mostly favorable   |Very unfavorable   |Very unfavorable   |Mostly unfavorable |
|       921|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       922|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       923|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |
|       924|Not too happy |Wrong track     |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |
|       925|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       926|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       927|Very happy    |Right direction |Very favorable     |Very favorable     |Very unfavorable   |Very unfavorable   |
|       928|Pretty happy  |Right direction |Very unfavorable   |Very favorable     |Very unfavorable   |Very unfavorable   |
|       929|Pretty happy  |Wrong track     |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |
|       930|Very happy    |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       931|Pretty happy  |Right direction |Very favorable     |Very favorable     |Very unfavorable   |Mostly favorable   |
|       932|Pretty happy  |Wrong track     |Very unfavorable   |Very unfavorable   |Very unfavorable   |Very unfavorable   |
|       933|Pretty happy  |Wrong track     |Very unfavorable   |Very unfavorable   |Mostly favorable   |Mostly unfavorable |
|       934|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Mostly favorable   |Mostly favorable   |
|       935|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       936|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       937|Pretty happy  |Wrong track     |Very unfavorable   |Mostly unfavorable |Mostly favorable   |Very unfavorable   |
|       938|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |
|       939|Not too happy |Right direction |Mostly favorable   |Mostly unfavorable |Very unfavorable   |Mostly favorable   |
|       940|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |
|       941|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       942|Pretty happy  |Wrong track     |Very unfavorable   |Very unfavorable   |Very favorable     |Mostly unfavorable |
|       943|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |
|       944|Very happy    |Right direction |Very favorable     |Very favorable     |Mostly favorable   |Mostly favorable   |
|       945|Very happy    |Wrong track     |Mostly favorable   |Mostly favorable   |Mostly favorable   |Mostly favorable   |
|       946|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       947|Very happy    |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Very unfavorable   |
|       948|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       949|Very happy    |Right direction |Very favorable     |Very favorable     |Very unfavorable   |Mostly favorable   |
|       950|Pretty happy  |Wrong track     |Very favorable     |Mostly unfavorable |Very unfavorable   |Mostly favorable   |
|       951|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       952|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       953|Pretty happy  |Right direction |Very favorable     |Very favorable     |Mostly unfavorable |Mostly favorable   |
|       954|Not too happy |Right direction |Very favorable     |Mostly unfavorable |Very unfavorable   |Mostly unfavorable |
|       955|Pretty happy  |Right direction |Mostly favorable   |Very favorable     |Very unfavorable   |Mostly favorable   |
|       956|Pretty happy  |Wrong track     |Very unfavorable   |Very unfavorable   |Very unfavorable   |Very unfavorable   |
|       957|Not too happy |Wrong track     |Mostly unfavorable |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       958|Very happy    |Right direction |Very favorable     |Very favorable     |Very favorable     |Very favorable     |
|       959|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       960|Pretty happy  |Right direction |Very favorable     |Mostly unfavorable |Very unfavorable   |Very unfavorable   |
|       961|Pretty happy  |Right direction |Mostly favorable   |Mostly unfavorable |Very unfavorable   |Mostly favorable   |
|       962|Not too happy |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       963|Not too happy |Right direction |Very favorable     |Very favorable     |Mostly favorable   |Mostly favorable   |
|       964|Not too happy |Right direction |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |
|       965|Pretty happy  |Wrong track     |Mostly favorable   |Mostly unfavorable |Very unfavorable   |Mostly unfavorable |
|       966|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |
|       967|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       968|Very happy    |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       969|Refused       |Wrong track     |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       970|Not too happy |Wrong track     |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       971|Not too happy |Wrong track     |Mostly unfavorable |Mostly unfavorable |Very unfavorable   |Very unfavorable   |
|       972|Very happy    |Wrong track     |Mostly favorable   |Mostly favorable   |Mostly favorable   |Mostly favorable   |
|       973|Not too happy |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Very unfavorable   |
|       974|Not too happy |Right direction |Mostly favorable   |Mostly favorable   |Mostly favorable   |Mostly favorable   |
|       975|Pretty happy  |Wrong track     |Very unfavorable   |Mostly unfavorable |Mostly favorable   |Mostly favorable   |
|       976|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       977|Pretty happy  |Wrong track     |Very unfavorable   |Very unfavorable   |Very unfavorable   |Very unfavorable   |
|       978|Pretty happy  |Wrong track     |Very favorable     |Mostly unfavorable |Very unfavorable   |Mostly unfavorable |
|       979|Pretty happy  |Wrong track     |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       980|Very happy    |Wrong track     |Mostly unfavorable |Very unfavorable   |Mostly unfavorable |Very unfavorable   |
|       981|Very happy    |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       982|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       983|Very happy    |Right direction |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|       984|Very happy    |Right direction |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |Mostly favorable   |
|       985|Pretty happy  |Wrong track     |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |
|       986|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|       987|Very happy    |Right direction |Mostly favorable   |Mostly unfavorable |Very unfavorable   |Mostly unfavorable |
|       988|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       989|Very happy    |Right direction |Very unfavorable   |Very unfavorable   |Very unfavorable   |Mostly favorable   |
|       990|Very happy    |Right direction |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |
|       991|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Very unfavorable   |
|       992|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       993|Not too happy |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       994|Not too happy |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       995|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       996|Very happy    |Right direction |Very favorable     |Mostly unfavorable |Very unfavorable   |Mostly favorable   |
|       997|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       998|Not too happy |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|       999|Pretty happy  |Wrong track     |Very favorable     |Mostly favorable   |Very unfavorable   |Very unfavorable   |
|      1000|Very happy    |Wrong track     |Very unfavorable   |Very unfavorable   |Mostly favorable   |Mostly unfavorable |
|      1001|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |
|      1002|Not too happy |Wrong track     |Mostly favorable   |Mostly unfavorable |Very unfavorable   |Mostly unfavorable |
|      1003|Pretty happy  |Wrong track     |Very unfavorable   |Very unfavorable   |Very unfavorable   |Very unfavorable   |
|      1004|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|      1005|Pretty happy  |Wrong track     |Mostly favorable   |Mostly unfavorable |Very unfavorable   |Mostly unfavorable |
|      1006|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|      1007|Not too happy |Wrong track     |Mostly unfavorable |Very unfavorable   |Very unfavorable   |Mostly unfavorable |
|      1008|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|      1009|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|      1010|Very happy    |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|      1011|Pretty happy  |Wrong track     |Mostly unfavorable |Very unfavorable   |Very unfavorable   |Mostly unfavorable |
|      1012|Pretty happy  |Right direction |Very favorable     |Very favorable     |Mostly favorable   |Very favorable     |
|      1013|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|      1014|Pretty happy  |Right direction |Mostly favorable   |Mostly unfavorable |Very unfavorable   |Very unfavorable   |
|      1015|Not too happy |Wrong track     |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |
|      1016|Pretty happy  |Right direction |Very favorable     |Very favorable     |Mostly unfavorable |Mostly unfavorable |
|      1017|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |
|      1018|Refused       |Right direction |Very unfavorable   |Very unfavorable   |Mostly favorable   |Mostly unfavorable |
|      1019|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|      1020|Not too happy |Wrong track     |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|      1021|Pretty happy  |Right direction |Very favorable     |Very favorable     |Very unfavorable   |Mostly favorable   |
|      1022|Very happy    |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|      1023|Not too happy |Wrong track     |Very unfavorable   |Very unfavorable   |Mostly unfavorable |Mostly favorable   |
|      1024|Very happy    |Right direction |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |Very favorable     |
|      1025|Not too happy |Right direction |Mostly favorable   |Mostly favorable   |Mostly favorable   |Mostly favorable   |
|      1026|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|      1027|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|      1028|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|      1029|Pretty happy  |Right direction |Very favorable     |Mostly unfavorable |Very unfavorable   |Mostly favorable   |
|      1030|Pretty happy  |Wrong track     |Very unfavorable   |Very unfavorable   |Very unfavorable   |Mostly favorable   |
|      1031|Very happy    |Right direction |Refused            |Refused            |Refused            |Refused            |
|      1032|Pretty happy  |Wrong track     |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |
|      1033|Very happy    |Right direction |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |
|      1034|Very happy    |Wrong track     |Mostly unfavorable |Mostly favorable   |Mostly favorable   |Mostly favorable   |
|      1035|Pretty happy  |Wrong track     |Very unfavorable   |Very unfavorable   |Mostly favorable   |Mostly unfavorable |
|      1036|Not too happy |Wrong track     |Very unfavorable   |Very unfavorable   |Mostly unfavorable |Mostly favorable   |
|      1037|Pretty happy  |Wrong track     |Mostly unfavorable |Very unfavorable   |Very unfavorable   |Mostly favorable   |
|      1038|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|      1039|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|      1040|Very happy    |Right direction |Very favorable     |Very favorable     |Very unfavorable   |Mostly favorable   |
|      1041|Pretty happy  |Right direction |Mostly favorable   |Very favorable     |Very unfavorable   |Mostly favorable   |
|      1042|Not too happy |Wrong track     |Mostly favorable   |Mostly favorable   |Mostly favorable   |Mostly favorable   |
|      1043|Pretty happy  |Wrong track     |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |
|      1044|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Mostly favorable   |Mostly favorable   |
|      1045|Very happy    |Right direction |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |
|      1046|Pretty happy  |Right direction |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |
|      1047|Not too happy |Wrong track     |Very favorable     |Very favorable     |Very unfavorable   |Mostly unfavorable |
|      1048|Pretty happy  |Wrong track     |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |Mostly favorable   |
|      1049|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|      1050|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|      1051|Very happy    |Right direction |Mostly favorable   |Refused            |Refused            |Refused            |
|      1052|Pretty happy  |Wrong track     |Mostly unfavorable |Very unfavorable   |Mostly unfavorable |Mostly unfavorable |
|      1053|Not too happy |Wrong track     |Mostly favorable   |Mostly favorable   |Mostly favorable   |Mostly favorable   |
|      1054|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|      1055|Not too happy |Wrong track     |Very unfavorable   |Very unfavorable   |Mostly favorable   |Mostly favorable   |
|      1056|Pretty happy  |Right direction |Very favorable     |Very favorable     |Mostly unfavorable |Very favorable     |
|      1057|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|      1058|Pretty happy  |Right direction |Very favorable     |Very favorable     |Very unfavorable   |Mostly favorable   |
|      1059|Very happy    |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|      1060|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Very unfavorable   |
|      1061|Very happy    |Wrong track     |Very favorable     |Very favorable     |Very unfavorable   |Very unfavorable   |
|      1062|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Mostly favorable   |Mostly favorable   |
|      1063|Very happy    |Right direction |Mostly favorable   |Mostly favorable   |Mostly favorable   |Mostly favorable   |
|      1064|Not too happy |Wrong track     |Very favorable     |Very favorable     |Very unfavorable   |Mostly favorable   |
|      1065|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|      1066|Very happy    |Right direction |Very favorable     |Very favorable     |Mostly unfavorable |Mostly unfavorable |
|      1067|Pretty happy  |Right direction |Very favorable     |Very favorable     |Very unfavorable   |Very favorable     |
|      1068|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|      1069|Not too happy |Right direction |Very favorable     |Very favorable     |Very unfavorable   |Mostly favorable   |
|      1070|Pretty happy  |Wrong track     |Very unfavorable   |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|      1071|Not too happy |Right direction |Very favorable     |Very favorable     |Very unfavorable   |Mostly unfavorable |
|      1072|Pretty happy  |Right direction |Very favorable     |Very favorable     |Mostly unfavorable |Mostly favorable   |
|      1073|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Mostly favorable   |Refused            |
|      1074|Very happy    |Wrong track     |Very unfavorable   |Mostly unfavorable |Mostly favorable   |Mostly unfavorable |
|      1075|Pretty happy  |Wrong track     |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |
|      1076|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|      1077|Very happy    |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|      1078|Pretty happy  |Wrong track     |Mostly unfavorable |Mostly unfavorable |Very unfavorable   |Very unfavorable   |
|      1079|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|      1080|Not too happy |Wrong track     |Mostly unfavorable |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |
|      1081|Pretty happy  |Right direction |Very favorable     |Very favorable     |Mostly unfavorable |Mostly favorable   |
|      1082|Very happy    |Right direction |Mostly favorable   |Mostly unfavorable |Very unfavorable   |Mostly favorable   |
|      1083|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|      1084|Not too happy |Wrong track     |Mostly favorable   |Mostly favorable   |Mostly favorable   |Mostly favorable   |
|      1085|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|      1086|Not too happy |Wrong track     |Mostly unfavorable |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|      1087|Very happy    |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|      1088|Pretty happy  |Wrong track     |Very favorable     |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |
|      1089|Pretty happy  |Wrong track     |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |
|      1090|Pretty happy  |Right direction |Very favorable     |Very favorable     |Mostly unfavorable |Mostly unfavorable |
|      1091|Very happy    |Right direction |Very favorable     |Very favorable     |Very unfavorable   |Very unfavorable   |
|      1092|Not too happy |Wrong track     |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |
|      1093|Pretty happy  |Right direction |Very unfavorable   |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |
|      1094|Very happy    |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |
|      1095|Not too happy |Wrong track     |Very favorable     |Very favorable     |Mostly unfavorable |Very favorable     |
|      1096|Pretty happy  |Wrong track     |Mostly unfavorable |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|      1097|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|      1098|Pretty happy  |Wrong track     |Very unfavorable   |Very unfavorable   |Mostly unfavorable |Mostly unfavorable |
|      1099|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|      1100|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|      1101|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Mostly favorable   |Mostly favorable   |
|      1102|Not too happy |Wrong track     |Very unfavorable   |Mostly unfavorable |Mostly favorable   |Very unfavorable   |
|      1103|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|      1104|Pretty happy  |Right direction |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |
|      1105|Pretty happy  |Right direction |Very favorable     |Very favorable     |Mostly unfavorable |Mostly favorable   |
|      1106|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|      1107|Pretty happy  |Right direction |Very favorable     |Very favorable     |Very unfavorable   |Mostly favorable   |
|      1108|Pretty happy  |Wrong track     |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |
|      1109|Pretty happy  |Right direction |Very favorable     |Very favorable     |Very unfavorable   |Mostly unfavorable |
|      1110|Pretty happy  |Wrong track     |Very unfavorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|      1111|Pretty happy  |Right direction |Mostly unfavorable |Mostly unfavorable |Very unfavorable   |Mostly favorable   |
|      1112|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|      1113|Very happy    |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|      1114|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Mostly favorable   |Mostly favorable   |
|      1115|Pretty happy  |Right direction |Mostly unfavorable |Very unfavorable   |Very unfavorable   |Mostly unfavorable |
|      1116|Refused       |Right direction |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|      1117|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|      1118|Pretty happy  |Right direction |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |
|      1119|Pretty happy  |Right direction |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |
|      1120|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|      1121|Very happy    |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|      1122|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|      1123|Very happy    |Right direction |Very favorable     |Very favorable     |Mostly unfavorable |Mostly favorable   |
|      1124|Pretty happy  |Wrong track     |Very favorable     |Mostly favorable   |Very unfavorable   |Very unfavorable   |
|      1125|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|      1126|Pretty happy  |Right direction |Very favorable     |Very favorable     |Very unfavorable   |Mostly favorable   |
|      1127|Not too happy |Wrong track     |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |
|      1128|Pretty happy  |Wrong track     |Very unfavorable   |Very unfavorable   |Mostly favorable   |Very unfavorable   |
|      1129|Pretty happy  |Wrong track     |Mostly unfavorable |Mostly favorable   |Mostly favorable   |Mostly favorable   |
|      1130|Very happy    |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|      1131|Not too happy |Wrong track     |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |
|      1132|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|      1133|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|      1134|Not too happy |Wrong track     |Very unfavorable   |Very unfavorable   |Mostly unfavorable |Mostly unfavorable |
|      1135|Very happy    |Wrong track     |Mostly unfavorable |Very unfavorable   |Very unfavorable   |Mostly unfavorable |
|      1136|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|      1137|Pretty happy  |Wrong track     |Very unfavorable   |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |
|      1138|Pretty happy  |Right direction |Very unfavorable   |Very unfavorable   |Very unfavorable   |Very unfavorable   |
|      1139|Pretty happy  |Wrong track     |Mostly unfavorable |Mostly unfavorable |Refused            |Mostly unfavorable |
|      1140|Not too happy |Wrong track     |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |
|      1141|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|      1142|Pretty happy  |Right direction |Mostly unfavorable |Refused            |Refused            |Refused            |
|      1143|Pretty happy  |Wrong track     |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |
|      1144|Not too happy |Right direction |Very favorable     |Very favorable     |Very unfavorable   |Very favorable     |
|      1145|Pretty happy  |Wrong track     |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |
|      1146|Very happy    |Right direction |Very favorable     |Very favorable     |Mostly favorable   |Mostly favorable   |
|      1147|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|      1148|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|      1149|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|      1150|Very happy    |Right direction |Very favorable     |Very favorable     |Very unfavorable   |Mostly favorable   |
|      1151|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Mostly favorable   |Mostly favorable   |
|      1152|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|      1153|Not too happy |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|      1154|Pretty happy  |Wrong track     |Very unfavorable   |Very unfavorable   |Very favorable     |Very unfavorable   |
|      1155|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|      1156|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|      1157|Pretty happy  |Wrong track     |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |
|      1158|Very happy    |Right direction |Very favorable     |Mostly favorable   |Mostly favorable   |Mostly unfavorable |
|      1159|Very happy    |Right direction |Very favorable     |Very favorable     |Very unfavorable   |Mostly unfavorable |
|      1160|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|      1161|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|      1162|Very happy    |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|      1163|Pretty happy  |Right direction |Very favorable     |Very favorable     |Very favorable     |Very favorable     |
|      1164|Pretty happy  |Right direction |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |
|      1165|Not too happy |Right direction |Mostly favorable   |Mostly unfavorable |Very unfavorable   |Mostly favorable   |
|      1166|Not too happy |Wrong track     |Very unfavorable   |Very unfavorable   |Very favorable     |Mostly unfavorable |
|      1167|Not too happy |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|      1168|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|      1169|Pretty happy  |Right direction |Very favorable     |Very favorable     |Very unfavorable   |Mostly favorable   |
|      1170|Not too happy |Right direction |Very favorable     |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|      1171|Pretty happy  |Wrong track     |Very unfavorable   |Very unfavorable   |Very unfavorable   |Very unfavorable   |
|      1172|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|      1173|Pretty happy  |Right direction |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |
|      1174|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|      1175|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|      1176|Not too happy |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Very unfavorable   |
|      1177|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Mostly favorable   |Mostly favorable   |
|      1178|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|      1179|Pretty happy  |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly unfavorable |
|      1180|Pretty happy  |Right direction |Very favorable     |Very favorable     |Mostly unfavorable |Mostly favorable   |
|      1181|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |
|      1182|Not too happy |Right direction |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |Mostly favorable   |
|      1183|Pretty happy  |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |
|      1184|Not too happy |Right direction |Mostly favorable   |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|      1185|Pretty happy  |Wrong track     |Mostly favorable   |Very unfavorable   |Very unfavorable   |Very unfavorable   |
|      1186|Pretty happy  |Wrong track     |Mostly favorable   |Very unfavorable   |Very unfavorable   |Mostly unfavorable |
|      1187|Pretty happy  |Right direction |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |
|      1188|Pretty happy  |Wrong track     |Mostly favorable   |Very favorable     |Very unfavorable   |Mostly favorable   |
|      1189|Pretty happy  |Right direction |Very favorable     |Mostly favorable   |Mostly unfavorable |Mostly favorable   |
|      1190|Pretty happy  |Right direction |Very favorable     |Very favorable     |Very unfavorable   |Mostly unfavorable |
|      1191|Not too happy |Wrong track     |Mostly favorable   |Mostly favorable   |Very unfavorable   |Mostly favorable   |
|      1192|Pretty happy  |Wrong track     |Mostly favorable   |Very favorable     |Mostly unfavorable |Mostly favorable   |
|      1193|Pretty happy  |Right direction |Mostly favorable   |Mostly unfavorable |Mostly favorable   |Very favorable     |
|      1194|Pretty happy  |Wrong track     |Very unfavorable   |Mostly unfavorable |Mostly favorable   |Mostly favorable   |
|      1195|Pretty happy  |Wrong track     |Mostly favorable   |Mostly unfavorable |Mostly unfavorable |Mostly unfavorable |
|      1196|Very happy    |Right direction |Mostly favorable   |Mostly unfavorable |Mostly favorable   |Mostly unfavorable |
|      1197|Very happy    |Wrong track     |Very unfavorable   |Very unfavorable   |Mostly favorable   |Very unfavorable   |

Converting to Graph Data - Overview
=======
![plot of chunk unnamed-chunk-18](2013_LGBTQ_SURVEY-figure/unnamed-chunk-18-1.png)

Converting to Graph Data - Overview
========
class:normal-text
**Main Task:** Create 2 Data Frames

1. Node List **(not required)**:
    - First Column must be the unique names/id of the nodes
    - Every subsequent column is a node attribute
    - Only required if the graph has node attributes
2. Edge List **(required!)**:
    - First column must be the name/id of the source node (the tail of the edge)
    - Second column must be the name/id of the target node (the head of the edge)
    - Every subsequent column is an edge attribute
    
Converting to Graph Data - Edge List
=====
class:small-code


```r
links <- survey %>%
  mutate(NEWCASEID = str_c("ID_", NEWCASEID)) %>%
  gather(question, answer, -NEWCASEID) %>%
  unite(answer, question, answer, sep = '::') %>%
  mutate(type = "person_answer")
```

Converting to Graph Data - Edge List
======
class:small-code


```
# A tibble: 10 x 3
   NEWCASEID answer                                               type    
   <chr>     <chr>                                                <chr>   
 1 ID_923    Q102A::Same-sex marriage should be a top priority f… person_…
 2 ID_89     IMP::Not at all important                            person_…
 3 ID_62     Q66_E::Unfriendly                                    person_…
 4 ID_1008   Q82_A::Never happened                                person_…
 5 ID_444    Q84::Yes, in past 12 months                          person_…
 6 ID_430    Q64_OE2::NA                                          person_…
 7 ID_938    Q102B::The best way to achieve equality is for LGBT… person_…
 8 ID_609    Q82_B::Never happened                                person_…
 9 ID_993    Q49::All or most of them                             person_…
10 ID_328    Q66_A::Unfriendly                                    person_…
```
    
Converting to Graph Data - Node List
=====
class:small-code

```r
nodes <- rbind(
  tibble(
    name = links$NEWCASEID %>% unique,
    type = 'person'
  ),
  tibble(
    name = links$answer %>% unique,
    type = 'answer'
  )
)
```

Converting to Graph Data - Node List
======
class:small-code

```
# A tibble: 10 x 2
   name                                                  type  
   <chr>                                                 <chr> 
 1 weight::1.775                                         answer
 2 Q64_OE3::Barbra Streisand                             answer
 3 ID_108                                                person
 4 weight::0.2908                                        answer
 5 weight::1.7894                                        answer
 6 weight::0.1622                                        answer
 7 Q2::Right direction                                   answer
 8 ID_198                                                person
 9 Q44new_OE2::Didn't want to hurt/stress/disappoint her answer
10 weight::1.1363                                        answer
```

Converting to Graph Data - The Graph!!
=====
class:small-code

```r
g <- graph_from_data_frame(d = links, directed = F, vertices = nodes)
g
```

```
IGRAPH 2f7f7e3 UN-B 3533 215460 -- 
+ attr: name (v/c), type (v/c), type (e/c)
+ edges from 2f7f7e3 (vertex names):
 [1] ID_1 --Q1::Pretty happy  ID_2 --Q1::Pretty happy 
 [3] ID_3 --Q1::Not too happy ID_4 --Q1::Pretty happy 
 [5] ID_5 --Q1::Pretty happy  ID_6 --Q1::Pretty happy 
 [7] ID_7 --Q1::Pretty happy  ID_8 --Q1::Pretty happy 
 [9] ID_9 --Q1::Pretty happy  ID_10--Q1::Very happy   
[11] ID_11--Q1::Very happy    ID_12--Q1::Pretty happy 
[13] ID_13--Q1::Very happy    ID_14--Q1::Pretty happy 
[15] ID_15--Q1::Pretty happy  ID_16--Q1::Very happy   
+ ... omitted several edges
```

Converting to Graph Data - The Graph is too big!!!
====


!['fullSurveyGraph.png'](fullSurveyGraph.png)

Subgraph - Filter the Graph down!!!
=====
![plot of chunk unnamed-chunk-25](2013_LGBTQ_SURVEY-figure/unnamed-chunk-25-1.png)

Subgraph - Filter the graph down!!!
=====
![plot of chunk unnamed-chunk-26](2013_LGBTQ_SURVEY-figure/unnamed-chunk-26-1.png)

Subgraph - Just Gay Males 
========
class:small-code


```r
filterForGroup <- function(g, strFilt){
  g %>%
  {. - E(.)[!V(.)[str_detect(V(.)$name, '^ID_')] %--% V(.)[str_detect(V(.)$name, strFilt)]]} %>%
  {. - V(.)[degree(.) == 0]} %>%
  {V(.)[str_detect(name, '^ID_')]$name} %>%
  {g - E(g)[!. %--% V(g)]} %>%
  {. - V(.)[degree(.) == 0]} %>%
  {. - V(.)[str_detect(name, '^weight')]} %>% 
  {. - V(.)[str_detect(name, '^duration')]} %>%
  {. - V(.)[str_detect(name, '::NA$')]} 
}
justGay <-  filterForGroup(g, 'LGBT::gay')
```
  
Subgraph - Just Gay Males. Still too big!!!
=====
![plot of chunk unnamed-chunk-28](2013_LGBTQ_SURVEY-figure/unnamed-chunk-28-1.png)


Subgraph - Question 102
=====

**102(a|b|c|d): Which Statement comes closer to your own views - even if neither is exatly right?**

<table class='myTable'>
<tr>
  <th>
    Q.
  </th>
  <th>
    A1.
  </th>
  <th>
    A2
  </th>
</tr>
<tr>
  <td>
    A
  </td>
  <td>
    The push for same-sex marriage has taken too much focus away from other issues important to LGBT people
  </td>
  <td>
    Same-sex marriage should be the top priority for LGBT people right now, even if this means some other issues do not get much attention
  </td>
</tr>
<tr>
  <td>
    B
  </td>
  <td>
    The best way to achieve equality is for LGBT people to be a part of mainstream culture and institutions like marriage
  </td>
  <td>
    LGBT people should be able to achieve equality while still maintaining their own distinct culture and way of life 
  </td>
</tr>
<tr>
  <td>
    C
  </td>
  <td>
    I dont want to be seen as different because of my (sexual orientation)/(gender identity)
  </td>
  <td>
    My (sexual orientation)/(gender identity) makes me different from other people, and I am comfortable with that.
  </td>
</tr>
<tr>
  <td>
    D
  </td>
  <td>
    It is important to maintain places like LGBT neighborhoods and gay and lesbian bars
  </td>
  <td>
    These types of places will not be important as LGBT people are more accepted into society
  </td>
</tr>
</table>

Subgraph - Question 102 Filtered
=====
class:small-code


```r
filterForQuestion <- function(g, strFilt){
  filteredItem <- V(g)[str_detect(V(g)$name, strFilt)]
  g %>%
    {. - E(.)[!V(.) %--% filteredItem]} %>%
    {. - V(.)[degree(.) == 0]}
}

justGay102 <- filterForQuestion(justGay, '^Q102')
```

Subgraph - Question 102 Filtered
====
![plot of chunk unnamed-chunk-30](2013_LGBTQ_SURVEY-figure/unnamed-chunk-30-1.png)

Subgraph - Projection
====
![plot of chunk unnamed-chunk-31](2013_LGBTQ_SURVEY-figure/unnamed-chunk-31-1.png)

Subgraph - Projection
====
![plot of chunk unnamed-chunk-32](2013_LGBTQ_SURVEY-figure/unnamed-chunk-32-1.png)

Subgraph - Question 102 Projected
=======
class:small-code

```r
projectForType <- function(g, strType){
  g %>%
    set_vertex_attr('type', 
                    value = sapply(V(.)$type, function(x){
                      x == strType
                    })) %>%
    set_vertex_attr('degree',
                    value = degree(.)) %>% 
    set_vertex_attr('percDegree',
                    value = degree(.)/vcount(g - V(g)[type == strType])) %>%
    bipartite_projection() %>%
    .[[2]] %>%
    set_vertex_attr('strength', value = strength(.)) %>%
    set_edge_attr('percStrength', value = E(.)$weight/vcount(g - V(g)[type == strType]))
}

justGay102Answers <- projectForType(justGay102, 'answer')
```

Subgraph - Answers have relationships
=======

![plot of chunk unnamed-chunk-34](2013_LGBTQ_SURVEY-figure/unnamed-chunk-34-1.png)

Subgraph - Statistics Change if the Relationships Change
====
![plot of chunk unnamed-chunk-35](2013_LGBTQ_SURVEY-figure/unnamed-chunk-35-1.png)

Summary of Vertices - They're just vectors 
=====
class:small-code


```r
justGay102Summary <- tibble(
  answer = V(justGay102Answers)$name,
  people = V(justGay102Answers)$degree
) %>%
  separate(answer, c('question', 'answer'), '::') %>%
  arrange(people) %>%
  mutate(answer = factor(answer, c('Refused', .$answer %>% .[. != 'Refused'])))

ggplot(justGay102Summary) +
  geom_col(aes(answer, people)) +
  coord_flip() +
  facet_grid(question~., drop = T, scales='free_y')
```


Summary of Vertices - They're just vectors
=====

![plot of chunk unnamed-chunk-37](2013_LGBTQ_SURVEY-figure/unnamed-chunk-37-1.png)

Get all LGBT sugbraphs
======
class:small-code


```r
get_sub <- function(g, str_filt, cutoff, type){
  g %>%
    filterForQuestion(str_filt) %>%
    {
      poi <- V(.)[str_detect(name, '^ID_')]$name
      g - E(g)[!poi %--% V(g)]
    }  %>%
    {. - V(.)[degree(.) == 0]} %>%
    projectForType('answer') %>%
    {
      totP <<- V(.)[str_detect(name, '^ID_')] %>% length
      .
    } %>%
    {. - V(.)[percDegree < cutoff]} %>%
    filterForQuestion(str_filt) %>%
    set_edge_attr('percTot', value = E(.)$weight/totP) %>%
    set_edge_attr('type', value = type) %>%
    as_data_frame()
}
```

Get all LGBT subgraphs
======
class:small-code


```r
trans <- get_sub(g, 'LGBT::transgender', .7, 'transgender')
gay <- get_sub(g, 'LGBT::gay', .7, 'gay')
bisexual <- get_sub(g, 'LGBT::bisexual', .7, 'bisexual')
lesbian <- get_sub(g, 'LGBT::lesbian', .7, 'lesbian')

lgbt <- list(trans, gay, bisexual, lesbian) %>%
  bind_rows()

g_lgbt_70 <- graph_from_data_frame(lgbt, F)
```

Similarities
====
class:small-code

```r
only_common <- g_lgbt_70 %>%
  {. - V(.)[str_detect(name, "::NA$")]} %>%
  set_vertex_attr('degree',
                  value = degree(.)) %>%
  {. - V(.)[str_detect(name, '^LGBT')]} %>%
  {. - V(.)[degree < 4]} %>%
  {V(.)$name} %>%
  c(V(g_lgbt_70)[str_detect(name, '^LGBT')]$name)

g_lgbt_70_sim <- g_lgbt_70 %>% 
  {. - V(.)[!name %in% only_common]} 
```

Similarities
====
![plot of chunk unnamed-chunk-41](2013_LGBTQ_SURVEY-figure/unnamed-chunk-41-1.png)


Dissimilarities
=====
class:small-code


```r
remove_common <- g_lgbt_70 %>%
  {. - V(.)[str_detect(name, "::NA$")]} %>%
  set_vertex_attr('degree', 
                  value = degree(.)) %>%
  {. - V(.)[str_detect(name, '^LGBT')]} %>%
  {. - V(.)[degree > 2]} %>%
  {V(.)$name} %>% 
  c(V(g_lgbt_70)[str_detect(name, '^LGBT')]$name)


g_lgbt_70_dis <- g_lgbt_70 %>% 
  {. - V(.)[!name %in% remove_common]} 
```

Dissimilarities
=====
![plot of chunk unnamed-chunk-43](2013_LGBTQ_SURVEY-figure/unnamed-chunk-43-1.png)

Resources
======
### Network Visualizations

**Katya Ognyanova**<br>
[@Ognyanova](https://twitter.com/Ognyanova) <br>
[http://kateto.net/network-visualization](http://kateto.net/network-visualization)

### Graph Traversal Tutorial
My tutorial on graph traversal with igraph <br>
[/beemyfriend/traversing_graphs_in_R](https://github.com/beemyfriend/traversing_graphs_in_R)

Looking for Speakers & Organizers
=====
<img src="rainbowr.png" title="plot of chunk unnamed-chunk-44" alt="plot of chunk unnamed-chunk-44" width="400px" /><img src="satRdayLogo.png" title="plot of chunk unnamed-chunk-44" alt="plot of chunk unnamed-chunk-44" width="400px" />

[@r_lgbtq](https://twitter.com/r_lgbtq)<br>
[rlgbtq@gmail.com](rlgbtq@gmail.com)



