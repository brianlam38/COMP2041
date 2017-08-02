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

// Count lines, words, chars in stream
// This program mimics the Word Count tool in unix
void count_file(FILE *in) {
	int n_lines = 0, n_words = 0, n_chars = 0;
	int in_word = 0, c;
	while ((c = fget(in)) != EOF) {
		n_chars++;
		if (c == '\n') n_lines++;
		if (isspace(c)) in_word = 0;
		else if (!in_word) {
			in_word = 1;
			n_words++;
		}
	}
	printf("%6d %6d %6d", n_lines, n_words, n_chars);
}



