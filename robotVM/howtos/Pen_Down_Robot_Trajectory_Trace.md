# Pen Down / Robot Trajectory Trace

*via http://www.forum.coppeliarobotics.com/viewtopic.php?f=9&t=2071

1. Select the robot, right-click->add->graph
2.  double click on Graph icon in the scene hierarchy
3. add new data stream to record
4. select data stream type Object:Absolute x-position and Object /items to record: *YOUR_ROBOT* then click ok, rename Data [*Your robot*] as x. (Ideally, you want to try to find a named object that is on the vertical line that passes through thre center of rotation of th e robot, which as the midpoint of the line that joins the centres of the two wheels in a two wheeled robot.)
5. repeat step 4 selecting Object:absolute y-position renamed as y and Object:absolute z-position renamed as z 
6. click on Edit 3D curve
7. click add new curve and associate the X- , Y-, Z-values respectively with the x, y, z variables you created, and then click ok
8. you can now adjust the following curve properties in the 3D curve menu:
  - name
  - color
  - width 

The 3D curve menu also allows the visibility of the line to be either set as visible or not displayed and hidden from view.


In the main graph menu, you can set/unset the `Buffer is cyclic` setting to clear the buffer / delete historical traces. You can also modify the buffer size, which effectively controls the length of the t(r)ail the robot has behind it. 