/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       firstname, 
       color 
   FROM 
       u
   WHERE color NOT IN ('blue','black');

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        /* >>> Escriba su respuesta a partir de este punto <<< */
lineas = LOAD 'data.csv' USING PigStorage(',') AS (numero:int, nombre:CHARARRAY, apellido:CHARARRAY, fecha:CHARARRAY, color:CHARARRAY, num:int);

selectcolor = FOREACH lineas GENERATE nombre, color;

bcolor = FILTER selectcolor BY NOT color IN ('blue','black');

STORE bcolor INTO 'output' USING PigStorage(',');