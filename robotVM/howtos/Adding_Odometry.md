# Adding Odometry

The rotary joints modelled within the simulator return a value between +/- 180 degrees that reports on the angle of turn.

To keep track of the total angular distance travelled by the joint, or derived metrics such as a rotation count, we need to implement our own odometry measures.

For example, in the `LineTracer` robot, we might add the following child script, creating a handle that can be used to track the total accumulated angle turned by the joint that drives the left wheel, along with a count of the number of accumulated rotations.

```
if (sim_call_type==sim_childscriptcall_initialization) then

    -- Put some initialization code here
    
    if (simGetScriptExecutionCount()==0) then
        jointHandle=simGetObjectHandle('DynamicLeftJoint')
        previousJointPosition=simGetJointPosition(jointHandle)
        totalJointPosition=0
    end

    graphHandle=simGetObjectHandle("LightRotGraph")

end


if (sim_call_type==sim_childscriptcall_actuation) then

    -- Put your main ACTUATION code here

end


if (sim_call_type==sim_childscriptcall_sensing) then

    -- Put your main SENSING code here

    local dx=simGetJointPosition(jointHandle)-previousJointPosition
    if (dx>=0) then
        dx=math.mod(dx+math.pi,2*math.pi)-math.pi
    else
        dx=math.mod(dx-math.pi,2*math.pi)+math.pi
    end

    totalJointPosition=totalJointPosition+dx
    previousJointPosition=simGetJointPosition(jointHandle)
    rotations = totalJointPosition/(2*math.pi)

    simSetFloatSignal('leftEncoder',totalJointPosition)

    simSetFloatSignal('leftEncoder_rots', rotations )
  
    simSetGraphUserData(graphHandle,'Rotations', rotations)

  
end


if (sim_call_type==sim_childscriptcall_cleanup) then

    -- Put some restoration code here

end

```

In addition, we can pass the odometry data to a chart object defined in the simulator using the the `simSetGraphUserData()`