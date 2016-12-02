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

##Formato

Como hemos dicho antes, hemos cambiado el formato de los títulos, de las negritas, de las cursivas y de los textos en código. Os explicamos como escribir estos elementos en las siguientes lineas:

  * Titulos

    \#<1-6> TITULO \#<1-6>

  * Negrita

    @negrita@

  * Cursiva

    \&cursiva\&

  * Código

    %code%

## Problemas

Si en algún momento en el que se utiliza no aparecen ciertas líneas, revise su fichero. Es posible que haya algún carácter especial sin cerrar o de más.

## En que se centra

Este traductor se centra *única y exclusivamente* en los títulos, las negritas, las cursivas y los textos en código, los demás apartados son iguales que en Markdown.

#3 Creadores

Este traductor lex ha sido creado por Alberto Gurrea Callejas y Jerónimo Chaves Caballero
