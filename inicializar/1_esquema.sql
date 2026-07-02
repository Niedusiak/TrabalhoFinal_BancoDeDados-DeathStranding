DROP TABLE IF EXISTS Avaliacao_like;
DROP TABLE IF EXISTS Estrutura;
DROP TABLE IF EXISTS Pedido_Item;
DROP TABLE IF EXISTS Pedido;
DROP TABLE IF EXISTS Item;
DROP TABLE IF EXISTS Portador;
DROP TABLE IF EXISTS Prepper;
DROP TABLE IF EXISTS Local;
DROP TABLE IF EXISTS Caracteristica_area;

CREATE TABLE Caracteristica_area (
    id_area INT PRIMARY KEY,
    tipo_terreno VARCHAR(50) NOT NULL,
    clima VARCHAR(50) NOT NULL,
    presenca_ep BOOLEAN NOT NULL,
    nivel_timefall VARCHAR(20) NOT NULL,
    CHECK (nivel_timefall IN ('Nenhum', 'Baixo', 'Medio', 'Alto', 'Extremo'))
);

CREATE TABLE Local (
    id_local INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    tipo_instalacao VARCHAR(50) NOT NULL,
    regiao VARCHAR(50) NOT NULL,
    status_rede_quiral BOOLEAN DEFAULT FALSE,
    id_area INT NOT NULL,

    FOREIGN KEY (id_area)
        REFERENCES Caracteristica_area(id_area)
);

CREATE TABLE Prepper (
    id_prepper INT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    estrelas_conexao INT DEFAULT 0,
    id_local INT UNIQUE NOT NULL,

    CHECK (estrelas_conexao BETWEEN 0 AND 5),

    FOREIGN KEY (id_local)
        REFERENCES Local(id_local)
);

CREATE TABLE Portador (
    id_portador INT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    capacidade_max_kg DECIMAL(5,2) NOT NULL,
    total_likes INT DEFAULT 0,

    CHECK (capacidade_max_kg > 0),
    CHECK (total_likes >= 0)
);

CREATE TABLE Item (
    id_item INT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    peso_kg DECIMAL(5,2) NOT NULL,
    nivel_fragilidade VARCHAR(20) NOT NULL,

    CHECK (peso_kg > 0),
    CHECK (nivel_fragilidade IN ('Baixa','Media','Alta','Extrema'))
);

CREATE TABLE Pedido (
    id_pedido INT PRIMARY KEY,
    status_pedido VARCHAR(20) NOT NULL,
    condicao_final_carga VARCHAR(20),

    id_local_origem INT NOT NULL,
    id_local_destino INT NOT NULL,
    id_portador INT NOT NULL,
    id_prepper INT NOT NULL,

    CHECK (status_pedido IN ('Pendente','Em Transporte','Entregue','Cancelado')),

    CHECK (
        condicao_final_carga IS NULL OR
        condicao_final_carga IN ('Perfeita','Danificada','Destruida')
    ),

    FOREIGN KEY (id_local_origem)
        REFERENCES Local(id_local),

    FOREIGN KEY (id_local_destino)
        REFERENCES Local(id_local),

    FOREIGN KEY (id_portador)
        REFERENCES Portador(id_portador),

    FOREIGN KEY (id_prepper)
        REFERENCES Prepper(id_prepper)
);

CREATE TABLE Pedido_Item (
    id_pedido INT,
    id_item INT,
    quantidade INT NOT NULL,

    PRIMARY KEY (id_pedido, id_item),

    CHECK (quantidade > 0),

    FOREIGN KEY (id_pedido)
        REFERENCES Pedido(id_pedido),

    FOREIGN KEY (id_item)
        REFERENCES Item(id_item)
);

CREATE TABLE Estrutura (
    id_estrutura INT PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL,
    durabilidade_porcentual DECIMAL(5,2) NOT NULL,
    id_portador INT NOT NULL,
    id_area INT NOT NULL,

    CHECK (durabilidade_porcentual BETWEEN 0 AND 100),

    FOREIGN KEY (id_portador)
        REFERENCES Portador(id_portador),

    FOREIGN KEY (id_area)
        REFERENCES Caracteristica_area(id_area)
);

CREATE TABLE Avaliacao_like (
    id_like INT PRIMARY KEY,
    quantidade INT NOT NULL,
    motivo VARCHAR(50) NOT NULL,
    origem_like VARCHAR(50) NOT NULL,

    id_portador INT,
    id_estrutura INT,

    CHECK (quantidade >= 0),

    CHECK (
        (id_portador IS NOT NULL AND id_estrutura IS NULL)
        OR
        (id_portador IS NULL AND id_estrutura IS NOT NULL)
    ),

    FOREIGN KEY (id_portador)
        REFERENCES Portador(id_portador),

    FOREIGN KEY (id_estrutura)
        REFERENCES Estrutura(id_estrutura)
);