# importação da biblioteca socket para efetuar a conexão e a threading para fazer linhas de execução paralela para atualizar as mensagens.
import socket
import threading

#definindo a classe cliente
class Client:
	# definindo a inicialização da classe, que ira começar efetuando uma conexão
    def __init__(self):
        self.create_connection()

	# aqui definiremos com quem essa conexão irá conversar
    def create_connection(self):
        self.s = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
      
		# aqui um pequeno while true para preencher dados importantes de ip do host e sua porta. 
        while 1:
            try:
                host = input('Enter host name --> ')
                port = int(input('Enter port --> '))
                self.s.connect((host,port))
                
                break
            except:
                print("Couldn't connect to server")
		# aqui definimos um usermane e enviamos essa informação para o servidor e os demais clientes. 
        self.username = input('Enter username --> ')
        self.s.send(self.username.encode())
        
		# aqui são criadas duas threads paralelas para ficarem executando whiles infinitos, a primeira para o handle_messages e o segundo 
		#para o input_handler.
		
        message_handler = threading.Thread(target=self.handle_messages,args=())
        message_handler.start()

        input_handler = threading.Thread(target=self.input_handler,args=())
        input_handler.start()

	# aqui são whiles trues que vão ficar constantemente enviando e recebendo mensagens. 
    def handle_messages(self):
        while 1:
            print(self.s.recv(1204).decode())

    def input_handler(self):
        while 1:
            self.s.send((self.username+' - '+input()).encode())

# iniciação da instância da classe 
client = Client()