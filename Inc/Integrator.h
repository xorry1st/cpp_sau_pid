#pragma once

class Integrator
{
    float dt;
    float integral;
public:
    Integrator() {dt = 1; integral = 0;}
    Integrator(float dt) {Integrator::dt = dt;}
    void SetDeltaT(float dt) {Integrator::dt = dt;}
    void update(float err);
};
