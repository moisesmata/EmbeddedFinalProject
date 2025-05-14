#include <iostream>
#include <fstream>
#include <vector>
#include <sstream>
#include <string>
#include <cmath>
using namespace std;
struct Position {
    double x, y, z;
};

struct Body {
    double x, y, vx, vy, m;
};




void getAccl(Body * b1, Body * b2, int n) {
    if (b1->x == b2->x && b1->y == b2->y) {
         // cout << "b1 == b2" << endl;
         // cout << "b1: " << b1->x << ", " << b1->y << endl;
         // cout << "b2: " << b2->x << ", " << b2->y
        // cout << ("b1 == b2") << endl;
         return;}
    double dx = b2->x - b1->x;
    double dy = b2->y - b1->y;
    double r = 1.0/sqrt(dx * dx + dy * dy);
    double r2 = r * r;
    double r3 = r2 * r;
    double accl = (b1->m) * r3;
    double ax = accl * dx;
    double ay = accl * dy;
    if(n == 0){
        ax /=2;
        ay /=2;
    }
    b2->vx -= ax;
    b2->vy -= ay;
}



int main( int argc, char* argv[]) {
    

    if (argc < 2) {
        std::cerr << "Usage: " << argv[0] << " <bodies> <timesteps>" << std::endl;
        return 1;
    }
    Body positions[] = {
    {-38,-31,-1,-3,1356},
    {97,-50,1,-2,308},
    {74,-37,-5,3,127},
};

    int timesteps; cin >> timesteps;
    // std::cout << "Number of timesteps: " << timesteps << std::endl;
    for(int i = 0; i < timesteps; ++i) {
        for(int j = 0; j < 3; ++j) {
            for(int k = 0; k < 3; ++k) {
                getAccl(&positions[j], &positions[k], i);
            }
        }
        for(int j = 0; j < 3; ++j) {
            positions[j].x += positions[j].vx;
            positions[j].y += positions[j].vy;
        }
        // std::cout << "Timestep " << i << "\n";
    }


    return 0;
}