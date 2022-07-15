-- --------  << Trabalho final tema 2 >>  ----------
--
--         SCRIPT DE CONTROLE DE ACESSO
--
-- Data Criacao ...........: 27/04/2022
-- Autor(es) ..............: Guilherme Souza, Gustave Persijn, Julia Farias, Leonardo Miranda, Gabriel Avelino, Hugo Moura, Ítalo Serra, Igor Lima, João Brito, Lorrany Souza, Davi Oliveira, Deivid Carvalho, Douglas Monteles, Lorrayne Cardozo
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: TF_Tema2DaviOliveira
--
-- Ultimas Alteracoes
--   02/05/2022 => Foi designado o privilégio total de administrador para o user ADM_DO_BANCO
--              => Foram dados ao user GESTOR os privilégios insert, delete, update e select na tabela MONITORAMENTO
--              => Refatorar para usar ROLEs
--   04/05/2022 => Exclusao da tabela VIAGEM
--              => Adicionar permissoes de select MONITORAMENTO e PONTODECONTROLE para a role PAINEL
--
-- PROJETO => 01 Base de Dados
--         => 08 Tabelas
--         => 05 Usuarios
-- ---------------------------------------

USE TF_Tema2DaviOliveira;

CREATE ROLE IF NOT EXISTS 'ADM_DO_BANCO';
CREATE ROLE IF NOT EXISTS 'GESTOR';
CREATE ROLE IF NOT EXISTS 'ANALISTA';
CREATE ROLE IF NOT EXISTS 'CHECKPOINT';
CREATE ROLE IF NOT EXISTS 'PAINEL';

GRANT ALL ON * TO 'ADM_DO_BANCO';

GRANT SELECT ON * to 'GESTOR';
GRANT INSERT, UPDATE, DELETE ON LINHA to 'GESTOR';
GRANT INSERT, UPDATE, DELETE ON passa to 'GESTOR';
GRANT INSERT, UPDATE, DELETE ON PARADA to 'GESTOR';
GRANT INSERT, UPDATE, DELETE ON PONTODECONTROLE to 'GESTOR';
GRANT INSERT, UPDATE, DELETE ON LOCALIZACAOGEOGRAFICA to 'GESTOR';
GRANT INSERT, UPDATE, DELETE ON VEICULO to 'GESTOR';
GRANT INSERT, UPDATE, DELETE ON EMPRESA to 'GESTOR';
GRANT INSERT (descricaoMotivo), UPDATE (descricaoMotivo) ON MONITORAMENTO TO 'GESTOR';

GRANT SELECT ON * TO 'ANALISTA';

GRANT INSERT ON MONITORAMENTO TO 'CHECKPOINT';

GRANT SELECT ON LINHA TO 'PAINEL';
GRANT SELECT ON passa TO 'PAINEL';
GRANT SELECT ON PARADA TO 'PAINEL';
GRANT SELECT ON LOCALIZACAOGEOGRAFICA TO 'PAINEL';
GRANT SELECT ON MONITORAMENTO TO 'PAINEL';
GRANT SELECT ON PONTODECONTROLE TO 'PAINEL';

CREATE USER 'julia'
IDENTIFIED BY 'senha_admin123';
GRANT 'ADM_DO_BANCO' TO 'julia';

CREATE USER 'gustave'
IDENTIFIED BY 'senha_gestor123';
GRANT 'GESTOR' TO 'gustave';

CREATE USER 'leonardo'
IDENTIFIED BY 'senha_analista123';
GRANT 'ANALISTA' TO 'leonardo';

CREATE USER 'ponto de controle 1'
IDENTIFIED BY 'senha_check1';
GRANT 'CHECKPOINT' TO 'ponto de controle 1';

CREATE USER 'ponto de controle 2'
IDENTIFIED BY 'senha_check2';
GRANT 'CHECKPOINT' TO 'ponto de controle 2';

CREATE USER 'ponto de controle 3'
IDENTIFIED BY 'senha_check3';
GRANT 'CHECKPOINT' TO 'ponto de controle 3';

CREATE USER 'painel de informacoes 1'
IDENTIFIED BY 'senha_painel1';
GRANT 'PAINEL' TO 'painel de informacoes 1';

CREATE USER 'painel de informacoes 2'
IDENTIFIED BY 'senha_painel2';
GRANT 'PAINEL' TO 'painel de informacoes 2';

FLUSH PRIVILEGES;

