/*
Pregunta
===========================================================================

Obtenga los cinco (5) valores más pequeños de la 3ra columna.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/


lineas = LOAD 'data.tsv' AS (letra:chararray, fecha:chararray, numero:int);

columna = FOREACH lineas GENERATE numero;

datosunicos = DISTINCT columna;

contar = LIMIT datosunicos 5;

STORE contar INTO 'output' USING PigStorage(',');