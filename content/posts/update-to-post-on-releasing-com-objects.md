+++
date = "2004-06-27T07:54:00-07:00"
draft = false
title = "Update to post on releasing COM objects"
slug = "update-to-post-on-releasing-com-objects"
aliases = [
	"update-to-post-on-releasing-com-objects"
]
+++

        <P>This is just a little update to an <A href="http://markpit.com/blog/blog/archive/2004/04/21/160.aspx" target=_blank>earlier post</A> on Outlook and .Net The method signature should be changed to:</P>
<P><PRE>public static void Release(params object[] comObjects)</PRE>
<P>That way you don't have to create an array of your COM objects, just list them separated by commas. Like so:</P>
<P><PRE>ComUtils.Release(outlookMailItem, outlookNameSpace, outlookApplication);</PRE>
<P></P>
<P>Hope that helps someone out there!</P>
<P>Update: I went ahead and turned this code into an <A href="http://markpit.com/blog/blog/articles/205.aspx">article</A>.</P>
      