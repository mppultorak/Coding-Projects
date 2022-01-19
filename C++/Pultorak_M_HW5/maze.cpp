#include "maze.h"

/*
Constructor:
Builds maze connections though node function
*/

maze::maze()
{
    A->set_node_connections(NULL, E, B, NULL);
    B->set_node_connections(NULL, F, NULL, A);
    C->set_node_connections(NULL, G, NULL, NULL);
    D->set_node_connections(NULL, H, NULL, NULL);
    E->set_node_connections(A,I,NULL,NULL);
    F->set_node_connections(B, NULL, G, NULL);
    G->set_node_connections(C, NULL, H, F);
    H->set_node_connections(D, L, NULL, G);
    I->set_node_connections(E, NULL, J, NULL);
    J->set_node_connections(NULL, NULL, K, I);
    K->set_node_connections(NULL, NULL, NULL, J);
}


/*
Destructor:
Deletes heap space made by maze
*/
maze::~maze()
{
    delete A;
    delete B;
    delete C;
    delete D;
    delete E;
    delete F;
    delete G;
    delete H;
    delete I;
    delete J;
    delete K;
}

void maze::maze_exe()
{   
    char choice;
    while (current_val->get_node_val() != "L") // Checks ending value
    {
        /*
        Builds menu based on directions avaiable
        */
        std::string choice_menu = "";
        std::cout << "\nYou are in room " << current_val->get_node_val() 
                  << " of a maze of twisty little passages, all alike.\nYou can go: ";
        if (current_val->get_north())
            choice_menu += "[North] ";
        if (current_val->get_south())
            choice_menu += "[South] ";
        if (current_val->get_east())
            choice_menu += "[East] ";
        if (current_val->get_west())
            choice_menu += "[West]";
        std::cout << choice_menu;
        std::cout << "\nTo quit type 'q'\n";
        std::cout << "\nChoose a direction: ";
        std::cin >> choice;                     // Takes user choice
        choice = tolower(choice);
        /*
        Checkes user choice for validity
        If it is valid: moves current_val (pointer) to values specified 
        If it is not valid: Print error and move on to next loop
        */
        if (choice == 'n' && current_val->get_north())
            current_val = current_val->get_north();
        else if (choice == 's' && current_val->get_south())
            current_val = current_val->get_south();
        else if (choice == 'e' && current_val->get_east())
            current_val = current_val->get_east();
        else if(choice == 'w' && current_val->get_west())
            current_val = current_val->get_west();
        else if(choice == 'q')
        {
            std::cout<<"Exiting maze.....\n";
            return;
        }
        else
            std::cout << "Choice given: " << choice << " is not valid!\nPlease enter a valid option.\n";
    }

    std::cout<< "\nYou made it to the end of the maze!\n\n";
}