#include "node.h"


node::node()
{
    north = NULL;
    south = NULL;
    east = NULL;
    west = NULL;
}

node::node(std::string node_val)
{
    this->node_val = node_val;
}

void node::set_node_connections(node *n, node *s, node *e, node *w)
{
    north = n;
    south = s;
    east = e;
    west = w;
}

node *node::get_north() const
{
    return north;
}

node *node::get_south() const
{
    return south;
}

node *node::get_east() const
{
    return east;
}

node *node::get_west() const
{
    return west;
}

std::string node::get_node_val() const
{
    return node_val;
}