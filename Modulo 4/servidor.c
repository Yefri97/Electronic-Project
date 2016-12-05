/* COMO COMPILAR 
    - gcc servidor.c rs232.c -Wall -Wextra -o2 -o servidor
*/
#include <stdlib.h>
#include <stdio.h>

#ifdef _WIN32
  #include <Windows.h>
#else
  #include <unistd.h>
#endif

#include "rs232.h"

int main() {
  int n, lengMensPort1, lengMensPort2,
      cport_nr,
      cport_nr1 = 0,        /* /dev/ttyS0 (COM1 on windows) */
      cport_nr2 = 1,        /* /dev/ttyS0 (COM2 on windows) */
      bdrate = 19200,       /* 9600 baud */
      cont = 0;

  unsigned char buff[4096], mensPort1[4096], mensPort2[4096];

  char mode[] = {'8','E','1',0}, 
       ans[10]; ans[4] = 0;

  if (RS232_OpenComport(cport_nr1, bdrate, mode) || RS232_OpenComport(cport_nr2, bdrate, mode)) {
    printf("No se pudo abrir el puerto.\n");
    return(0);
  }

  while(1) {
    lengMensPort1 = RS232_PollComport(cport_nr1, mensPort1, 4095);
    lengMensPort2 = RS232_PollComport(cport_nr2, mensPort2, 4095);

    if((lengMensPort1 || lengMensPort2) && !(lengMensPort1 && lengMensPort2)) {
      if (lengMensPort1) {
        cport_nr = cport_nr1;
        n = lengMensPort1;
        buff[0] = mensPort1[0];
      } else {
        cport_nr = cport_nr2;
        n = lengMensPort2;
        buff[0] = mensPort2[0];
      }

      buff[n] = 0;   /* always put a "null" at the end of a string! */

      if (buff[0] == '1') {
        if (cont < 9999) cont++;
      } else {
        if (cont > 0) cont--;
      }

      ans[0] = ((cont / 1000) % 10) + '0';
      ans[1] = ((cont / 100) % 10) + '0';
      ans[2] = ((cont / 10) % 10) + '0';
      ans[3] = ((cont / 1) % 10) + '0';
      RS232_cputs(cport_nr, ans);
  
      printf("El siguiente turno es el %04d en el modulo %d\n", cont, ((lengMensPort1)? 1 : 2));
    }

    #ifdef _WIN32
        Sleep(100);
    #else
        usleep(100000);  /* sleep for 100 milliSeconds */
    #endif

  }

  return(0);
}