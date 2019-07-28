+++
date = "2005-04-02T08:17:06-08:00"
draft = false
title = "COM and .NET"
slug = "com-and-net"
aliases = [
	"com-and-net"
]
+++
If you are developing an addin for Outlook in C# or another .Net
language, automating Outlook or even just using COM from .Net, you 
should be cleaning up your COM objects (duh!). But, setting them to null
is not enough. You must use the 
`System.Runtime.InteropServices.Marshal.ReleaseComObject()` method to
remove all references to that COM object. Here's a little class that
you can use so you don't have to retype the code all over the place.

```c#
using System;
using System.Runtime.InteropServices;
namespace Utils
{
	public class ComUtils
	{

		/// <summary>
		/// Force a release of the COM objects.
		/// If you are using Outlook objects, this will allow Outlook to
		/// exit cleanly after you are done with it.
		/// </summary>
		/// <param name="comObjects">Array of COM objects to release,
		/// be sure to add the objects to the array in the order you want
		/// them destroyed!</param>
		public static void Release(params object[] comObjects)
		{
			try
			{
				for(int i = 0; i<comObjects.Length;i++)
				{
					if(comObjects[i] != null)
					{
						try {
							// loop until the reference count is zero
							while(Marshal.ReleaseComObject(comObjects[i]) > 0);
						}
						catch(System.InvalidCastException) {
							// the object was not a COM object
							// no big deal, just go on to the next one
						}
						catch(System.NullReferenceException) {
							// object was null, still no big deal
							// go on to next one
						}
						finally{
							comObjects[i] = null;
						}
					}
				}
 			}
			catch (Exception ex)
			{
				// insert your exception handling here
			}
		}
 	}
}
```

Just pass in a comma separated list of your COM objects (in the order
you want them released) to the Release method of this class.
For example:
```c#
ComUtils.Release(outlookMailItem, outlookNameSpace, outlookApplication);
```
I haven't tried it, but I assume the same thing applies to
automating Excel or Word too.
