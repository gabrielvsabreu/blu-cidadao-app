CREATE TABLE usuario(
id_usuario INTEGER AUTO_INCREMENT,
nome_completo VARCHAR(50),
cpf VARCHAR(14) NOT NULL,
email VARCHAR(100) NOT NULL UNIQUE,
telefone VARCHAR(20),
data_nascimento DATE,
senha VARCHAR(255) NOT NULL,
PRIMARY KEY (id_usuario)
);

CREATE TABLE endereco(
id_endereco INTEGER AUTO_INCREMENT,
id_usuario INTEGER, 
cep VARCHAR(10) NOT NULL,
rua VARCHAR(100) NOT NULL,
bairro VARCHAR(100) NOT NULL, 
numero VARCHAR(10),
complemento VARCHAR(100) NOT NULL,
cidade VARCHAR(100) NOT NULL,
estado VARCHAR(50) NOT NULL,
pais VARCHAR(100) NOT NULL,
PRIMARY KEY (id_endereco),
FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE servicos_prefeitura(
id_servicos INTEGER AUTO_INCREMENT,
nome_servicos VARCHAR(100) NOT NULL,
PRIMARY KEY (id_servicos)
);


CREATE TABLE agendamento(
id_agendamento INTEGER AUTO_INCREMENT,
id_usuario INTEGER,
id_servicos INTEGER,
dia DATE NOT NULL,
horas TIME NOT NULL,
protocolo VARCHAR(10) NOT NULL UNIQUE,
status VARCHAR(20) DEFAULT 'Ativo', 
PRIMARY KEY (id_agendamento),
FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
FOREIGN KEY (id_servicos) REFERENCES servicos_prefeitura(id_servicos)
);

CREATE TABLE ouvidoria(
id_ouvidoria INTEGER AUTO_INCREMENT,
nome_ouvidoria VARCHAR(100) NOT NULL,
PRIMARY KEY(id_ouvidoria)
);

CREATE TABLE registrar_ouvidoria(
id_registrar INTEGER AUTO_INCREMENT,
id_ouvidoria INTEGER,
id_endereco INTEGER,
dia DATE NOT NULL,
comentarios VARCHAR(255) NOT NULL,
status VARCHAR(20) DEFAULT 'Aberta',
PRIMARY KEY (id_registrar),
FOREIGN KEY (id_ouvidoria) REFERENCES ouvidoria(id_ouvidoria),
FOREIGN KEY (id_endereco) REFERENCES endereco(id_endereco)
);

