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

CREATE TABLE tipo_servico(
id_tipo_servico INTEGER AUTO_INCREMENT,
nome_tipo_servico VARCHAR(100) NOT NULL,
PRIMARY KEY (id_tipo_servico)
);

CREATE TABLE servicos_prefeitura(
id_servicos INTEGER AUTO_INCREMENT,
id_tipo_servico INTEGER NOT NULL,
nome_servicos VARCHAR(100) NOT NULL,
PRIMARY KEY (id_servicos),
FOREIGN KEY (id_tipo_servico) REFERENCES tipo_servico(id_tipo_servico)
);


CREATE TABLE agendamento(
id_agendamento INTEGER AUTO_INCREMENT,
id_usuario INTEGER,
id_servicos INTEGER,
dia DATE NOT NULL,
horas TIME NOT NULL,
protocolo VARCHAR(10) NOT NULL UNIQUE,
PRIMARY KEY (id_agendamento),
FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
FOREIGN KEY (id_servicos) REFERENCES servicos_prefeitura(id_servicos)
);

CREATE TABLE tipo_ouvidoria(
id_tipo_ouvidoria INTEGER AUTO_INCREMENT,
nome_tipo_ouvidoria VARCHAR(100) NOT NULL,
PRIMARY KEY (id_tipo_ouvidoria)
);

CREATE TABLE ouvidoria(
id_ouvidoria INTEGER AUTO_INCREMENT,
id_tipo_ouvidoria INTEGER NOT NULL,
nome_ouvidoria VARCHAR(100) NOT NULL,
PRIMARY KEY(id_ouvidoria),
FOREIGN KEY (id_tipo_ouvidoria) REFERENCES tipo_ouvidoria(id_tipo_ouvidoria)
);

CREATE TABLE registrar_ouvidoria(
id_registrar INTEGER AUTO_INCREMENT,
id_ouvidoria INTEGER,
id_endereco INTEGER,
dia DATE NOT NULL,
comentarios VARCHAR(255) NOT NULL,
PRIMARY KEY (id_registrar),
FOREIGN KEY (id_ouvidoria) REFERENCES ouvidoria(id_ouvidoria),
FOREIGN KEY (id_endereco) REFERENCES endereco(id_endereco)
);


INSERT INTO tipo_servico (nome_tipo_servico) VALUES
('Protocolo Geral'),
('Cadastro Único'),
('Tributação/IPTU'),
('Alvarás e Licenças'),
('Ouvidoria Cidadão'),
('Saúde / SUS Municipal');

INSERT INTO servicos_prefeitura (id_tipo_servico, nome_servicos) VALUES
-- Protocolo Geral
(1, 'Emissão de Carteira de Identidade (RG)'),
(1, 'Emissão de CPF'),
(1, 'Emissão de Certidão de Nascimento'),
(1, 'Agendamento de Vacinação'),
(1, 'Denúncia ou Reclamação de Serviços Públicos'),
(1, 'Solicitação de Atendimento Social'),

-- Cadastro Único
(2, 'Atendimento para Cadastro no Bolsa Família'),
(2, 'Inscrição em Programas Sociais'),
(2, 'Cadastro de Microempreendedor Individual (MEI)'),

-- Tributação/IPTU
(3, 'Atendimento para IPTU e Tributos Municipais'),

-- Alvarás e Licenças
(4, 'Solicitação de Alvará de Funcionamento'),
(4, 'Renovação de Alvará de Funcionamento'),
(4, 'Licenciamento Ambiental'),
(4, 'Autorização para Eventos Públicos'),

-- Ouvidoria Cidadão
(5, 'Denúncia ou Reclamação de Serviços Públicos'),
(5, 'Solicitação de Reparo em Vias Públicas'),
(5, 'Solicitação de Iluminação Pública'),
(5, 'Solicitação de Limpeza Urbana'),
(5, 'Solicitação de Transporte Escolar'),

-- Saúde / SUS Municipal
(6, 'Agendamento de Vacinação');


INSERT INTO tipo_ouvidoria(nome_tipo_ouvidoria) VALUES
('Reclamação'),
('Denúncia'),
('Sugestão'),
('Elogio'),
('Informação');

INSERT INTO ouvidoria (id_tipo_ouvidoria, nome_ouvidoria) VALUES
 -- 1. Reclamação
(1,'Reclamação sobre Atendimento'),
(1, 'Reclamação sobre Infraestrutura'),

-- 2. Denúncia
(2, 'Denúncia de Irregularidades'),
(2, 'Denúncia Ambiental'),

-- 3. Sugestão
(3, 'Solicitação de Melhorias'),
(3, 'Proposta de Projeto'),
(3, 'Solicitação de Serviços'),
(3, 'Pedido de Transparência'),

-- 4. Elogio
(4, 'Agradecimento'),
(4, 'Elogio'),

-- 5. Informação
(5, 'Pedido de Informação'),
(5, 'Ouvidoria Geral');
