-- --------  << Trabalho final tema 2 >>  ----------
--
--         SCRIPT DE APAGA
--
-- Data Criacao ...........: 16/04/2022
-- Autor(es) ..............: Guilherme Souza, Gustave Persijn, Julia Farias, Leonardo Miranda, Gabriel Avelino, Hugo Moura, Ítalo Serra, Igor Lima, João Brito, Lorrany Souza, Davi Oliveira, Deivid Carvalho, Douglas Monteles, Lorrayne Cardozo
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: TF_Tema2DaviOliveira
--
-- Ultimas Alteracoes
--   27/04/2022 => Inclusao da tabela LOCALIZACAOGEOGRAFICA
--   02/05/2022 => Exclusao da tabela MOTIVODEATRASO
--              => Inclusao da tabela EMPRESA
--              => Adicionar comando para dropar o usuario CHECKPOINT
--   04/05/2022 => Exclusao da tabela VIAGEM
--              => Inclusao dos comandos "DROP ROLE"
--
-- PROJETO => 01 Base de Dados
--         => 08 Tabelas
--         => 05 Usuarios
-- ---------------------------------------

USE TF_Tema2DaviOliveira;

DROP TABLE passa;
DROP TABLE MONITORAMENTO;
DROP TABLE PONTODECONTROLE;
DROP TABLE PARADA;
DROP TABLE LOCALIZACAOGEOGRAFICA;
DROP TABLE VEICULO;
DROP TABLE EMPRESA;
DROP TABLE LINHA;

DROP USER 'julia';
DROP USER 'gustave';
DROP USER 'leonardo';
DROP USER 'ponto de controle 1';
DROP USER 'ponto de controle 2';
DROP USER 'ponto de controle 3';
DROP USER 'painel de informacoes 1';
DROP USER 'painel de informacoes 2';

DROP ROLE 'ADM_DO_BANCO';
DROP ROLE 'GESTOR';
DROP ROLE 'ANALISTA';
DROP ROLE 'CHECKPOINT';
DROP ROLE 'PAINEL';
