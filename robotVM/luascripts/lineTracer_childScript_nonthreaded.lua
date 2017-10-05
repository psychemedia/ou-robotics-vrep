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
