/* 
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra.
Almacene los resultados separados por comas. 

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

lineas = LOAD 'data.tsv' AS (line:CHARARRAY);

palabras = FOREACH lineas GENERATE FLATTEN(TOKENIZE(line)) AS palabra;

grouped = GROUP palabras BY palabra;

contarpalabra = FOREACH grouped GENERATE group, COUNT(palabras);

cantidad = LIMIT contarpalabra 15;

STORE cantidad INTO 'output' USING PigStorage(',');