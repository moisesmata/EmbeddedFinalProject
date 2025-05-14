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
    {-38, -31, -1, -3, 1356},
    {97, -50, 1, -2, 308},
    {74, -37, -5, 3, 127},
    {12, 45, 2, -1, 450},
    {-23, 67, -3, 4, 789},
    {56, -89, 1, 2, 234},
    {34, 12, -2, -3, 567},
    {-78, 90, 3, -1, 890},
    {45, -67, -1, 2, 123},
    {89, 34, 2, -2, 456},
    {-12, -45, -3, 1, 678},
    {67, 23, 1, 3, 345},
    {-34, -78, 2, -1, 789},
    {90, 56, -1, 2, 234},
    {23, -12, 3, -3, 567},
    {-45, 89, -2, 1, 890},
    {78, -34, 1, 2, 123},
    {12, 67, -3, -1, 456},
    {-67, -23, 2, 3, 678},
    {34, 90, -1, -2, 345},
    {89, -45, 3, 1, 789},
    {-23, 12, -2, -3, 234},
    {56, -78, 1, 2, 567},
    {-12, 45, -3, -1, 890},
    {67, -34, 2, 3, 123},
    {-78, 23, -1, -2, 456},
    {45, 89, 3, -3, 678},
    {-34, -67, -2, 1, 345},
    {90, 12, 1, 2, 789},
    {23, -89, -3, -1, 234},
    {-45, 34, 2, 3, 567},
    {78, -12, -1, -2, 890},
};

    int timesteps; cin >> timesteps;
    // std::cout << "Number of timesteps: " << timesteps << std::endl;
    for(int i = 0; i < timesteps; ++i) {
        for(int j = 0; j < 32; ++j) {
            for(int k = 0; k < 32; ++k) {
                getAccl(&positions[j], &positions[k], i);
            }
        }
        for(int j = 0; j < 32; ++j) {
            positions[j].x += positions[j].vx;
            positions[j].y += positions[j].vy;
        }
        // std::cout << "Timestep " << i << "\n";
    }


    return 0;
}