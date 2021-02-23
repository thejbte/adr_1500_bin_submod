# IDAC ADR 1500 INSTALL

## INSTALAR :
1) Descargar Raspberry pi imager
2) seleccionar raspbian lite 32 bits
3) grabar la sd card
4) en la raiz de la sd crear un archivo sin extension llamado "ssh" , si esta en windows lo puede hacer creando un archivo de texto y borrando el .txt
5)Inserte la sd card a la rpi. 
conectese por ssh con :
 login:pi
 password:raspberry
 hostname:raspberrypi



6) Conectar el conversor  USB-Serial RS232 al puerto usb de la RPI. ver puertos con el comando ls /dev/

7) ir a la carpeta /adr_1500_bin
8) copiar el comando chmod +x install.sh
9)
########################################################
Correr el instalador /adr_1500_bin/./install.sh 
Este copia los archivos a la raiz del usuario  y le da los permisos al sistema.
########################################################





## OPCIONAL
### MODIFICAR ARGUMENTOS DE ENTRADA:
6) Opcional ( 6-9)
Si quiere modificar el baud rate o el tty -> ir a /adr_1500_bin/idac_adr_serial.service 
    sudo nano idac_adr_serial.service
    En la linea "ExecStart" modificar ttyUSB0 por ttyUSBx y 19200 por baudrate especifico a cambiar

Si quiere modificar el tiempo de transmisión del cliente( default = 60 segundos ) ir a /adr_1500_bin/idac_adr_client.service 
    sudo nano idac_adr_client.service
    En la linea "ExecStart" modificar 60  por el tiempo que requiera. ( debe ser mayor a 5 seg).


8)se puede verificar los pid de los programas corriendo y el arbol con sudo systemctl status idac_adr_client.service  y sudo systemctl status idac_adr_serial.service ,
donde los PID deben estar fijos cada vez que se lanza el comando a menos que  un proceso no se haya levantado.

9)se puede verificar en ~/adr_1500_bin deben estar todos los ejecutables.



email:thejbte@gmail.com
