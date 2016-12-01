%x FORMAT

			/*----- Sección de Declaraciones --------------*/
%{
#include <stdio.h>

FILE * readme;
int cont= 0;
%}

%%			/*----- Sección de Reglas ----------------*/

\#|\@|\&|\%|\%\%													{BEGIN FORMAT;}
[^\#|\@|\&|"/code"|"/block"]+											{printf("IT'S OK\n"); printf("IT'S OK\n");}

<FORMAT>[1-6][^\#]+\#[1-6]$	      									{printf("IT'S OK\n"); printf("IT'S OK\n");BEGIN INITIAL;}
<FORMAT>[^\@]+\@ 																		{printf("hey"); BEGIN INITIAL;}
<FORMAT>[^\&]+\&																		{printf("hey"); BEGIN INITIAL;}
<FORMAT>[^"/block"]+"/block"												{printf("hey"); BEGIN INITIAL;}
<FORMAT>[^"/code"]+"/code"													{printf("hey"); BEGIN INITIAL;}

%%
			/*----- Sección de Procedimientos --------*/
int main (int argc, char *argv[]) {
	if (argc == 2) {
		yyin = fopen (argv[1], "rt");
		if (yyin == NULL) {
			printf ("El fichero %s no se puede abrir\n", argv[1]);
			exit (-1);
		}
	}
	else yyin = stdin;

	readme = fopen("Leeme.txt", "wt");
	if(readme == NULL){
		printf("El fichero no se ha podido crear\n");
		exit(-1);
	}
	if(readme != NULL){

	yylex();

	fclose(readme);

	return 0;
	}
}

void titulo(int alm){

	cont= 0;

	while(cont < alm){
		fputc('#', readme);
		cont++;
	}

	printf("IT'S OK\n");
	cont = 1;
	while(yytext[cont] != '#'){
		fputc(yytext[cont], readme);
		cont++;
	}
	printf("IT'S OK\n");
}

void escribir(){
	cont = 0;

	printf("IT'S OK\n");
	while(yytext[cont]!= '/0'){
		fputc(yytext[cont], readme);
		cont++;
	}
	printf("IT'S OK\n");
}
