#include <iostream>
#include <fstream>
#include <vector>
#include <sstream>
#include <string>
#include <cmath>

struct Position {
    double x, y, z;
};

struct Body {
    double x, y, vx, vy, m;
};

std::vector<Position> readPositionsFromCSV(const std::string& filename) {
    std::vector<Position> positions;
    std::ifstream file(filename);
    if (!file.is_open()) {
        std::cerr << "Error: Could not open file " << filename << std::endl;
        return positions;
    }

    std::string line;
    while (std::getline(file, line)) {
        std::stringstream ss(line);
        std::string value;
        Position pos;

        if (std::getline(ss, value, ',')) pos.x = std::stod(value);
        if (std::getline(ss, value, ',')) pos.y = std::stod(value);
        if (std::getline(ss, value, ',')) pos.z = std::stod(value);

        positions.push_back(pos);
    }

    file.close();
    return positions;
}

std::vector<Body> readBodiesFromCSV(const std::string& filename) {
    std::vector<Body> bodies;
    std::ifstream file(filename);
    if (!file.is_open()) {
        std::cerr << "Error: Could not open file " << filename << std::endl;
        return bodies;
    }

    std::string line;
    while (std::getline(file, line)) {
        std::stringstream ss(line);
        std::string value;
        Body body;

        if (std::getline(ss, value, ',')) body.x = std::stod(value);
        if (std::getline(ss, value, ',')) body.y = std::stod(value);
        if (std::getline(ss, value, ',')) body.vx = std::stod(value);
        if (std::getline(ss, value, ',')) body.vy = std::stod(value);
        if (std::getline(ss, value, ',')) body.m = std::stod(value);

        bodies.push_back(body);
    }

    file.close();
    return bodies;
}

void getAccl(Body * b1, Body * b2, int n) {
    if (b1 == b2) return;
    double dx = b2->x - b1->x;
    double dy = b2->y - b1->y;
    double r = sqrt(dx * dx + dy * dy);
    double accl = (b1->m) / (r * r * r);
    double ax = accl * dx;
    double ay = accl * dy;
    if(n == 0){
        ax /=2;
        ay /=2;
    }
    b2->vx += ax;
    b2->vy += ay;
}

int main( int argc, char* argv[]) {
    std::string filename = "input.csv"; // Replace with your CSV file path
    std::vector<Body> positions = readBodiesFromCSV(filename);

    if (argc < 2) {
        std::cerr << "Usage: " << argv[0] << " <timesteps>" << std::endl;
        return 1;
    }

    int timesteps = std::stoi(argv[1]);
    std::cout << "Number of timesteps: " << timesteps << std::endl;
    for(int i = 0; i < timesteps; ++i) {
        std::cout << "Timestep " << i << ": ";
        for(int j = 0; j < positions.size(); ++j) {
            for(int k = j + 1; k < positions.size(); ++k) {
                getAccl(&positions[j], &positions[k], i);
            }
        }
    }
    for (size_t j = 0; j < positions.size(); ++j) {
        std::cout << "Body " << j << ": Position (" << positions[j].x << ", " << positions[j].y << ")" << std::endl;
    }

    return 0;
}