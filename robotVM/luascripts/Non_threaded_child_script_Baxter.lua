------------------------------------------------------------------------------ 
-- Following few lines automatically added by V-REP to guarantee compatibility 
-- with V-REP 3.1.3 and earlier: 
colorCorrectionFunction=function(_aShapeHandle_) 
    local version=simGetInt32Parameter(sim_intparam_program_version) 
    local revision=simGetInt32Parameter(sim_intparam_program_revision) 
    if (version<30104)and(revision<3) then 
        return _aShapeHandle_ 
    end 
    return '@backCompatibility1:'.._aShapeHandle_ 
end 
------------------------------------------------------------------------------ 
 
 
-- This is a simple non-threaded example script that enables/disables some of Baxter's devices:

if (sim_call_type==sim_childscriptcall_initialization) then 
    local headSensorOn=true
    local headCameraOn=true
    local rightHandSensorsOn=true
    local leftHandSensorsOn=true
    local headLightColor={1,0,0}

    for i=1,12,1 do
        local h=simGetObjectHandle('Baxter_ultrasonic_sensor'..i)
        if headSensorOn then
            simSetExplicitHandling(h,0)
        else
            simSetExplicitHandling(h,1)
            simResetProximitySensor(h)
        end
    end

    local headCam=simGetObjectHandle('Baxter_camera')
    if headCameraOn then
        simSetExplicitHandling(headCam,0)
    else
        simSetExplicitHandling(headCam,1)
        simResetVisionSensor(headCam)
    end

    local rightHandProx=simGetObjectHandle('Baxter_rightArm_proxSensor')
    local rightHandCam=simGetObjectHandle('Baxter_rightArm_camera')
    if rightHandSensorsOn then
        simSetExplicitHandling(rightHandProx,0)
        simSetExplicitHandling(rightHandCam,0)
        local camView=simFloatingViewAdd(0.9,0.9,0.2,0.2,0)
        simAdjustView(camView,rightHandCam,64)
    else
        simSetExplicitHandling(rightHandProx,1)
        simResetProximitySensor(rightHandProx)
        simSetExplicitHandling(rightHandCam,1)
        simResetVisionSensor(rightHandCam)
    end
    
    local leftHandProx=simGetObjectHandle('Baxter_leftArm_proxSensor')
    local leftHandCam=simGetObjectHandle('Baxter_leftArm_camera')
    if leftHandSensorsOn then
        simSetExplicitHandling(leftHandProx,0)
        simSetExplicitHandling(leftHandCam,0)
        local camView=simFloatingViewAdd(0.1,0.9,0.2,0.2,0)
        simAdjustView(camView,leftHandCam,64)
    else
        simSetExplicitHandling(leftHandProx,1)
        simResetProximitySensor(leftHandProx)
        simSetExplicitHandling(leftHandCam,1)
        simResetVisionSensor(leftHandCam)
    end

    headLight=simGetObjectHandle('Baxter_headRing')
    simSetShapeColor(colorCorrectionFunction(headLight),'',3,headLightColor)
end 

if (sim_call_type==sim_childscriptcall_cleanup) then 
    simSetShapeColor(colorCorrectionFunction(headLight),'',3,{0,1,0})
end 

