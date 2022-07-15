-- --------  << Trabalho final tema 2 >>  ----------
--
--         SCRIPT DE CRIACAO
--
-- Data Criacao ...........: 16/04/2022
-- Autor(es) ..............: Guilherme Souza, Gustave Persijn, Julia Farias, Leonardo Miranda, Gabriel Avelino, Hugo Moura, Ítalo Serra, Igor Lima, João Brito, Lorrany Souza, Davi Oliveira, Deivid Carvalho, Douglas Monteles, Lorrayne Cardozo
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: TF_Tema2DaviOliveira
--
-- Ultimas Alteracoes
--   27/04/2022 => Inclusao da tabela LOCALIZACAOGEOGRAFICA
--   02/05/2022 => Adicionar chaves unique
--              => Inclusao da tabela EMPRESA e da FK cnpj na tabela VEICULO
--              => Adicionar atributo dataChegada na tabela MONITORAMENTO
--              => Exclusao da tabela MOTIVODEATRASO, e adicionar atributo opcional descricaoMotivo na tabela MONITORAMENTO
--   04/05/2022 => Exclusao da tabela VIAGEM
--              => Inclusao do atributo precoPadrao em LINHA
--              => Exclusao do atributo idParada de PARADA
--              => Inclusao do atributo descricao em PARADA
--              => Inclusao da chave estrangeira numeroLinha em MONITORAMENTO
--              => Alteracao do tipo da chave numeroLinha de DECIMAL(5, 2) para DECIMAL(6, 3)
--
-- PROJETO => 01 Base de Dados
--         => 08 Tabelas
--         => 05 Usuarios
-- ---------------------------------------

CREATE DATABASE IF NOT EXISTS TF_Tema2DaviOliveira;
USE TF_Tema2DaviOliveira;

CREATE TABLE LINHA (
    numeroLinha DECIMAL(6, 3) NOT NULL,
    descricaoLinha VARCHAR(180) NOT NULL,
    precoPadrao DECIMAL(5, 2) NOT NULL,
    CONSTRAINT LINHA_PK PRIMARY KEY (numeroLinha)
) ENGINE = InnoDB;

CREATE TABLE EMPRESA (
    cnpj BIGINT NOT NULL,
    nomeEmpresa VARCHAR(30) NOT NULL,
    CONSTRAINT EMPRESA_PK PRIMARY KEY (cnpj)
) ENGINE = InnoDB;

CREATE TABLE VEICULO (
    matriculaVeiculo INT NOT NULL,
    tarjetaIndicativa VARCHAR(30) NOT NULL,
    placaVeiculo CHAR(7) NOT NULL,
    cnpj BIGINT NOT NULL,
    CONSTRAINT VEICULO_PK PRIMARY KEY (matriculaVeiculo),
    CONSTRAINT VEICULO_EMPRESA_FK FOREIGN KEY (cnpj) REFERENCES EMPRESA (cnpj) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT VEICULO_UK UNIQUE KEY (tarjetaIndicativa, placaVeiculo)
) ENGINE = InnoDB;

CREATE TABLE LOCALIZACAOGEOGRAFICA (
    idLocalizacaoGeografica INT NOT NULL AUTO_INCREMENT,
    latitude DECIMAL(7, 5) NOT NULL,
    longitude DECIMAL(7, 5) NOT NULL,
    CONSTRAINT LOCALIZACAOGEOGRAFICA_PK PRIMARY KEY (idLocalizacaoGeografica)
) ENGINE = InnoDB;

CREATE TABLE PARADA (
    idLocalizacaoGeografica INT NOT NULL,
    descricao VARCHAR(50),
    CONSTRAINT PARADA_LOCALIZACAOGEOGRAFICA_FK FOREIGN KEY (idLocalizacaoGeografica) REFERENCES LOCALIZACAOGEOGRAFICA (idLocalizacaoGeografica) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB;

CREATE TABLE PONTODECONTROLE (
    numeroPontoDeControle INT NOT NULL AUTO_INCREMENT,
    idLocalizacaoGeografica INT NOT NULL,
    CONSTRAINT PONTODECONTROLE_PK PRIMARY KEY (numeroPontoDeControle),
    CONSTRAINT PONTODECONTROLE_LOCALIZACAOGEOGRAFICA_FK FOREIGN KEY (idLocalizacaoGeografica) REFERENCES LOCALIZACAOGEOGRAFICA (idLocalizacaoGeografica) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB;

CREATE TABLE MONITORAMENTO (
    idMonitoramento BIGINT NOT NULL AUTO_INCREMENT,
    dataChegada DATE NOT NULL,
    horarioChegada TIME NOT NULL,
    numeroPontoDeControle INT NOT NULL,
    matriculaVeiculo INT NOT NULL,
    numeroLinha DECIMAL(6,3) NOT NULL,
    descricaoMotivo VARCHAR(180),
    CONSTRAINT MONITORAMENTO_PK PRIMARY KEY (idMonitoramento),
    CONSTRAINT MONITORAMENTO_PONTODECONTROLE_FK FOREIGN KEY (numeroPontoDeControle) REFERENCES PONTODECONTROLE (numeroPontoDeControle) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT MONITORAMENTO_VEICULO_FK FOREIGN KEY (matriculaVeiculo) REFERENCES VEICULO (matriculaVeiculo) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT MONITORAMENTO_LINHA_FK FOREIGN KEY (numeroLinha) REFERENCES LINHA (numeroLinha) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT MONITORAMENTO_UK UNIQUE KEY (
        dataChegada,
        horarioChegada,
        numeroPontoDeControle,
        matriculaVeiculo,
        numeroLinha
    )
) ENGINE = InnoDB;

CREATE TABLE passa (
    idLocalizacaoGeografica INT NOT NULL,
    numeroLinha DECIMAL(6, 3) NOT NULL,
    horarioPrevisto TIME NOT NULL,
    tipoDeDia VARCHAR(15) NOT NULL,
    
    CONSTRAINT passa_LOCALIZACAOGEOGRAFICA_FK FOREIGN KEY (idLocalizacaoGeografica) REFERENCES LOCALIZACAOGEOGRAFICA (idLocalizacaoGeografica) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT passa_LINHA_FK FOREIGN KEY (numeroLinha) REFERENCES LINHA (numeroLinha) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT passa_UK UNIQUE KEY (
        idLocalizacaoGeografica,
        numeroLinha,
        horarioPrevisto,
        tipoDeDia
    )
) ENGINE = InnoDB;
