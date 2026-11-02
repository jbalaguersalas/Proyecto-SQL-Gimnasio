

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

1. Un monitor da N clases, Una clase la da 1 monitor, Relacion: 1:N

2. La clave ajena va en la tabla clases porque es el lado del muchos.Se llamaria monitor_id.

3. id | nombre | clase_id|
| 1  | Carla  | 1, 4, 7 |,, Falla porque Carla da varias clases y en una celda solo cabe un valor.

4. El valor debe ser not null por que tiene que  estar un monitor dirigiendo la clase, entonces rellenamos con el valor not null para que no quede vacio.

5. Primero hay que crear la tabla monitores, porque clases tiene la clave ajena que apunta a ella y no se puede apuntar a una tabla que no existe.



<!--Ejercicio A4
1. ¿Qué pasaría si quitásemos UNIQUE de socio_id? Explícalo con un ejemplo de datos.
2. Hay dos columnas UNIQUE en tarjetas. ¿Qué evita cada una?
3. Inventa otra relación 1:1 de la vida real (fuera del gimnasio) y di en qué tabla pondrías la clave ajena.
-->

1. Si quitásemos el UNIQUE de socio_id, un mismo socio podría tener varias tarjetas. Por ejemplo, Ana (socio 1) tendría dos y eso daria a confusión.

2.Cada una impide una cosa,en este caso tenemos codigo y socio_id, código evita que dos tarjetas tengan el mismo código y socio_id evita que dos socios tenga más de una tarjeta.

3.Usuario-Perfil: un usuario tiene un perfil y un perfil es de un usuario: 1:1
La clave ajena va en perfiles, porque el perfil no puede existir sin el usuario.



<!--Ejercicio A5 — Monitores y especialidades
1. Haz las dos preguntas y escribe el tipo de relación.
2. ¿Qué tablas necesitas? Ponles nombre.
3. Escribe las columnas de cada tabla y marca cuál es PK, cuál UNIQUE y cuál FK.
4. ¿Qué evita el UNIQUE de la tabla intermedia?
5. ¿Qué tienen en común reservas y tu tabla intermedia? ¿En qué se diferencian?
-->

1. Un monitor tiene muchas especialidades y una especialidad la tienen muchos monitores → N:M


2. Necesito 3 tablas: monitores, especialidades y la tabla intermedia monitor_especialidades.



3. 
- |monitores|: `id` (PK), `dni` (UNIQUE), `nombre`, `email` (UNIQUE).
- |especialidades|: `id` (PK), `nombre` (UNIQUE).
- |monitor_especialidades|: `id` (PK), `monitor_id` (FK), `especialidad_id` (FK), `UNIQUE   (monitor_id, especialidad_id)`. 

4. El `UNIQUE` en la tabla intermedia sirve para que no metamos duplicados tontos, evita que le asignemos a Carla la especialidad de Yoga dos veces en los datos.

5. Las dos sirven para conectar dos cosas que tienen una relación de muchos a muchos usando claves ajenas. La diferencia es que `reservas` guarda una fecha (`fecha_reserva`) porque ese dato importa para la reserva, y la de `monitor_especialidades` en cambio solo une al profe con su especialidad sin más datos.



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
Preguntas:¿Un pais cuantas ciudades tiene?(muchas),¿Una ciudad cuántos paises tiene?(uno)
Relación: 1:N
Clave ajena: En la tabala ciudad(pais_id)

2.
Preguntas:¿Una persona cuantos pasaportes?(uno),¿Un pasaporte cuántas personas tiene?(una)
Relación: 1:1
Clave ajena: En la tabla pasaporte (persona_id)

3.
Preguntas:¿Un alumno cuantas asignaturas tiene?(muchas)¿Una asignatura cuantos alumnos tiene?(muchos)
Relación: N:M
Clave ajena: Se crea una tabla intermedia ejemplo:(matriculas)


4.
Preguntas:¿Un cliente cuantos pedidos hace?(muchos), ¿Un pedido cuantos clientes tiene?(uno)
Relación: 1:N
Clave ajena: En la tabla pedido (cliente_id)


5.

Preguntas:¿Una película cuántos actores tiene?(muchos)¿Un actor cuantas peliculas hace?(Muchas)
Relación: N:M
Clave ajena: Se crea una tabla intermedia (reparto).En ella se guarda el nombre del personaje.

6.

Preguntas:¿Un autor cuantos libros tiene?(muchos)¿Un libro cuantos autores tiene?
Relación:Depende de si se hace coauditoria entonces, si lo escribe un solo autor es 1:N si son varios autores con coauditoria sera N:M
Clave ajena: Necesita una tabla intermedia.

7.
Preguntas:¿Un usuario cuantos pedidos hace?(muchos)¿Un pedido cuantos usuarios tiene?(uno)
Relación:1:N
Clave ajena: En la tabla pedido (user_id)


8.
Preguntas:¿Un pedido cuantos productos tiene?(muchos)¿Un productos en cuantos pedidos aparece?(muchos)
Relación: N:M
Clave ajena: Se crea tabla intermedia  (detalle_pedido),En ella guardamos los datos o el precio de los productos del pedido.


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


