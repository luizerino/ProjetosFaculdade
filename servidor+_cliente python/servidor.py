# importação da biblioteca socket para efetuar a conexão e a threading para fazer linhas de execução paralela para atualizar as mensagens.
import socket
import threading

#definindo a classe servidor
class Server:
	# definindo a inicialização da classe, que ira ligar o servidor
    def __init__(self):
        self.start_server()
	
	# aqui definiremos com quem essa conexão irá conversar
    def start_server(self):
        self.s = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
        
		# aqui pegaremos o ip do onde o servidor está hospedado e pediremos para o usuário digitar uma porta desejada para a conversa
        host = socket.gethostbyname(socket.gethostname())
        port = int(input('Enter port to run the server on --> '))
		
		# um arrey que irá guardar o número de clientes que estão ligados ao server
        self.clients = []
		
		#  bind() irá ligar o socket com o endereço e porta
        self.s.bind((host,port))
		# listen(backlog) deixa o soket em modo de "escuta", sendo capaz de criar conexões com diversos clientes
        self.s.listen(100)
		
		#irá apenas mostras a porta e o ip do host
        print('Running on host: '+str(host))
        print('Running on port: '+str(port))

		#criará uma lista com o nome dos usuários
        self.username_lookup = {}

        while True:
			# guardará as informaçãos da conexão que entrou na porta
			
			#accept() retorna o socket(é diferente do socket do server, pois nessa etapa já foi 
			#criado um novo socket para estabelecer a conexão com o servidor-cliente, sendo assim, cada cliente tem
			#seu socket cliente-servidor) 
			#com informações do endereço do cliente
            c, addr = self.s.accept()

			#guardará o nome do usuário atravéz da função recv, que irá receber a informação que foi enviada pelo cliente
			#recv é uma função que retorna a útima mensagem enviada pelo usuário 
            username = c.recv(1024).decode()
            
            print('New connection. Username: '+str(username))
            self.broadcast('New person joined the room. Username: '+username)
			
			# no dicionário username_lookup ficará mais ou menos assim: porta_do_clinte: mensagem do cliente. 
            self.username_lookup[c] = username
			
			#adiciona a porta do cliente na liste de clientes
            self.clients.append(c)
             
            threading.Thread(target=self.handle_client,args=(c,addr,)).start()

    def broadcast(self,msg):
        for connection in self.clients:
            connection.send(msg.encode())

    def handle_client(self,c,addr):
        while 1:
            try:
				#mensagem recebe a última mensagem enviada por c
                msg = c.recv(1024)
            except:
                c.shutdown(socket.SHUT_RDWR)
                self.clients.remove(c)
                
                print(str(self.username_lookup[c])+' left the room.')
                self.broadcast(str(self.username_lookup[c])+' has left the room.')

                break

            if msg.decode() != '':
                print('New message: '+str(msg.decode()))
				# manda mensagens de c para todos os clientes que não sejam c
                for connection in self.clients:
                    if connection != c:
                        connection.send(msg)

server = Server()