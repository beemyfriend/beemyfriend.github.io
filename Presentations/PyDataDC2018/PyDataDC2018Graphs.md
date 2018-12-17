Exploring Graphs with igraph
========================================================
author: Benjamin Ortiz Ulloa
date: 
autosize: true
transition: fade

<style>
.small-code pre code {
  font-size: 1em;
}

.grey-out {
  color: 'lightgrey'
}
</style>

Exploring Graphs with igraph
=====
<ol>
  <li>What's a Graph?</li>
  <li>Practical Applications: Recommendations</li>
  <li>Measuring Impact/Importance</li>
  <li>Practical Applications: Keyphrases</li>
  <li>Practical Applications: Models</li>
  <li><b>Code:</b> Creating and Exploring a Graph</li>
  <li>Concluding Remarks</li>
</ol>


Exploring Graphs with igraph
=====
<ol>
  <li>What's a Graph?</li>
  <li style='color: lightgrey'>Practical Applications: Recommendations</li>
  <li style='color: lightgrey'>Measuring Impact/Importance</li>
  <li style='color: lightgrey'>Practical Applications: Keyphrases</li>
  <li style='color: lightgrey'>Practical Applications: Models</li>
  <li style='color: lightgrey'><b>Code:</b> Creating and Exploring a Graph</li>
  <li style='color: lightgrey'>Concluding Remarks</li>
</ol>


What's a Graph?
========================================================

![plot of chunk unnamed-chunk-1](PyDataDC2018Graphs-figure/unnamed-chunk-1-1.png)

What's a Graph?
========================================================

![plot of chunk unnamed-chunk-2](PyDataDC2018Graphs-figure/unnamed-chunk-2-1.png)

What's a Graph?
========================================================

![plot of chunk unnamed-chunk-3](PyDataDC2018Graphs-figure/unnamed-chunk-3-1.png)

What's a Graph?
============
![plot of chunk unnamed-chunk-4](PyDataDC2018Graphs-figure/unnamed-chunk-4-1.png)

What's a Graph?
============
![plot of chunk unnamed-chunk-5](PyDataDC2018Graphs-figure/unnamed-chunk-5-1.png)

What's a Graph?
============
![plot of chunk unnamed-chunk-6](PyDataDC2018Graphs-figure/unnamed-chunk-6-1.png)

Relationships can have direction
============
![plot of chunk unnamed-chunk-7](PyDataDC2018Graphs-figure/unnamed-chunk-7-1.png)

Multiple relationships are possible
============
![plot of chunk unnamed-chunk-8](PyDataDC2018Graphs-figure/unnamed-chunk-8-1.png)

Everything can have attributes
============
![plot of chunk unnamed-chunk-9](PyDataDC2018Graphs-figure/unnamed-chunk-9-1.png)

Attributes can be visualized
============
![plot of chunk unnamed-chunk-10](PyDataDC2018Graphs-figure/unnamed-chunk-10-1.png)


Edge attributes provide context
====
![plot of chunk unnamed-chunk-11](PyDataDC2018Graphs-figure/unnamed-chunk-11-1.png)

What does this relationship mean?
====
![plot of chunk unnamed-chunk-12](PyDataDC2018Graphs-figure/unnamed-chunk-12-1.png)

Friend of my friend... 
====
![plot of chunk unnamed-chunk-13](PyDataDC2018Graphs-figure/unnamed-chunk-13-1.png)

or enemy of my enemy? 
====
![plot of chunk unnamed-chunk-14](PyDataDC2018Graphs-figure/unnamed-chunk-14-1.png)

What happens if relationships change?
======
![plot of chunk unnamed-chunk-15](PyDataDC2018Graphs-figure/unnamed-chunk-15-1.png)

What happens if relationships change?
======
![plot of chunk unnamed-chunk-16](PyDataDC2018Graphs-figure/unnamed-chunk-16-1.png)

What happens if relationships change?
======
![plot of chunk unnamed-chunk-17](PyDataDC2018Graphs-figure/unnamed-chunk-17-1.png)


Node attributes can also be nodes
======
![plot of chunk unnamed-chunk-18](PyDataDC2018Graphs-figure/unnamed-chunk-18-1.png)

Connections can be projected
========
![plot of chunk unnamed-chunk-19](PyDataDC2018Graphs-figure/unnamed-chunk-19-1.png)

These projections enrich our data
==========
![plot of chunk unnamed-chunk-20](PyDataDC2018Graphs-figure/unnamed-chunk-20-1.png)

Exploring Graphs with igraph
=====
<ol>
  <li style='color: lightgrey'>What's a Graph?</li>
  <li>Practical Applications: Recommendations</li>
  <li style='color: lightgrey'>Measuring Impact/Importance</li>
  <li style='color: lightgrey'>Practical Applications: Keyphrases</li>
  <li style='color: lightgrey'>Practical Applications: Models</li>
  <li style='color: lightgrey'><b>Code:</b> Creating and Exploring a Graph</li>
  <li style='color: lightgrey'>Concluding Remarks</li>
</ol>

Practical Application: Recommendations
======

**<br><h2>35% of what consumers buy on Amazon and 75% of what users watch on Netflix come from product recommendations</h2>**
<br>
<br>
<p style = 'font-size: 25px'>"How retailers can keep up with consumers"  Ian Mackenzie, Chris Meyer, and Steve Noble</p>

Content Based Recommendations
========================================================

<img src="collabFilter/shopRec05.png" title="plot of chunk unnamed-chunk-21" alt="plot of chunk unnamed-chunk-21" width="100%" />

Content Based Recommendations
========================================================

<img src="collabFilter/shopRec06.png" title="plot of chunk unnamed-chunk-22" alt="plot of chunk unnamed-chunk-22" width="100%" />

Content Based Recommendations
========================================================

<img src="collabFilter/shopRec07.png" title="plot of chunk unnamed-chunk-23" alt="plot of chunk unnamed-chunk-23" width="100%" />

Content Based Recommendations
========================================================

<img src="collabFilter/shopRec08.png" title="plot of chunk unnamed-chunk-24" alt="plot of chunk unnamed-chunk-24" width="100%" />

Content Based Recommendations 
========================================================

<img src="collabFilter/shopRec09.png" title="plot of chunk unnamed-chunk-25" alt="plot of chunk unnamed-chunk-25" width="100%" />

Collaborative Filtering 
========================================================

<img src="collabFilter/shopRec01.png" title="plot of chunk unnamed-chunk-26" alt="plot of chunk unnamed-chunk-26" width="100%" />

Collaborative Filtering 
========================================================

<img src="collabFilter/shopRec02.png" title="plot of chunk unnamed-chunk-27" alt="plot of chunk unnamed-chunk-27" width="100%" />

Collaborative Filtering 
========================================================

<img src="collabFilter/shopRec03.png" title="plot of chunk unnamed-chunk-28" alt="plot of chunk unnamed-chunk-28" width="100%" />

Collaborative Filtering 
========================================================

<img src="collabFilter/shopRec04.png" title="plot of chunk unnamed-chunk-29" alt="plot of chunk unnamed-chunk-29" width="100%" />


Exploring Graphs with igraph
=====
<ol>
  <li style='color: lightgrey'>What's a Graph?</li>
  <li style='color: lightgrey'>Practical Applications: Recommendations</li>
  <li>Measuring Impact/Importance</li>
  <li style='color: lightgrey'>Practical Applications: Keyphrases</li>
  <li style='color: lightgrey'>Practical Applications: Models</li>
  <li style='color: lightgrey'><b>Code:</b> Creating and Exploring a Graph</li>
  <li style='color: lightgrey'>Concluding Remarks</li>
</ol>


What nodes are important?
=====

![plot of chunk unnamed-chunk-30](PyDataDC2018Graphs-figure/unnamed-chunk-30-1.png)

Diameter and Shortest Paths
===
![plot of chunk unnamed-chunk-31](PyDataDC2018Graphs-figure/unnamed-chunk-31-1.png)

D Betweeness
=======
![plot of chunk unnamed-chunk-32](PyDataDC2018Graphs-figure/unnamed-chunk-32-1.png)

UD Betweeness
=======
![plot of chunk unnamed-chunk-33](PyDataDC2018Graphs-figure/unnamed-chunk-33-1.png)


In Degree
=======
![plot of chunk unnamed-chunk-34](PyDataDC2018Graphs-figure/unnamed-chunk-34-1.png)

Out Degree
=========
![plot of chunk unnamed-chunk-35](PyDataDC2018Graphs-figure/unnamed-chunk-35-1.png)

Degree
===========
![plot of chunk unnamed-chunk-36](PyDataDC2018Graphs-figure/unnamed-chunk-36-1.png)


In Closeness
=======
![plot of chunk unnamed-chunk-37](PyDataDC2018Graphs-figure/unnamed-chunk-37-1.png)

Out Closeness
=======
![plot of chunk unnamed-chunk-38](PyDataDC2018Graphs-figure/unnamed-chunk-38-1.png)

Closeness
=======
![plot of chunk unnamed-chunk-39](PyDataDC2018Graphs-figure/unnamed-chunk-39-1.png)

Hub Score
=======
![plot of chunk unnamed-chunk-40](PyDataDC2018Graphs-figure/unnamed-chunk-40-1.png)

Authority Score
=======
![plot of chunk unnamed-chunk-41](PyDataDC2018Graphs-figure/unnamed-chunk-41-1.png)

D Page Rank
====
![plot of chunk unnamed-chunk-42](PyDataDC2018Graphs-figure/unnamed-chunk-42-1.png)

UD Page Rank
====
![plot of chunk unnamed-chunk-43](PyDataDC2018Graphs-figure/unnamed-chunk-43-1.png)

Exploring Graphs with igraph
=====
<ol>
  <li style='color: lightgrey'>What's a Graph?</li>
  <li style='color: lightgrey'>Practical Applications: Recommendations</li>
  <li style='color: lightgrey'>Measuring Impact/Importance</li>
  <li>Practical Applications: Keyphrases</li>
  <li style='color: lightgrey'>Practical Applications: Models</li>
  <li style='color: lightgrey'><b>Code:</b> Creating and Exploring a Graph</li>
  <li style='color: lightgrey'>Concluding Remarks</li>
</ol>


Practical Application: Keyphrases
=========

**<h5>PyData conferences bring together users and developers of data analysis tools to share ideas and learn from each other. The PyData community gathers to discuss how best to apply Python tools, as well as tools using R and Julia, to meet evolving challenges in data management, processing, analytics, and visualization. We aim to be an accessible, community-driven conference, with tutorials for novices, advanced topical workshops for practitioners, and opportunities for package developers and users to meet in person.</h5>**


TextRank Algorithm
========
<ol>
  <li>Create a text graph</li>
  <li>Keep only words that are nouns and adjectives</li>
  <li>Run the PageRank algorithm</li>
  <li>Keep only the top 1/3 PageRanked vertices</li>
  <li>The remaining connections represent phrases</li>
  <ul><li>Make sure the words actually appear in sequential order before committing to a phrase</li></ul>
</ol>
<p style = 'font-size: 25px'>"TextRank: Bringing Order into Texts" Rada Mihalcea and Paul Tarau</p>
<p style = 'font-size: 25px'>"PositionRank: An Unsupervised Approach to Keyphrase Extraction from Scholarly Documents" Corina Florescu and Cornelia Caragea</p>

Proximity as a connection
=====
![plot of chunk unnamed-chunk-44](PyDataDC2018Graphs-figure/unnamed-chunk-44-1.png)

Proximity as a connection
=====

![plot of chunk unnamed-chunk-45](PyDataDC2018Graphs-figure/unnamed-chunk-45-1.png)

D TextRank: PyData
=====
![plot of chunk unnamed-chunk-46](PyDataDC2018Graphs-figure/unnamed-chunk-46-1.png)

UD TextRank: PyData
====
![plot of chunk unnamed-chunk-47](PyDataDC2018Graphs-figure/unnamed-chunk-47-1.png)

D TextRank: PyData's CoC
=====
![plot of chunk unnamed-chunk-48](PyDataDC2018Graphs-figure/unnamed-chunk-48-1.png)

UD TextRank: PyData's CoC
=====
![plot of chunk unnamed-chunk-49](PyDataDC2018Graphs-figure/unnamed-chunk-49-1.png)


Exploring Graphs with igraph
=======
<ol>
  <li style='color: lightgrey'>What's a Graph?</li>
  <li style='color: lightgrey'>Practical Applications: Recommendations</li>
  <li style='color: lightgrey'>Measuring Impact/Importance</li>
  <li style='color: lightgrey'>Practical Applications: Keyphrases</li>
  <li>Practical Applications: Models</li>
  <li style='color: lightgrey'><b>Code:</b> Creating and Exploring a Graph</li>
  <li style='color: lightgrey'>Concluding Remarks</li>
</ol>


Simple Contagion: Susceptible
===========

System at Time = 0

![plot of chunk unnamed-chunk-50](PyDataDC2018Graphs-figure/unnamed-chunk-50-1.png)


Simple Contagion: Infected
===========

System at Time = 1


![plot of chunk unnamed-chunk-51](PyDataDC2018Graphs-figure/unnamed-chunk-51-1.png)

SI Model
=======

<img src="SIR/SI_noR.gif" title="plot of chunk unnamed-chunk-52" alt="plot of chunk unnamed-chunk-52" width="700px" />


SI Model Quantified
======
<img src="PyDataDC2018Graphs-figure/unnamed-chunk-53-1.png" title="plot of chunk unnamed-chunk-53" alt="plot of chunk unnamed-chunk-53" width="700px" />


Simple Contagion: Recovered
===========
System at Time = 2 | Infection Life = 2

![plot of chunk unnamed-chunk-54](PyDataDC2018Graphs-figure/unnamed-chunk-54-1.png)


SIR Model
=======
<img src="SIR/SIR.gif" title="plot of chunk unnamed-chunk-55" alt="plot of chunk unnamed-chunk-55" width="700px" />

SIR Model Quantified
=====
<img src="PyDataDC2018Graphs-figure/unnamed-chunk-56-1.png" title="plot of chunk unnamed-chunk-56" alt="plot of chunk unnamed-chunk-56" width="700px" />


Complex Social Contagion: Agents Matter
===

System at Time = 0 | Resistence = 1 or 2

![plot of chunk unnamed-chunk-57](PyDataDC2018Graphs-figure/unnamed-chunk-57-1.png)

Complex Social Contagion: Agents Matter
===

System at Time = 1 | Resistence = 1 or 2

![plot of chunk unnamed-chunk-58](PyDataDC2018Graphs-figure/unnamed-chunk-58-1.png)

Complex Social Contagion: Agents Matter
===

System at Time = 2 | Resistence = 1 or 2

![plot of chunk unnamed-chunk-59](PyDataDC2018Graphs-figure/unnamed-chunk-59-1.png)


SI Model
=======
<img src="SIR/COMPLEX_SI_noR.gif" title="plot of chunk unnamed-chunk-60" alt="plot of chunk unnamed-chunk-60" width="700px" />


SI Model Quantified
======
<img src="PyDataDC2018Graphs-figure/unnamed-chunk-61-1.png" title="plot of chunk unnamed-chunk-61" alt="plot of chunk unnamed-chunk-61" width="700px" />

Exploring Graphs with igraph
=====
<ol>
  <li style='color: lightgrey'>What's a Graph?</li>
  <li style='color: lightgrey'>Practical Applications: Recommendations</li>
  <li style='color: lightgrey'>Measuring Impact/Importance</li>
  <li style='color: lightgrey'>Practical Applications: Keyphrases</li>
  <li style='color: lightgrey'>Practical Applications: Models</li>
  <li><b>Code:</b> Creating and Exploring a Graph</li>
  <li style='color: lightgrey'>Concluding Remarks</li>
</ol>

Code!
===========
<h1>Please check the provided Jupyter Notebook</h1>

Exploring Graphs with igraph
=====
<ol>
  <li style='color: lightgrey'>What's a Graph?</li>
  <li style='color: lightgrey'>Practical Applications: Recommendations</li>
  <li style='color: lightgrey'>Measuring Impact/Importance</li>
  <li style='color: lightgrey'>Practical Applications: Keyphrases</li>
  <li style='color: lightgrey'>Practical Applications: Models</li>
  <li style='color: lightgrey'><b>Code:</b> Creating and Exploring a Graph</li>
  <li>Concluding Remarks</li>
</ol>

dc2018.satrdays.org
======
<img src="brown_satrday_dc_2018.gif" title="plot of chunk unnamed-chunk-62" alt="plot of chunk unnamed-chunk-62" width="700px" />

@r_lgbtq
======
<img src="rainbowr.png" title="plot of chunk unnamed-chunk-63" alt="plot of chunk unnamed-chunk-63" width="500px" />

\#TDoRDatathon

Learn More!
======
<ul>
  <li>Katerine Ognyanova</li>
  <ul><li><a href='http://kateto.net/tutorials/'>http://kateto.net/tutorials/</a></li></ul>
  <li>Kelvin R. Lawrence</li>
  <ul><li><a href='http://kelvinlawrence.net/book/Gremlin-Graph-Guide.html'>http://kelvinlawrence.net/book/Gremlin-Graph-Guide.html</a></li></ul>
  <li>Neo4j</li>
  <ul><li><a href='https://neo4j.com/graphacademy/'>https://neo4j.com/graphacademy/</a></li></ul>
