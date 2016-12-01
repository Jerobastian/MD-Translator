%x TITULO
%x BLACK
%x CURSIVA
%x CODE

			/*----- Sección de Declaraciones --------------*/
%{
#include <stdio.h>
#include <stdlib.h>

FILE * readme;
int cont= 0;
%}

%%			/*----- Sección de Reglas ----------------*/

\#																									{BEGIN TITULO;}
\@																									{BEGIN BLACK;}
\&																									{BEGIN CURSIVA;}
\%																									{BEGIN CODE;}
[^\#|\@|\&|\%]+																			{escribir();}

<TITULO>[1-6][^\#]+\#[1-6]$	      									{char c; c= yytext[0]; titulo(c-48); BEGIN INITIAL;}
<BLACK>[^\@]+\@ 																		{negrita(); BEGIN INITIAL;}
<CURSIVA>[^\&]+\&																		{cursiva(); BEGIN INITIAL;}
<CODE>[^\%]+\%																			{code(); BEGIN INITIAL;}

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

	cont = 1;
	while(yytext[cont] != '#'){
		fputc(yytext[cont], readme);
		cont++;
	}
}

void escribir(){
	cont = 0;

	while(yytext[cont]!= '\0'){
		fputc(yytext[cont], readme);
		cont++;
	}
}

void negrita(){
	cont = 0;

	fputc('*', readme);
	fputc('*', readme);

	while(yytext[cont]!= '@'){
		fputc(yytext[cont], readme);
		cont++;
	}

	fputc('*', readme);
	fputc('*', readme);
}

void cursiva(){
	cont = 0;

	fputc('*', readme);

	while(yytext[cont]!= '&'){
		fputc(yytext[cont], readme);
		cont++;
	}

	fputc('*', readme);
}

void code(){
	cont = 0;

	fputc('`', readme);
	fputc('`', readme);
	fputc('`', readme);

	while(yytext[cont]!= '%'){
		fputc(yytext[cont], readme);
		cont++;
	}

	fputc('`', readme);
	fputc('`', readme);
	fputc('`', readme);
}
