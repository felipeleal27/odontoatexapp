#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>

int main() {
    pid_t pid;

    printf("Processo pai (PID=%d) criando processos zumbis...\n", getpid());

    // Loop para criar processos zumbis
    for (int i = 0; i < 5; i++) {
        pid = fork();

        if (pid < 0) {
            perror("fork");
            exit(EXIT_FAILURE);
        } else if (pid == 0) {
            printf("Processo filho (PID=%d) criado.\n", getpid());
            exit(EXIT_SUCCESS);
        }
    }

    sleep(10); 
    printf("Processos zumbis criados!\n");

    return 0;
}
