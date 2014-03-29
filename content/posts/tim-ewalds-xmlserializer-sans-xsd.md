+++
date = "2004-07-27T18:25:00-07:00"
draft = false
title = "Tim Ewald's XmlSerializer sans XSD"
slug = "tim-ewalds-xmlserializer-sans-xsd"
aliases = [
	"tim-ewalds-xmlserializer-sans-xsd"
]
+++
Interesting post here:&nbsp;<a href="http://pluralsight.com/blogs/tewald/archive/2004/06/18/428.aspx" target="_blank">XmlSerializer sans XSD</a> about writing classes that will serialize to a specific xml format when you don't have an XSD. This seems like a lot of work though. Why not just use xsd.exe to generate the schema from the xml and then use that schema to generate your class(es)? Even if it isn't the exact end result you are looking for, it is a pretty good starting point.