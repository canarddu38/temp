from socket import *
from time import ctime

HOST = '192.168.1.80'
PORT = 8070
BUFSIZE = 1024
ADDR = (HOST,PORT)

udpCliSock = socket(AF_INET,SOCK_DGRAM)

while True:
    sendData = input("> ")
    if sendData is None:
        break
    bytes = str.encode(sendData)
    udpCliSock.sendto(bytes,(HOST,PORT)) 
    
    print("...waiting for response...")
    recv_data,ADDR = udpCliSock.recvfrom(BUFSIZE)
    if recv_data is not None:
       print("[%s]: receiving data from server %s:%s  :%s" %(ctime(),ADDR[0],ADDR[1],recv_data))
    
udpCliSock.close()
