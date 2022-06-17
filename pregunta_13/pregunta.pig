/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta en SQL.

   SELECT
       color
   FROM 
       u 
   WHERE 
       color 
   LIKE 'b%';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        /* >>> Escriba su respuesta a partir de este punto <<< */
*/

lines = LOAD 'data.csv' USING PigStorage(',') AS (id:int, nombre:chararray, apellido:chararray, fecha:chararray, color:chararray);

selectcolor = FOREACH lines GENERATE nombre, color;

bcolor= FILTER selectcolor BY ($1 matches '.*blue.*') OR ($0 matches '.*k.*');

STORE bcolor INTO 'output' USING PigStorage (',');