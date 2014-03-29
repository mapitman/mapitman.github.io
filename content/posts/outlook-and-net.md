+++
date = "2004-04-22T06:48:00-07:00"
draft = false
title = "Outlook and .Net"
slug = "outlook-and-net"
aliases = [
	"outlook-and-net"
]
+++

        <P>If you are developing an addin for Outlook in C# or another .Net language or even just using COM from .Net, you should be cleaning up your COM objects (duh!). But, setting them to null is not enough. You must use the System.Runtime.InteropServices.Marshal.ReleaseComObject method to remove all references to that COM object. Here's a little class that you can use so you don't have to retype the code all over the place.</P><PRE>using System;
using System.Runtime.InteropServices;
namespace Utils{
    public class ComUtils {
        public ComUtils() {
   
        }
        /// &lt;summary&gt;
        /// Force a release of the COM objects and do garbage collection.
        /// If you are using Outlook objects, this will allow Outlook to 
        /// exit cleanly after you are done with it.
        /// &lt;/summary&gt;
        /// &lt;param name="comObjects"&gt;Array of COM objects to release, 
        /// be sure to add the objects to the array in the order you want 
        /// them destroyed!&lt;/param&gt;
        public static void Release(object[] comObjects) {
            try {
                for(int i = 0; i&lt;comObjects.Length;i++) {      
                    if(comObjects[i] != null) {
                        try{
                            // loop until the reference count is zero 
                            while(Marshal.ReleaseComObject(comObjects[i]) &gt; 0);       
                        }
                        catch(System.InvalidCastException){
                            // the object was not a COM object
                            // no big deal, just go on to the next one
                        }
                        catch(System.NullReferenceException){
                            // object was null, still no big deal
                            // go on to next one
                        }
                        finally{
                            comObjects[i] = null;
                        }
                    }
                } 
            }
            catch (Exception ex) {
                // insert your exception handling here
            }
            finally {
                // force a garbage collect to occur
                GC.Collect();
                // Wait for the thread processing the 
                // queue of finalizers to finish
                GC.WaitForPendingFinalizers();
            }
        }
    }
}
</PRE><BR>Just create an object array of your COM objects (in the order you want them released) and pass them to the Realease method of this class. For example: 
<P></P><PRE></PRE>
<P><CODE>ComUtils.Release(new object[], {outlookMailItem, outlookNameSpace, outlookApplication);</CODE></P>
<P>&nbsp;The GC.Collect() and GC.WaitForPendingFinalizers() are very important. I was recently working on an Outlook Addin and didn't have those two lines in there. Outlook would NOT shut down completely until I added them in!</P>
      