#include "timer.h"
Timer::Timer() {
}

high_resolution_clock::duration Timer::elapsed() const {
  return high_resolution_clock::now() - epoch; 
}

void Timer::start() {
  epoch = high_resolution_clock::now(); 
}

