/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       birthday, 
       DATE_FORMAT(birthday, "yyyy"),
       DATE_FORMAT(birthday, "yy"),
   FROM 
       persons
   LIMIT
       5;

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

lineas = LOAD 'data.csv' USING PigStorage(',') AS (numero:int, nombre:CHARARRAY, apellido:CHARARRAY, fecha:Datetime, color:CHARARRAY, num:int);

selectcolumnas = FOREACH lineas GENERATE GetYear(fecha), ToString(fecha, 'yy');

STORE selectcolumnas INTO 'output' USING PigStorage(',');