
			/*----- Sección de Declaraciones --------------*/
%{
#include <stdio.h>

FILE *readme;
%}

%%			/*----- Sección de Reglas ----------------*/

\#|\@|\&|"/code"|"/codeblock"											{BEGIN FORMAT;}
[^\#|\@|\&|"/code"|"/codeblock"]+									{fwrite(yytext,(yyleng*sizeof(char)),1,readme);}

<FORMAT>[1-6][^\#]+\#[1-6]$        								{(FUNCION CORRESPONDIENTE) BEGIN INITIAL;}	//titulos
<FORMAT>[^\@]+\@ 																	{(FUNCION CORRESPONDIENTE) BEGIN INITIAL}//negrita
<FORMAT>[^\&]+\&																	{(FUNCION CORRESPONDIENTE) BEGIN INITIAL}//cursiva
<FORMAT>[^"/code"]"/code"													{(FUNCION CORRESPONDIENTE) BEGIN INITIAL}//codigo en linea
<FORMAT>\n+[^"/codeblock"]\n+"/codeblock"					{(FUNCION CORRESPONDIENTE) BEGIN INITIAL}//codigo en bloque


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

	readme = fopen("README.md");
	else yyin = stdin;

	yylex();

	return 0;
}

void titulo(int alm){
	readme
}
