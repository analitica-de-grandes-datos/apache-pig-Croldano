/*
Pregunta
===========================================================================

Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
columna 3. En otras palabras, cuántos registros hay que tengan la clave 
`aaa`?

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/


lineas = LOAD 'data.tsv' AS (letra:CHARARRAY, letrasMinusculas:BAG{t:TUPLE(a:CHARARRAY)}, claves:[]);

columna = FOREACH lineas GENERATE flatten(claves);

palabras = FOREACH columna GENERATE $0 AS palabra;

agrupar = GROUP palabras BY palabra;

contarpalabra = FOREACH agrupar GENERATE group, COUNT(palabras);

STORE contarpalabra INTO 'output' USING PigStorage(',');