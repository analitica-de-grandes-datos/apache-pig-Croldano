/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
aparece cada letra minúscula en la columna 2.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/



lineas = LOAD 'data.tsv' AS (letra:CHARARRAY, letrasMinusculas:BAG{t:TUPLE(a:CHARARRAY)}, claves:CHARARRAY);

columna = FOREACH lineas GENERATE letrasMinusculas;

palabras = FOREACH columna GENERATE FLATTEN(letrasMinusculas) AS palabra;

agrupar = GROUP palabras BY palabra;

contarpalabra = FOREACH agrupar GENERATE group, COUNT(palabras);

STORE contarpalabra INTO 'output' USING PigStorage(',');