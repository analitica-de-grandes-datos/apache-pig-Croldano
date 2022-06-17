/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código en Pig para manipulación de fechas que genere la siguiente 
salida.

   1971-07-08,jul,07,7
   1974-05-23,may,05,5
   1973-04-22,abr,04,4
   1975-01-29,ene,01,1
   1974-07-03,jul,07,7
   1974-10-18,oct,10,10
   1970-10-05,oct,10,10
   1969-02-24,feb,02,2
   1974-10-17,oct,10,10
   1975-02-28,feb,02,2
   1969-12-07,dic,12,12
   1973-12-24,dic,12,12
   1970-08-27,ago,08,8
   1972-12-12,dic,12,12
   1970-07-01,jul,07,7
   1974-02-11,feb,02,2
   1973-04-01,abr,04,4
   1973-04-29,abr,04,4

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/


lineas = LOAD 'data.csv' USING PigStorage(',') AS (numero:int, nombre:CHARARRAY, apellido:CHARARRAY, fecha:Datetime, color:CHARARRAY, num:int);

seleccionaColumnas = FOREACH lineas GENERATE ToString(fecha, 'yyyy-MM-dd') as fecha01, ToString(fecha, 'MMM') as fecha02, 
ToString(fecha, 'MM,M') as fecha03;

Coljuntas = FOREACH seleccionaColumnas GENERATE fecha01,
(fecha02 == 'Jan'? 'ene':(fecha02 == 'Feb'? 'feb':(fecha02 == 'Mar'? 'mar':(fecha02 == 'Apr'? 'abr':
(fecha02 == 'May'? 'may':(fecha02 == 'Jun'? 'jun':(fecha02 == 'Jul'? 'jul':(fecha02 == 'Aug'? 'ago':
(fecha02 == 'Sep'? 'sep':(fecha02 == 'Oct'? 'oct':(fecha02 == 'Nov'? 'nov':
(fecha02 == 'Dec'? 'dic':'falso')))))))))))) as abreviardia,
fecha03;

STORE Coljuntas INTO 'output' USING PigStorage(',');