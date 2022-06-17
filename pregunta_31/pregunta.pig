/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Cuente la cantidad de personas nacidas por año.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

lineas = LOAD 'data.csv' USING PigStorage(',') AS (numero:int, nombre:CHARARRAY, apellido:CHARARRAY, fecha:Datetime, color:CHARARRAY, num:int);

palabras = FOREACH lineas GENERATE GetYear(fecha) AS palabra;

agrupar = GROUP palabras BY palabra;

contarpalabra = FOREACH agrupar GENERATE group, COUNT(palabras);

STORE contarpalabra INTO 'output' USING PigStorage(',');