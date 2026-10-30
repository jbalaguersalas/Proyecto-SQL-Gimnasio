

<!--Ejercicio A1
Mirando la tabla de arriba:

¿Qué columnas no se pueden repetir nunca?
¿Cuál es la clave primaria? ¿Cuáles son claves alternativas?
¿Qué columna apunta a otra tabla? ¿A cuál?
El DNI ya identifica a cada socio. ¿Por qué crees que usamos un id numérico como clave primaria en vez del DNI? Da al menos una razón.
-->


1.No se pueden repetir nunca "id", "dni" y "email". Son valores que identifican a un único socio, así que dos socios no pueden tener el mismo.

2.La clave primaria es aquella que identifica a cada fila y solo hay una de ellas en cada tabla, la primera columna es la clave primaria, y las otras alternativas que son por ejemplo el gmail o el DNI

3.La columna que apunta a otra tabla es el plan_id ya que 2 utilizan el mismo id y pueden tener el mismo plan.

4.Por que son números mucho mas faciles de entender y cortos.
Puede haber socios sin DNI, por ejemplo extranjeros. Una PK nunca puede estar vacía.



<!--Ejercicio A2
Con el enunciado del apartado 0, haz las dos preguntas para cada pareja y escribe el tipo de relación:
-->
1.planes-socios: plan tiene muchos socios y un socio tiene un plan =>1:N

2.socios- tarjetas:un socio tiene una tarjeta, una tarjeta es de un socio => 1:1

3.monitores- clases : un monitor tiene diferentes clases, una clase la da un monitor => 1:N

4.socios-clases: un socio reserva muchas clases, muchas clases tienen muchos socios => N:N

5.monitores-especialidades: un monitor tiene muchas especialidaes, una especialidad la tienen muchos monitores. => N:M



<!--Ejercicio A3 — Monitores y clases
1. Haz las dos preguntas.
2. ¿En qué tabla va la clave ajena? ¿Cómo la llamarías?
3. Dibuja (en una tabla Markdown) cómo quedaría si la pusieras en el lado equivocado y explica en una frase por qué falla.
4. ¿Debe ser NOT NULL? ¿Por qué?
5. ¿Qué tabla hay que crear primero?
-->

1.Un monitor da N clases, Una clase la da 1 monitor, Relacion: N:1

2.La clave ajena va en la tabla clases porque es el lado del muchos.Se llamaria monitor_id.

3.id | nombre | clase_id|
| 1  | Carla  | 1, 4, 7 |,, Falla porque Carla da varias clases y en una celda solo cabe un valor.

4.

5.



<!--Ejercicio A4
1. ¿Qué pasaría si quitásemos UNIQUE de socio_id? Explícalo con un ejemplo de datos.
2. Hay dos columnas UNIQUE en tarjetas. ¿Qué evita cada una?
3. Inventa otra relación 1:1 de la vida real (fuera del gimnasio) y di en qué tabla pondrías la clave ajena.
-->

1.

2.

3.



<!--Ejercicio A5 — Monitores y especialidades
1. Haz las dos preguntas y escribe el tipo de relación.
2. ¿Qué tablas necesitas? Ponles nombre.
3. Escribe las columnas de cada tabla y marca cuál es PK, cuál UNIQUE y cuál FK.
4. ¿Qué evita el UNIQUE de la tabla intermedia?
5. ¿Qué tienen en común reservas y tu tabla intermedia? ¿En qué se diferencian?
-->

1.

2.

3.

4.

5.



<!--Ejercicio A6
Para cada caso: haz las dos preguntas, escribe la relación y di en qué tabla va la clave ajena (o qué tabla intermedia crearías).
1. País – ciudad.
2. Persona – pasaporte.
3. Alumno – asignatura.
4. Cliente – pedido.
5. Película – actor. (Pista: ¿dónde guardarías el nombre del personaje?)
6. Autor – libro. (Cuidado: depende de un dato que no te he dado. ¿Cuál?)
7. Furniro: usuario – pedido (User – Order).
8. Furniro: pedido – producto (Order – Product). ¿Qué datos guardarías en la tabla intermedia?
-->

1.

2.

3.

4.

5.

6.

7.

8.



<!--Ejercicio B3
Para cada instrucción:
- Antes de ejecutarla, escribe qué crees que pasará y por qué.
- Ejecútala.
- Copia la línea del error (tradúcela) y di qué clave lo ha impedido.
-->

<!--B3.1 Un socio con un plan que no existe-->
- Predicción:
- Error:
- Clave:

<!--B3.2 Un socio con el email de Ana-->
- Predicción:
- Error:
- Clave:

<!--B3.3 Una segunda tarjeta para Ana-->
- Predicción:
- Error:
- Clave:

<!--B3.4 Ana reserva otra vez el Spinning del lunes-->
- Predicción:
- Error:
- Clave:

<!--B3.5 Una reserva para una clase que no existe-->
- Predicción:
- Error:
- Clave:

<!--B3.6 Borrar el plan Básico-->
- Predicción:
- Error:
- Clave:

<!--B3.7 Borrar el plan Mañanas-->
- Predicción:
- Resultado:

<!--B3.8 B3.6 falla y B3.7 funciona. Los dos son planes. ¿Por qué?-->




<!--Pregunta B4.11
En la consulta 6, Ana sale tres veces. ¿Es un error? ¿Por qué ocurre?
-->




<!--Ejercicio B6 (una o dos frases cada una)
1. ¿Qué diferencia hay entre una clave primaria y una clave UNIQUE?
2. ¿Por qué una clave ajena sí puede repetirse?
3. En una relación 1:N, ¿en qué lado va la clave ajena? ¿Por qué no en el otro?
4. ¿Qué convierte una relación 1:N en una 1:1?
5. ¿Por qué una relación N:M necesita una tabla intermedia?
6. ¿Por qué fecha_reserva está en reservas y no en socios ni en clases?
-->

1.

2.

3.

4.

5.

6.


