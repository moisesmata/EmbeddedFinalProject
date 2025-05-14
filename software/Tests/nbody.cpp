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
    if (b1 == b2){
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

Body bodyFromLine(const std::string& line) {
    Body body;
    size_t start = 0, end;
    // x
    end = line.find(',', start);
    body.x = std::stod(line.substr(start, end - start));
    start = end + 1;
    // y
    end = line.find(',', start);
    body.y = std::stod(line.substr(start, end - start));
    start = end + 1;
    // vx
    end = line.find(',', start);
    body.vx = std::stod(line.substr(start, end - start));
    start = end + 1;
    // vy
    end = line.find(',', start);
    body.vy = std::stod(line.substr(start, end - start));
    start = end + 1;
    // m
    body.m = std::stod(line.substr(start));
    return body;
}

int main( int argc, char* argv[]) {
    

    if (argc < 2) {
        std::cerr << "Usage: " << argv[0] << " <bodies> <timesteps>" << std::endl;
        return 1;
    }
    std::vector<Body> positions;
    int bodies = std::stoi(argv[1]);
    for(int i = 0; i < bodies; ++i) {
        string line; cin >> line;
        Body body = bodyFromLine(line);
        positions.push_back(body);
    }
    std::cout << "Initial values of bodies:" << std::endl;
    for (size_t i = 0; i < positions.size(); ++i) {
        std::cout << "Body " << i << ": Position (" << positions[i].x << ", " << positions[i].y 
                  << "), Velocity (" << positions[i].vx << ", " << positions[i].vy 
                  << "), Mass " << positions[i].m << std::endl;
    }

    int timesteps = std::stoi(argv[2]);
    // std::cout << "Number of timesteps: " << timesteps << std::endl;
    for(int i = 0; i < timesteps; ++i) {
        for(int j = 0; j < positions.size(); ++j) {
            for(int k = 0; k < positions.size(); ++k) {
                getAccl(&positions[j], &positions[k], i);
            }
        }
        for(int j = 0; j < positions.size(); ++j) {
            positions[j].x += positions[j].vx;
            positions[j].y += positions[j].vy;
        }
        // std::cout << "Timestep " << i << "\n";
    }
    std::cout.precision(20);
    for (size_t j = 0; j < positions.size(); ++j) {
        std::cout << "Body " << j << ": Position (" << positions[j].x << ", " << positions[j].y 
                  << "), Velocity (" << positions[j].vx << ", " << positions[j].vy << ")" << std::endl;
    }

    return 0;
}