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

lineas = LOAD 'data.tsv' AS (line:chararray);

letra = FOREACH lineas GENERATE FLATTEN(TOKENIZE(linea)) AS letra;

agrupar = GROUP letras BY letra;

contarleetras = FOREACH agrupar GENERATE group, COUNT(letra);

cantidad = LIMIT contarletras 15;

STORE cantidad INTO 'output' USING PigStorage(',');