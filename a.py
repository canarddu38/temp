from socket import *
from time import ctime

HOST = '192.168.1.80'
PORT = 8070
BUFSIZE = 1024
ADDR = (HOST,PORT)

udpSerSock = socket(AF_INET,SOCK_DGRAM)
udpSerSock.bind(ADDR)

while True:
    print("...waiting for message...")
    data,ADDR = udpSerSock.recvfrom(BUFSIZE)
    if data is None:
        break
    print("[%s]: From Address %s:%s receive data: %s" %(ctime(),ADDR[0],ADDR[1],data))
    
    send_data = input("> ")
    if send_data is not None:
        bytes = str.encode(send_data)
        udpSerSock.sendto(bytes,(HOST,PORT)) 
udpSerSock.close()
