#ifndef TIMER_H	
#define TIMER_H

#include <chrono>
//#include <thread>
#include <iostream>

using namespace std::chrono;

class Timer {
    public:
        //typedef high_resolution_clock Clock;


        Timer();
        void start();
        high_resolution_clock::duration elapsed() const;
    private:
        high_resolution_clock::time_point epoch;
};

// Use example:
//int main() {
//    Timer timer;
//       timer.start();

// sleep some time
//   std::this_thread::sleep_for(microseconds(40));
//
//     const auto elapsed = timer.time_elapsed();
//       std::cout << duration_cast<microseconds>(elapsed).count() << "us" << std::endl;
//       }
#endif

