# Working With Video Sensors

How to create a video display in the simulator: http://www.forum.coppeliarobotics.com/viewtopic.php?f=9&t=445

A simpler way of displaying the content of a vision sensor is to add an auxiliary view ([right popup --> Add --> Floating view]). Then select your vision sensor, then right click on the newly added floating view [right popup --> View --> Associate view with selected vision sensor].


## Accessing video feeds via the remote API

http://www.forum.coppeliarobotics.com/viewtopic.php?f=9&t=3925

http://www.forum.coppeliarobotics.com/viewtopic.php?f=9&t=2695

```python
import numpy as np
from PIL import Image
#import cv2

from pyrep import VRep
from pyrep.vrep import vrep as vrep

#Ensure there are no outstanding simulations running
vrep.simxFinish(-1)

#Open  connection to the simulator
api=VRep.connect("127.0.0.1", 19997)
clientID=api.simulation._id

print('Connected to remote API server')
print('Vision Sensor object handling')
res, v1 = vrep.simxGetObjectHandle(clientID, 'Baxter_rightArm_camera', vrep.simx_opmode_oneshot_wait)
print('Getting first image')
err, resolution, image = vrep.simxGetVisionSensorImage(clientID, v1, 0, vrep.simx_opmode_streaming)
ok=True
while ok:#(vrep.simxGetConnectionId(clientID) != -1):
    err, resolution, image = vrep.simxGetVisionSensorImage(clientID, v1, 0, vrep.simx_opmode_buffer)
    if err == vrep.simx_return_ok:
        print("image OK!!!")
        img = np.array(image,dtype=np.uint8)
        img.resize([resolution[1],resolution[0],3])
        #cv2.imshow('image',img)
        ##if cv2.waitKey(1) & 0xFF == ord('q'):
        #    break
        ok=False
    elif err == vrep.simx_return_novalue_flag:
        print("no image yet")
        pass
    else:
        print(err)
im = Image.fromarray(img)
im
```

