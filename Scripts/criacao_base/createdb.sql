DROP SCHEMA IF EXISTS db_idoso CASCADE;

CREATE SCHEMA db_idoso AUTHORIZATION postgres;


CREATE SCHEMA db_idoso AUTHORIZATION postgres;

-- DROP SEQUENCE db_idoso.tb_botao_botao_id_seq;

CREATE SEQUENCE db_idoso.tb_botao_botao_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE db_idoso.tb_casa_casa_id_seq;

CREATE SEQUENCE db_idoso.tb_casa_casa_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE db_idoso.tb_cuidador_cuidador_id_seq;

CREATE SEQUENCE db_idoso.tb_cuidador_cuidador_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE db_idoso.tb_evento_responsavel_idoso_id_mensagem_seq;

CREATE SEQUENCE db_idoso.tb_evento_responsavel_idoso_id_mensagem_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE db_idoso.tb_eventos_botao_casa_botao_evento_id_seq;

CREATE SEQUENCE db_idoso.tb_eventos_botao_casa_botao_evento_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE db_idoso.tb_eventos_sensor_casa_evento_id_seq;

CREATE SEQUENCE db_idoso.tb_eventos_sensor_casa_evento_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE db_idoso.tb_pessoas_pessoa_id_seq;

CREATE SEQUENCE db_idoso.tb_pessoas_pessoa_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE db_idoso.tb_sensor_sensor_id_seq;

CREATE SEQUENCE db_idoso.tb_sensor_sensor_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;-- db_idoso.tb_casa definition

-- Drop table

-- DROP TABLE db_idoso.tb_casa;

CREATE TABLE db_idoso.tb_casa (
	casa_rua varchar(200) NOT NULL,
	casa_número int4 NOT NULL,
	casa_bairro varchar(100) NOT NULL,
	casa_cidade varchar(100) NOT NULL,
	casa_referencia varchar(300) NOT NULL,
	casa_complemento varchar(150) NOT NULL,
	casa_cep int4 NOT NULL,
	casa_id serial4 NOT NULL,
	CONSTRAINT tb_casa_pkey PRIMARY KEY (casa_id)
);


-- db_idoso.tb_tipo_pessoa definition

-- Drop table

-- DROP TABLE db_idoso.tb_tipo_pessoa;

CREATE TABLE db_idoso.tb_tipo_pessoa (
	tipo_id int4 NOT NULL,
	tipo varchar(20) NOT NULL,
	CONSTRAINT tb_tipo_pessoa_pkey PRIMARY KEY (tipo_id)
);


-- db_idoso.tb_botao definition

-- Drop table

-- DROP TABLE db_idoso.tb_botao;

CREATE TABLE db_idoso.tb_botao (
	botao_id serial4 NOT NULL,
	bota_tipo varchar(50) NOT NULL,
	casa_id int4 NOT NULL,
	CONSTRAINT tb_botao_pkey PRIMARY KEY (botao_id),
	CONSTRAINT tb_botao_casa_id_fkey FOREIGN KEY (casa_id) REFERENCES db_idoso.tb_casa(casa_id)
);


-- db_idoso.tb_cuidador definition

-- Drop table

-- DROP TABLE db_idoso.tb_cuidador;

CREATE TABLE db_idoso.tb_cuidador (
	cuidador_nome varchar(100) NOT NULL,
	cuidador_ra varchar(30) NOT NULL,
	cuidador_telefone varchar(20) NOT NULL,
	cuidador_cpf int4 NOT NULL,
	cuidador_data_nascimento date NOT NULL,
	cuidador_id serial4 NOT NULL,
	cuidador_email varchar(100) NOT NULL,
	casa_id int4 NOT NULL,
	CONSTRAINT tb_cuidador_cuidador_cpf_key UNIQUE (cuidador_cpf),
	CONSTRAINT tb_cuidador_cuidador_ra_key UNIQUE (cuidador_ra),
	CONSTRAINT tb_cuidador_cuidador_telefone_key UNIQUE (cuidador_telefone),
	CONSTRAINT tb_cuidador_pkey PRIMARY KEY (cuidador_id),
	CONSTRAINT tb_cuidador_casa_id_fkey FOREIGN KEY (casa_id) REFERENCES db_idoso.tb_casa(casa_id)
);


-- db_idoso.tb_eventos_botao_casa definition

-- Drop table

-- DROP TABLE db_idoso.tb_eventos_botao_casa;

CREATE TABLE db_idoso.tb_eventos_botao_casa (
	"data" date NOT NULL,
	hora date NOT NULL,
	botao_evento_id serial4 NOT NULL,
	botao_id int4 NOT NULL,
	casa_id int4 NOT NULL,
	CONSTRAINT tb_eventos_botao_casa_pkey PRIMARY KEY (botao_evento_id, botao_id, casa_id),
	CONSTRAINT tb_eventos_botao_casa_botao_id_fkey FOREIGN KEY (botao_id) REFERENCES db_idoso.tb_botao(botao_id),
	CONSTRAINT tb_eventos_botao_casa_casa_id_fkey FOREIGN KEY (casa_id) REFERENCES db_idoso.tb_casa(casa_id)
);


-- db_idoso.tb_pessoas definition

-- Drop table

-- DROP TABLE db_idoso.tb_pessoas;

CREATE TABLE db_idoso.tb_pessoas (
	pessoa_id serial4 NOT NULL,
	pessoa_nome varchar(250) NOT NULL,
	pessoa_cpf int4 NOT NULL,
	pessoa_telefone varchar(20) NOT NULL,
	pessoa_email varchar(250) NOT NULL,
	pessoa_dt_nascimento date NOT NULL,
	casa_id int4 NOT NULL,
	tipo_id int4 NOT NULL,
	CONSTRAINT tb_pessoas_pkey PRIMARY KEY (pessoa_id),
	CONSTRAINT tb_pessoas_casa_id_fkey FOREIGN KEY (casa_id) REFERENCES db_idoso.tb_casa(casa_id),
	CONSTRAINT tb_pessoas_tipo_id_fkey FOREIGN KEY (tipo_id) REFERENCES db_idoso.tb_tipo_pessoa(tipo_id)
);


-- db_idoso.tb_sensor definition

-- Drop table

-- DROP TABLE db_idoso.tb_sensor;

CREATE TABLE db_idoso.tb_sensor (
	sensor_tipo varchar(30) NOT NULL,
	sensor_unidade varchar(20) NOT NULL,
	sensor_id serial4 NOT NULL,
	sensor_localizacao varchar(30) NOT NULL,
	sensor_limite_superior int4 NOT NULL,
	sensor_limite_inferior int4 NOT NULL,
	casa_id int4 NOT NULL,
	CONSTRAINT tb_sensor_pkey PRIMARY KEY (sensor_id),
	CONSTRAINT tb_sensor_casa_id_fkey FOREIGN KEY (casa_id) REFERENCES db_idoso.tb_casa(casa_id)
);


-- db_idoso.tb_eventos_cuidador_idoso definition

-- Drop table

-- DROP TABLE db_idoso.tb_eventos_cuidador_idoso;

CREATE TABLE db_idoso.tb_eventos_cuidador_idoso (
	"data" date NOT NULL,
	hora date NOT NULL,
	acao varchar(50) NOT NULL,
	descrição varchar(2000) NOT NULL,
	pessoa_id int4 NOT NULL,
	CONSTRAINT tb_eventos_cuidador_idoso_pkey PRIMARY KEY (pessoa_id),
	CONSTRAINT tb_eventos_cuidador_idoso_pessoa_id_fkey FOREIGN KEY (pessoa_id) REFERENCES db_idoso.tb_pessoas(pessoa_id)
);


-- db_idoso.tb_eventos_sensor_casa definition

-- Drop table

-- DROP TABLE db_idoso.tb_eventos_sensor_casa;

CREATE TABLE db_idoso.tb_eventos_sensor_casa (
	"data" date NOT NULL,
	hora date NOT NULL,
	medida int4 NOT NULL,
	evento_id serial4 NOT NULL,
	sensor_id int4 NOT NULL,
	casa_id int4 NOT NULL,
	CONSTRAINT tb_eventos_sensor_casa_pkey PRIMARY KEY (evento_id, sensor_id, casa_id),
	CONSTRAINT tb_eventos_sensor_casa_casa_id_fkey FOREIGN KEY (casa_id) REFERENCES db_idoso.tb_casa(casa_id),
	CONSTRAINT tb_eventos_sensor_casa_sensor_id_fkey FOREIGN KEY (sensor_id) REFERENCES db_idoso.tb_sensor(sensor_id)
);


-- db_idoso.tb_pessoa_relacionamento definition

-- Drop table

-- DROP TABLE db_idoso.tb_pessoa_relacionamento;

CREATE TABLE db_idoso.tb_pessoa_relacionamento (
	pessoa_envolvida_id int4 NOT NULL,
	relacionamento_envolvido varchar(50) NOT NULL,
	pessoa_idosa_id int4 NOT NULL,
	pessoa_assinate_id int4 NOT NULL,
	CONSTRAINT tb_pessoa_relacionamento_pkey PRIMARY KEY (pessoa_envolvida_id, pessoa_idosa_id, pessoa_assinate_id),
	CONSTRAINT tb_pessoa_relacionamento_pessoa_assinate_id_fkey FOREIGN KEY (pessoa_assinate_id) REFERENCES db_idoso.tb_pessoas(pessoa_id),
	CONSTRAINT tb_pessoa_relacionamento_pessoa_idosa_id_fkey FOREIGN KEY (pessoa_idosa_id) REFERENCES db_idoso.tb_pessoas(pessoa_id)
);


-- db_idoso.tb_evento_responsavel_idoso definition

-- Drop table

-- DROP TABLE db_idoso.tb_evento_responsavel_idoso;

CREATE TABLE db_idoso.tb_evento_responsavel_idoso (
	"data" date NOT NULL,
	hora date NOT NULL,
	tipo_acionamento varchar(50) NOT NULL,
	status int4 NOT NULL,
	id_mensagem serial4 NOT NULL,
	texto_mensagem varchar(200) NOT NULL,
	pessoa_idosa_id int4 NOT NULL,
	pessoa_assinate_id int4 NOT NULL,
	pessoa_envolvida_id int4 NOT NULL,
	CONSTRAINT tb_evento_responsavel_idoso_pkey PRIMARY KEY (id_mensagem),
	CONSTRAINT tb_evento_responsavel_idoso_pessoa_idosa_id_pessoa_assinat_fkey FOREIGN KEY (pessoa_idosa_id,pessoa_assinate_id,pessoa_envolvida_id) REFERENCES db_idoso.tb_pessoa_relacionamento(pessoa_idosa_id,pessoa_assinate_id, pessoa_envolvida_id)
);
