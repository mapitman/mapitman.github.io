+++
date = "2005-04-02T08:17:06-08:00"
draft = false
title = "COM and .NET"
slug = "com-and-net"
aliases = [
	"com-and-net"
]
+++

        
		<div class="postcontent">
				<p>If you are developing an addin for Outlook
in C# or another .Net language, automating Outlook or even just using
COM from .Net, you should be cleaning up your COM objects (duh!). But,
setting them to null is not enough. You must use the
System.Runtime.InteropServices.Marshal.ReleaseComObject method to
remove all references to that COM object. Here's a little class that
you can use so you don't have to retype the code all over the place.</p>
				<pre>using System;<br />using System.Runtime.InteropServices;<br />namespace Utils{<br /> public class ComUtils {<br /> public ComUtils() {<br /><br /> }<br /> /// &lt;summary&gt;<br /> /// Force a release of the COM objects.<br /> /// If you are using Outlook objects, this will allow Outlook to <br /> /// exit cleanly after you are done with it.<br /> /// &lt;/summary&gt;<br /> /// &lt;param name="comObjects"&gt;Array of COM objects to release, <br /> /// be sure to add the objects to the array in the order you want <br /> /// them destroyed!&lt;/param&gt;<br /> public static void Release(params object[] comObjects) {<br /> try {<br /> for(int i = 0; i&lt;comObjects.Length;i++) { <br /> if(comObjects[i] != null) {<br /> try{<br /> // loop until the reference count is zero <br /> while(Marshal.ReleaseComObject(comObjects[i]) &gt; 0); <br /> }<br /> catch(System.InvalidCastException){<br /> // the object was not a COM object<br /> // no big deal, just go on to the next one<br /> }<br /> catch(System.NullReferenceException){<br /> // object was null, still no big deal<br /> // go on to next one<br /> }<br /> finally{<br /> comObjects[i] = null;<br /> }<br /> }<br /> } <br /> }<br /> catch (Exception ex) {<br /> // insert your exception handling here<br /> }<br /> }<br /> }<br />}<br /></pre>
				<br />Just
pass in a comma separated list of your COM objects (in the order you
want them released) to the Release method of this class. For example:  <p><code>ComUtils.Release(outlookMailItem, outlookNameSpace, outlookApplication);</code></p><p>I haven't tried it, but I assume the same type of stuff applies to automating Excel or Word too.</p></div>

      