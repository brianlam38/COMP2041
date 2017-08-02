#include <stdio.h>
#include <stdlib.h>

// write bytes of stream to stdout
void process_stream(FILE *in) {
	while (1) {
		int ch = fgetc(in);
		if (ch == EOF) {
			break;
		}
		if (fputc(ch, stdout) == EOF) {
			fprintf(stderr, "cat:");
			perror("");
			exit(1);
		}
	}
}