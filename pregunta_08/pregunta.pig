/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
columna 3 es:

  ((b,jjj), 216)

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

lineas = LOAD 'data.tsv' AS (letra:CHARARRAY, letrasMinusculas:BAG{t:TUPLE(a:CHARARRAY)}, claves:[]);

extraercolumna = FOREACH lineas GENERATE FLATTEN(letrasMinusculas) AS letra, FLATTEN(KEYSET(claves)) AS tres;

agrupar = GROUP extraercolumna by (letra, tres);

contar = FOREACH agrupar GENERATE group, COUNT(extraercolumna);

STORE contar INTO 'output' USING PigStorage(',');