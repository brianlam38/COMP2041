#include <stdio.h>
#include <stdlib.h>

// process files given as arguments
// if no arguments, process stdin
int main(int argc, char *argv[]) {
	if (argc == 1) {
		process_stream(stdin);
	} else {
		for (int i = 1; i < argc; i++) {
			FILE *in = fopen(argv[i], "r");
			if (in == NULL) {
				fprintf(stderr, "cat: %s: ", argv[i]);
				perror("");
				return 1;
			}
			process_stream(in);
			fclose(in);
		}
	}
	return 0;
}