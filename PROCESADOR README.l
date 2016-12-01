
			/*----- Sección de Declaraciones --------------*/
%{
#include <stdio.h>

			
%%			/*----- Sección de Reglas ----------------*/

\#|\@|\&|"/code"|"/codeblock"			{BEGIN FORMAT;}
[^\#|\@|\&|"/code"|"/codeblock"]+			{}

<FORMAT>[1-6][^\#]+\#[1-6]$        {(FUNCION CORRESPONDIENTE) BEGIN INITIAL;}	//titulos
<FORMAT>[^\@]+\@ 								//negrita
<FORMAT>[^\&]+\&								//cursiva
<FORMAT>[^"/code"]"/code"							//codigo en linea
<FORMAT>\n+[^"/codeblock"]\n+"/codeblock"					//codigo en bloque


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

	return 0;
}
