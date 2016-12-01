# MD-Translator 
Un traductor de lenguaje a Markdown. **Este mismo README está traducido por el traductor.**

## How to use 
Lo primero de todo es compilarlo. Para ello, tenemos que ejecutar estas líneas en terminal:

```
  lex makereadme.l

  gcc lex.yy.c -o <nombre que queramos poner al programa> -lfl
```

Cuando ya tenemos el programa compilado, lo ejecutamos de la siguiente manera:

```
  <nombre del programa> <nombre del fichero a traducir>
```

## En que se centra 

Este traductor se centra *única y exclusivamente* en los títulos, las negritas, las cursivas y los textos en código, los demás apartados son iguales que en Markdown.

### Creadores 

Este traductor lex ha sido creado por Alberto Gurrea Callejas y Jerónimo Chaves Caballero
