/*
Pregunta
===========================================================================

Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
columna 3 separados por coma. La tabla debe estar ordenada por las 
columnas 1, 2 y 3.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

lineas = LOAD 'data.tsv' AS (letra:CHARARRAY, letrasMinusculas:BAG{t:TUPLE(a:CHARARRAY)}, claves:[]);

extraercolumna = FOREACH lineas GENERATE claves;

columna = FOREACH extraercolumna GENERATE COUNT(KEYSET($0));

contar = FOREACH lineas GENERATE letra, COUNT(letrasMinusculas) as contar, COUNT(KEYSET(claves)) as clave;

ordenar = ORDER contar BY letra, contar, clave asc;

STORE ordenar INTO 'output' USING PigStorage(',');