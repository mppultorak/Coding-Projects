#ifndef node_h
#define node_h
#endif

#include <iostream>
#include <string>


class node
{
    public:
    node();
    node(std::string node_val); // Lable for current node
    node* get_north() const; //
    node* get_south() const; // Gets connections
    node* get_east() const;  //
    node* get_west() const;  //
    std::string get_node_val() const;
    void set_node_connections(node *n, node *s, node *e, node *w); // sets connections to other nodes

    private:
    std::string node_val;
    node *north;
    node *south;
    node *east;
    node *west;

};