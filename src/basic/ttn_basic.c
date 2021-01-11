#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define PROG_BUFFER_LEN 100
char *prog_buffer[PROG_BUFFER_LEN] = {0};


void add(int index, char *program)
{
    if(prog_buffer[index]) {
        free(prog_buffer[index]);
        prog_buffer[index] = 0;
    }
    prog_buffer[index] = strdup(program);
    free(program);
}

void list()
{
    for(int i=0; i< PROG_BUFFER_LEN; ++i) {
        if(prog_buffer[i]) {
            printf("%d\t%s\n", i, prog_buffer[i]);
        }
    }
}

void execute()
{
    for(int i=0; i< PROG_BUFFER_LEN; ++i) {
        if(prog_buffer[i]) {
            if(strlen(prog_buffer[i]) > 5 && !strncmp(prog_buffer[i], "PRINT", 5)) {
                printf("\t%s\n", prog_buffer[i]+6);
            }
        }
    }
}


