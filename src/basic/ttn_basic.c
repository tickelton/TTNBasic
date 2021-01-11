#include <stdio.h>
#include <stdlib.h>

void add(int index, char *program)
{
    printf("add: '%d' -> '%s'\n", index, program);
    free(program);
}

void list()
{

}

void execute()
{

}


