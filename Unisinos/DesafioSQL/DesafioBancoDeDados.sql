-- Tabela Publicacao
CREATE TABLE Publicacao (
    ISSN NUMERIC PRIMARY KEY,
    TituloP VARCHAR(150),
    Editor VARCHAR(100),
    URL VARCHAR(255)
);

-- Tabela Area
CREATE TABLE Area (
    AreaID NUMERIC PRIMARY KEY,
    IdentificadorA VARCHAR(100)
);

-- Tabela Artigos
CREATE TABLE Artigos (
    ArtigoID NUMERIC PRIMARY KEY,
    TituloA VARCHAR(150),
    ISSN NUMERIC,
    Ano NUMERIC,
    NumeroPaginas NUMERIC,
    fk_Area_AreaID NUMERIC,
    CONSTRAINT FK_Artigos_2 FOREIGN KEY (fk_Area_AreaID) REFERENCES Area(AreaID)
);

-- Tabela PalavraChave
CREATE TABLE PalavraChave (
    PC NUMERIC PRIMARY KEY,
    DescricaoPC VARCHAR(150)
);

-- Tabela Possui (Chave composta)
CREATE TABLE Possui (
    fk_Artigos_ArtigoID NUMERIC,
    fk_Publicacao_ISSN NUMERIC,
    PRIMARY KEY (fk_Artigos_ArtigoID, fk_Publicacao_ISSN),
    CONSTRAINT FK_Possui_1 FOREIGN KEY (fk_Artigos_ArtigoID) REFERENCES Artigos(ArtigoID),
    CONSTRAINT FK_Possui_2 FOREIGN KEY (fk_Publicacao_ISSN) REFERENCES Publicacao(ISSN)
);

-- Tabela ArtigosPC (Chave composta)
CREATE TABLE ArtigosPC (
    fk_PalavraChave_PC NUMERIC,
    fk_Artigos_ArtigoID NUMERIC,
    PRIMARY KEY (fk_PalavraChave_PC, fk_Artigos_ArtigoID),
    CONSTRAINT FK_ArtigosPC_1 FOREIGN KEY (fk_PalavraChave_PC) REFERENCES PalavraChave(PC),
    CONSTRAINT FK_ArtigosPC_2 FOREIGN KEY (fk_Artigos_ArtigoID) REFERENCES Artigos(ArtigoID)
);

-- Inserir na tabela Area para garantir que a chave primária AreaID exista
INSERT INTO Area (AreaID, IdentificadorA)
VALUES (1, 'Tecnologia em Saúde');

-- Inserção na tabela Artigos
INSERT INTO Artigos (ArtigoID, TituloA, ISSN, Ano, NumeroPaginas, fk_Area_AreaID)
VALUES (1, 'Saúde em debate: a inteligência artificial e os sistemas de informação', 25136578, 2024, 15, 1);

-- Inserir na tabela PalavraChave
INSERT INTO PalavraChave (PC, DescricaoPC)
VALUES (1, 'Inteligência Artificial');

INSERT INTO PalavraChave (PC, DescricaoPC)
VALUES (2, 'Sistemas de Informação');

INSERT INTO PalavraChave (PC, DescricaoPC)
VALUES (3, 'Tecnologia na Saúde');

-- Inserir na tabela Publicacao
INSERT INTO Publicacao (ISSN, TituloP, Editor, URL)
VALUES (25136578, 'Revista de Inteligência Artificial', 'Editora Ciência', 'https://www.editoraciencia.com/inteligenciaartificial');

INSERT INTO Publicacao (ISSN, TituloP, Editor, URL)
VALUES (98765432, 'Jornal de Tecnologia em Saúde', 'Editora SaúdeTech', 'https://www.editorasaudetech.com/jornal-saude');

-- Inserir na tabela Possui (chave composta)
-- Relacionar um artigo com uma publicação
INSERT INTO Possui (fk_Artigos_ArtigoID, fk_Publicacao_ISSN)
VALUES (1, 25136578);

INSERT INTO Possui (fk_Artigos_ArtigoID, fk_Publicacao_ISSN)
VALUES (1, 98765432);

SELECT * FROM Publicacao;

SELECT * FROM Possui;