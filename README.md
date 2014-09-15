iOS8-SKLightNode
================

This is a little tutorial how to set up a Sprite Kit Scene with the new beta of iOS 8 and the SKLightNode. How to make gorgeous shadows and BumpMapping effects that they call normalMapped.

Read the full blogpost / tutorial on:
http://www.ymc.ch/en/playing-with-ios-8-sprite-kit-and-sklightnode


![Valid XHTML] (http://www.ymc.ch/wp-content/uploads/2014/06/ios8-normalMapped-and-shadows1.png)

## Notices ##
Keep in mind that this only works with the new version of Xcode 6 that is now available for apple developers as a beta in the apple developers center. Also remember that the new functionalities of Sprite Kit are also very beta and at this level are not claimed to work reliably or performantly.

The normalMap isn't rendered on a real device in my case, only in the simulator, and the performance decrease is very strong. 
It also seems the falloff attribute has no effect and the shadow is only rendering the bounding square of a sprite, not processing the alpha values. 
So a circle image still drops a box shadow ...but let's see how upcoming versions will fix all this issues.