%{ 
	#include <stdio.h> 
	#include <string.h> 
	#include <stdlib.h> 
	extern int yylex(); 
	
	void yyerror(char *msg); 
	int flag; 
	
	int i; 
	int k =0;	 
%} 

%union { 
	char* f; 
} 

%token <f> STR 
%type <f> E 

/* Rule Section */
%% 

S : E { 
		flag = 0; 
		k = strlen($1); 
		for (i = 0; i < ((k&1)?(k/2-1):(k/2)); i++) {
			if ($1[i] != $1[k-1-i]) {
				flag = 1; 
				break;
			}
		}
		if (flag == 1) {
			printf("Not palindrome\n");
		} 
		else {
			printf("palindrome\n");
		}
	} 
; 

E : STR {$$ = $1;} 
; 

%% 

void yyerror(char *msg) 
{ 
	fprintf(stderr, "%s\n", msg); 
	exit(1); 
} 

int main() 
{ 
	printf("Enter any string \n");
	yyparse(); 
	return 0; 
} 
