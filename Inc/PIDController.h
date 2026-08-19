#pragma once
class PIDController{
    float Kp;
    float Ki;
    float Kd;

    float setPoint;

    float eCur;
    float ePrev;

    float out;
    
};