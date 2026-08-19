#include "Integrator.h"

void Integrator::update(float err){
    integral += err*dt;
}
