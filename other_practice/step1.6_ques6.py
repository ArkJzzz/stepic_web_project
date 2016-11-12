# Разработать простейший TCP echo сервер.
# Требования
#	Запускается на IP адресе 0.0.0.0 и TCP порту 2222 
#	Получает сообщения длинной не более 1024 байт и отправляет обратно клиенту
#	Закрывает соединение при получении сообщения с текстом close
#	Мог работать одновременно с 10 клиентами

import socket

host_ip = '0.0.0.0' #ip хоста
tcp_port = 2222 #порт
buf_size = 1024 #размер буфера
tail = 10 #длина очереди клиентов

#Как правильно читать данные из сокета ?
def myreceive(sock, msglen):
	msg = ''
	while len(msg) < msglen:
	    chunk = sock.recv(msglen-len(msg))
	    if chunk == '':
			raise RuntimeError("broken")
	    msg = msg + chunk
	return msg	

#Как правильно записывать данные в сокет ?
def mysend(sock, msg):
	totalsent = 0
	while totalsent < len(msg):
	    sent = sock.send(msg[totalsent:])
	    if sent == 0:
			raise RuntimeError("broken")
	    totalsent = totalsent + sent

#main
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM) #создаем сокет, AF_INET - работа с сетевыми сокетами, SOCK_STREAM - работа с TCP
s.bind((host_ip, tcp_port)) #связываемся с адресом
s.listen(tail) #начинаем принимать сетевые соединения на данном адресе
while True:
	conn, addr = s.accept() #метод .accept() возвращается, когда handshake закончен. 
				#conn - сокет для работы с конкретным клиентом
				#addr - адрес клиента
	while True:
		data = myreceive(conn, buf_size) #чтение данных
		if data == "close":
			break #если пришло "close", закрываем соединение
		elif not data:
			break #если данных нет, закрываем соединение
		else:
			mysend(conn, data) #отправка данных назад
	conn.close() #закрываем соединение


	



