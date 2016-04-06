---
title       : Earthquakes in Fiji Area
subtitle    : Exploration App
author      : Miguel A. Regueira
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []   # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Introduction

* This presentation is part of the course assignment fo module Developing Data Products from Data Science Spacialization from Johns Hopkins University

* The app has been developed with shiny

* The goal of the app is to help to explore earthquakes in Fiji Area

* Dataset used can be found in datasets library. This dataset ive the locations of 1000 seismic events of MB > 4.0. The events occurred in a cube near Fiji since 1964 and contains the following fields:
    + lat: Latitude of event
    + long: Longitude
    + depth: Depth (km)
    + mag: Richter Magnitude
    + stations: Number of stations reporting

--- 

## Map view

In the app it is shown where the earthquakes took place in a map and the magnitude:

![](./figures/screenshot.png)

--- 

## Correlation figures

Here is intended to be shown the correlation plots used in the tool with ggplot2 library.

![plot of chunk corr](assets/fig/corr-1.png)


--- 

## Local run and requirements

* The app is running in shinyapps.io until free quota is reached: https://eregmig.shinyapps.io/Course_assignment/
* Source Files can be found in Github: https://github.com/eregmig/Developing-Data-Products
* Requirements:
    + leaflet
    + ggplot2
    + gridextra
    + shiny

