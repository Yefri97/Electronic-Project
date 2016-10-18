# Digital Electronics Project

## Description
**General:** In institutions where public attention is required, it is clearly necessary to the generation of a system that allows customers to provide a mechanism of attention that is comfortable and at the same time give them security of your attention. In ancient times the attention mechanism for colas was a viable solution given the low volume of customers today for improving the efficiency of institutions the volume of care entity is high, which has meant that queues are one obsolete mechanism. On the other hand, generate customer comfort while waiting his turn to care is something flashy for entities. A mechanism that provides comfort and safety of the user or customer care, are already famous turneros. These systems generate a sequential number, which is delivered to the customer, and that is called when the system directed by an indication of a position of attention.

The requested system is the implementation build a software that can receive on a computer (server) that show customers in waiting room V Sratio shift position of attention. In this shift devices dispatchers, they will be implemented on cards development **Nexys 2**, through a hardware description language to configure the **FPGA** development of said card is connected.

![Image of Nxeys2](https://www.mikekohn.net/micro/pics/nexys2/nexys2_octal.jpeg)

The dispatcher shift device has the following characteristics:
  1. You can connect to the server through **RS232 protocol**. System designers must set the protocol messages so that the server recognizes which device comes out of the office and turn it delivered to this the number of dispatched turn.
  2. It will have a 7-segment display to show the responsible service position number assigned shift.
  3. You will have a button for requesting the next shift.
  4. You will have a button to back the value of the last turn (In order to decrease the counter value of the server if necessary).
  5. It will have a switche which will enable or disable request shift.

**Detailed description:**

- [x] **Module 1**:
Pulse debouncing or detector. Development control unit for the detection pressing buttons.
- [x] **Module 2**: 
7-segment display. Development control unit for generating messages through the array of four seven-segment display.
- [x] **Module 3**:
Protocol RS232.
- [ ] **Module 4**:
Aplicativo of reference TurnoPuesto attention.
- [ ] **Module 5**:
Control Unit. Control unit to generate request signals shift from the device housed in the position of attention.
- [ ] **Module 6**: Paper. Generating a document publishing scientific research results and some existing and validated by a magazine format.
