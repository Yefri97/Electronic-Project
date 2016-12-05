# Proyecto Laboratorio Electrónica Digital

![Imagen de un Turnero](http://www.tecnoturnos.com/photos/turnero-electronico-economico-grand.jpg)

## Descripción
**General:** En las entidades donde se requiere una atención al público, es claramente necesario la
generación de un sistema que permita proporcionarles a los clientes un mecanismo de atención
que sea cómodo y al mismo tiempo les dé seguridad de su atención. En la antigüedad el
mecanismo de atención por colas era una solución viable dado el bajo volumen de clientes, en la
actualidad para la mejora de la eficiencia de las entidades el volumen de atención por entidad es
alto, lo que ha generado que las colas sean un mecanismo obsoleto. Por otro lado, generar
comodidad al cliente mientras espera su turno de atención es algo llamativo para las entidades.
Un mecanismo que proporciona comodidad y seguridad de atención al usuario o cliente, son los
ya famosos turneros. Estos sistemas generan un número consecutivo, que es entregado al
cliente, y que es llamado en el momento en que el sistema lo indique por un indicación de un
puesto de atención.

El sistema que se solicita construir consiste en la implementación de un software que permita
recibir en un computador (servidor) que mostrará a los clientes en sala de espera la relación de
turno Vs puesto de atención. A este se conectarán los dispositivos despachadores de turnos, que
estarán implementados en tarjetas de desarrollo Nexys 2, a través de un lenguaje de descripción
de hardware para configurar la FPGA de dicha tarjeta de desarrollo.

![Imagen de la Nexys2](https://www.mikekohn.net/micro/pics/nexys2/nexys2_octal.jpeg)

El dispositivo despachador de turnos tiene las siguientes características:
  1. Se podrán conectar con el servidor a través de protocolo RS232. Los diseñadores del sistema deben establecer el protocolo de los mensajes de tal manera que el servidor reconozca de cuál dispositivo proviene el despacho del turno y le entregue a este el número de turno despachado.
  2. Tendrá un Display de 7 segmentos para mostrar al responsable del puesto de atención el número del turno asignado.
  3. Tendrá un botón para la solicitud del siguiente turno
  4. Tendrá un botón para retroceder el valor del último turno (Con el fin de poder decrementar el valor del contador del servidor en caso de ser necesario).
  5. Tendrá un switche que permitirá activar o desactivar la solicitud de turno.

**Descripción detallada del proyecto:**
- [x] **Módulo 1**:
Antirrebote o Detector de Pulso. Desarrollo de unidad de control para la detección en la pulsación de botones.
- [x] **Módulo 2**: 
Display de 7 Segmentos. Desarrollo de unidad de control para la generación de mensajes a través del arreglo de cuatro display de siete segmentos.
- [x] **Módulo 3**:
Protocolo RS232.
- [X] **Módulo 4**:
Aplicativo de referencia Turno­Puesto de atención.
- [ ] **Módulo 5**:
Unidad de control. Unidad de control que permitirá generar las señales de solicitud de turno desde el dispositivo alojado en el puesto de atención.
- [ ] **Módulo 6**: 
Paper. Generación de un documento de publicación de resultados científicos y de investigación en algún formato existente y validado por alguna revista.
