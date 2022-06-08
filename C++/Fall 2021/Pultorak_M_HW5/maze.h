#ifndef maze_h
#define maze_h
#endif
#include "node.h"

class maze : public node
{
    public:
    maze(); // builds connections of maze
    ~maze();
    void maze_exe(); // Runs maze 

    private:
    node *A = new node("A");
    node *B = new node("B");
    node *C = new node("C");
    node *D = new node("D");
    node *E = new node("E");
    node *F = new node("F");
    node *G = new node("G");
    node *H = new node("H");
    node *I = new node("I");
    node *J = new node("J");
    node *K = new node("K");
    node *L = new node("L");
    node *current_val = A;
};