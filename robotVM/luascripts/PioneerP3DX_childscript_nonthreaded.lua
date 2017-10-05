function getJointPosition (jointHandle, previousJointPosition, totalJointPosition)
    local jointPosition=simGetJointPosition(jointHandle)
    local dx=jointPosition-previousJointPosition
    if (dx>=0) then
        dx=math.mod(dx+math.pi,2*math.pi)-math.pi
    else
        dx=math.mod(dx-math.pi,2*math.pi)+math.pi
    end
    totalJointPosition = totalJointPosition+dx
    return jointPosition, totalJointPosition, totalJointPosition/(2*math.pi)
end



if (sim_call_type==sim_childscriptcall_initialization) then

    -- Put some initialization code here
    
    leftJointName='Pioneer_p3dx_leftMotor'
    rightJointName='Pioneer_p3dx_rightMotor'
    
    -- Hopefully, this is generic
    if (simGetScriptExecutionCount()==0) then
        leftJointHandle=simGetObjectHandle(leftJointName)
        previousLeftJointPosition=simGetJointPosition(leftJointHandle)
        totalLeftJointPosition=0
        
        rightJointHandle=simGetObjectHandle(rightJointName)
        previousRightJointPosition=simGetJointPosition(rightJointHandle)
        totalRightJointPosition=0
    end

end


if (sim_call_type==sim_childscriptcall_actuation) then

    -- Put your main ACTUATION code here

end


if (sim_call_type==sim_childscriptcall_sensing) then

    -- Put your main SENSING code here
    previousLeftJointPosition, totalLeftJointPosition, totalLeftRotations =  getJointPosition (leftJointHandle, previousLeftJointPosition, totalLeftJointPosition)
    previousRightJointPosition, totalRightJointPosition, totalRightRotations =  getJointPosition (rightJointHandle, previousRightJointPosition, totalRightJointPosition)

    simSetFloatSignal('leftEncoder',totalLeftJointPosition)
    simSetFloatSignal('leftEncoder_rots', totalLeftRotations )

    simSetFloatSignal('rightEncoder',totalRightJointPosition)
    simSetFloatSignal('rightEncoder_rots', totalRightRotations )
  
end


if (sim_call_type==sim_childscriptcall_cleanup) then

    -- Put some restoration code here

end
