-- --------  << Trabalho final tema 2 >>  ----------
--
--         SCRIPT DE INSERCAO
--
-- Data Criacao ...........: 16/04/2022
-- Autor(es) ..............: Guilherme Souza, Gustave Persijn, Julia Farias, Leonardo Miranda, Gabriel Freire, Hugo Moura, Ítalo Serra, Igor Lima, João Brito, Lorrany Souza, Davi Oliveira, Deivid Carvalho, Douglas Monteles, Lorrayne Cardozo
-- 
-- 
-- 
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: TF_Tema2DaviOliveira
--
-- Ultimas Alteracoes
--   27/04/2022 => Inclusao da tabela LOCALIZACAOGEOGRAFICA
--   02/05/2022 => Criacao da tabela EMPRESA
--              => Exclusao da tabela MOTIVODEATRASO
--              => Inclusao dos atributos dataChegada e descricaoMotivo na tabela MONITORAMENTO
--              => Ir de "pelo menos 5" para "pelo menos 7" tuplas por tabela
--   04/05/2022 => Ir de "pelo menos 7" para "pelo menos 10" tuplas por tabela
--              => Exclusao da tabela VIAGEM
--              => Inclusao do atributo precoPadrao em LINHA
--              => Exclusao do atributo idParada de PARADA
--              => Inclusao do atributo descricao em PARADA
--              => Inclusao da chave estrangeira numeroLinha em MONITORAMENTO
--
-- PROJETO => 01 Base de Dados
--         => 08 Tabelas
--         => 05 Usuarios
-- ---------------------------------------

USE TF_Tema2DaviOliveira;

INSERT INTO LINHA (numeroLinha, descricaoLinha, precoPadrao) VALUES  (101.2, "Grande Circular - W3 Sul",5.50),
                                                                     (387.1, "Taguatinga EPTG",5.50),
                                                                     (314.1, "Rodoviaria Eixao Sul/Norte",3.80),
                                                                     (110.0, "W3 Norte/Sul",5.50),
                                                                     (102.1, "W3 Sul/Norte",5.50),
                                                                     (201.2, "Rodoviaria - Terminal Gama",3.80),
                                                                     (205.1, "Gama - Terminal M Norte",5.50),
                                                                     (156.9, "Terminal Guara II - Rodoviária Plano Piloto",2.70),
                                                                     (949.1, "Setor O (VIA O2) - Arniqueiras (ADE)",5.50),
                                                                     (872.9, "Recanto das Emas (Q 800) - Taguacenter (via Boca da Mata)",2.70);



INSERT INTO EMPRESA (cnpj, nomeEmpresa) VALUES  (41677300000197, "Viacao Pioneira"),
                                                (45682135687599, "Viacao Passaro Vermelho"),
                                                (45682135687597, "Viacao Passaro Amarelo"),
                                                (45682135687596, "Viacao Passaro Marrom"),
                                                (45682135687595, "Viacao Urbi"),
                                                (17595372001000, "Viacao Passaro Verde"),
                                                (42607021000110, "Viacao Marechal"),
                                                (58861664000125, "Viacao Piracicabana"),
                                                (54816105000142, "Viacao HP-ITA (Urbi)"),
                                                (26877018000160, "Expresso São José");

INSERT INTO VEICULO (matriculaVeiculo, tarjetaIndicativa, placaVeiculo, cnpj) VALUES (123456, "Brasilia-DF", "BBC1234", 41677300000197),
                                                                                    (223455, "Brasilia-DF", "ACC2134", 45682135687599),
                                                                                    (323454, "Brasilia-DF", "AAC3334", 45682135687597),
                                                                                    (423453, "Brasilia-DF", "JGN1467", 45682135687596),
                                                                                    (523454, "Brasilia-DF", "AAA5434", 45682135687595),
                                                                                    (523455, "Brasilia-DF", "AAA5435", 17595372001000),
                                                                                    (523322, "Brasilia-DF", "AAA5433", 42607021000110),
                                                                                    (522255, "Brasilia-DF", "JFY0925", 58861664000125),
                                                                                    (523542, "Brasilia-DF", "JJM1249", 54816105000142),
                                                                                    (521521, "Brasilia-DF", "JFQ3731", 26877018000160);


INSERT INTO LOCALIZACAOGEOGRAFICA (idLocalizacaoGeografica, latitude, longitude) VALUES (NULL, -15.9909, -48.0485),
                                                                                        (NULL, -15.9677, -48.0226),
                                                                                        (NULL, -15.9599, -48.0134),
                                                                                        (NULL, -15.9546, -48.0076),
                                                                                        (NULL, -15.9422, -47.9883),
                                                                                        (NULL, -15.9118, -47.9680),
                                                                                        (NULL, -15.8250, -47.9111),
                                                                                        (NULL, -15.8128, -47.8950),
                                                                                        (NULL, -15.8029, -47.8863),
                                                                                        (NULL, -15.8801, -47.9598);


INSERT INTO PARADA (descricao, idLocalizacaoGeografica) VALUES (NULL, 3),
                                                               (NULL, 1),
                                                               (NULL, 2),
                                                               (NULL, 4),
                                                               (NULL, 5),
                                                               (NULL, 6),
                                                               (NULL, 7),
                                                               (NULL, 9),
                                                               (NULL, 8),
                                                               (NULL, 10);








INSERT INTO PONTODECONTROLE (numeroPontoDeControle, idLocalizacaoGeografica) VALUES (NULL, 1),
                                                                                    (NULL, 3),
                                                                                    (NULL, 4),
                                                                                    (NULL, 2),
                                                                                    (NULL, 6),
                                                                                    (NULL, 7),
                                                                                    (NULL, 5),
                                                                                    (NULL, 8),
                                                                                    (NULL, 9),
                                                                                    (NULL, 10);

INSERT INTO MONITORAMENTO (idMonitoramento, dataChegada, horarioChegada, numeroPontoDeControle, matriculaVeiculo, numeroLinha, descricaoMotivo) VALUES (NULL, '2022-06-08', '12:01', 1, 123456, 387.1,"Batida " ),
                                                                                                                                                       (NULL, '2022-06-10', '12:32', 1, 523455, 314.1, "Engarrafamento"),
                                                                                                                                                       (NULL, '2022-06-09', '12:37', 1, 123456, 110.0, "Carro quebrado"),
                                                                                                                                                       (NULL, '2022-06-08', '14:04', 5, 223455, 314.1, "Acidente"),
                                                                                                                                                       (NULL, '2022-06-07', '12:03', 6, 323454, 201.2, "Obra na pista"),
                                                                                                                                                       (NULL, '2022-06-09', '12:03', 6, 423453, 102.1, "Batida de carro"),
                                                                                                                                                       (NULL, '2022-06-09', '12:10', 6, 323454, 102.1, "Obra na pista"),
                                                                                                                                                       (NULL, '2022-06-07', '12:03', 6, 522255, 156.9, "Engarrafamento"),
                                                                                                                                                       (NULL, '2022-06-09', '12:03', 6, 523542, 949.1, "Batida de moto"),
                                                                                                                                                       (NULL, '2022-06-09', '12:10', 6, 521521, 872.9, "Buraco na pista");

INSERT INTO passa (idLocalizacaoGeografica, numeroLinha, horarioPrevisto, tipoDeDia) VALUES (1, 110.0, '12:00', 'Feriado'),
                                                                                            (3, 110.0, '12:15', 'Feriado'),
                                                                                            (1, 110.0, '12:30', 'SegASex'),
                                                                                            (2, 110.0, '12:45', 'SegASex'),
                                                                                            (1, 205.1, '12:00', 'SegASex'),
                                                                                            (2, 205.1, '12:45', 'SegASex'),
                                                                                            (1, 102.1, '12:00', 'Feriado'),
                                                                                            (2, 102.1, '12:10', 'Feriado'),
                                                                                            (2, 101.2, '12:00', 'Feriado'),
                                                                                            (3, 387.1, '12:00', 'Feriado'),
                                                                                            (5, 387.1, '12:12', 'Feriado'),
                                                                                            (4, 314.1, '12:00', 'Feriado');
