+++
date = "1969-12-31T16:00:00-08:00"
draft = true
title = "Optimize JPEGs with ImageMagick"
slug = "optimize-jpegs-with-imagemagick"
aliases = [
	"optimize-jpegs-with-imagemagick"
]
+++
Converts a baseline JPEG to progressive JPEG

    $ convert -strip -interlace Plane source.jpg destination.jpg
