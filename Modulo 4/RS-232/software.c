/* COMO COMPILAR 
    - gcc software.c rs232.c -Wall -Wextra -o2 -o a
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
  int n, cont = 1, cont_turnero = 1,
      cport_nr = 1,        /* /dev/ttyS0 (COM1 on windows) */
      bdrate = 19200;       /* 9600 baud */

  unsigned char buf[4096];

  char mode[]={'8','E','1',0}, 
       ans[10]; ans[2] = 0;

  if (RS232_OpenComport(cport_nr, bdrate, mode)) {
    printf("No se pudo abrir el puerto.\n");
    return(0);
  }

  while(1) {
    n = RS232_PollComport(cport_nr, buf, 4095);

    if(n) {
      if (n > 1) continue;
      buf[n] = 0;   /* always put a "null" at the end of a string! */

      if (buf[0] == '1' || buf[0] == '2') {
        if (cont < cont_turnero) {
          ans[0] = (cont / 10) + '0';
          ans[1] = (cont % 10) + '0';
          RS232_cputs(cport_nr, ans);
    
          printf("El siguiente turno es el %02d en el modulo %s\n", cont++, (char *)buf);
          cont %= 100;
        } else {
          printf("No hay turnos asignados\n");
        }
      } else {
        printf("Su turno asignado es el %02i\n", cont_turnero++);
      }
    }

    #ifdef _WIN32
        Sleep(100);
    #else
        usleep(100000);  /* sleep for 100 milliSeconds */
    #endif

  }

  return(0);
}