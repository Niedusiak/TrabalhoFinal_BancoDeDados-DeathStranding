CREATE TABLE Caracteristica_area (
    id_area INT PRIMARY KEY,
    tipo_terreno VARCHAR(50),
    clima VARCHAR(50),
    presenca_ep BOOLEAN,
    nivel_timefall VARCHAR(50)
);

CREATE TABLE Local (
    id_local INT PRIMARY KEY,
    nome VARCHAR(100),
    tipo_instalacao VARCHAR(50),
    regiao VARCHAR(50),
    status_rede_quiral BOOLEAN,
    id_area INT,
    FOREIGN KEY (id_area) REFERENCES Caracteristica_area(id_area)
);

CREATE TABLE Prepper (
    id_prepper INT PRIMARY KEY,
    nome VARCHAR(50),
    estrelas_conexao INT CHECK (estrelas_conexao BETWEEN 0 AND 5),
    id_local INT UNIQUE,
    FOREIGN KEY (id_local) REFERENCES Local(id_local)
);

CREATE TABLE Portador (
    id_portador INT PRIMARY KEY,
    nome VARCHAR(50),
    capacidade_max_kg DECIMAL(5,2) CHECK (capacidade_max_kg > 0),
    total_likes INT CHECK (total_likes >= 0)
);

CREATE TABLE Item (
    id_item INT PRIMARY KEY,
    nome VARCHAR(50),
    categoria VARCHAR(50),
    peso_kg DECIMAL(5,2) CHECK (peso_kg > 0),
    nivel_fragilidade VARCHAR(50)
);

CREATE TABLE Pedido (
    id_pedido INT PRIMARY KEY,
    status_pedido VARCHAR(50) CHECK (status_pedido IN ('Pendente','Em Transporte','Entregue','Cancelado')),
    condicao_final_carga VARCHAR(50) CHECK (condicao_final_carga IN ('Perfeita','Danificada','Destruida')),
    id_local_origem INT,
    id_local_destino INT,
    id_portador INT,
    FOREIGN KEY (id_local_origem) REFERENCES Local(id_local),
    FOREIGN KEY (id_local_destino) REFERENCES Local(id_local),
    FOREIGN KEY (id_portador) REFERENCES Portador(id_portador)
);

CREATE TABLE Pedido_Item (
    id_pedido INT,
    id_item INT,
    quantidade INT CHECK (quantidade > 0),
    PRIMARY KEY (id_pedido, id_item),
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido),
    FOREIGN KEY (id_item) REFERENCES Item(id_item)
);

CREATE TABLE Estrutura (
    id_estrutura INT PRIMARY KEY,
    tipo VARCHAR(50),
    durabilidade_porcentual DECIMAL(5,2) CHECK (durabilidade_porcentual BETWEEN 0 AND 100),
    id_portador INT,
    id_area INT,
    FOREIGN KEY (id_portador) REFERENCES Portador(id_portador),
    FOREIGN KEY (id_area) REFERENCES Caracteristica_area(id_area)
);

CREATE TABLE Avaliacao_like (
    id_like INT PRIMARY KEY,
    quantidade INT CHECK (quantidade >= 0),
    motivo VARCHAR(50),
    origem_like VARCHAR(50),
    id_portador INT,
    FOREIGN KEY (id_portador) REFERENCES Portador(id_portador)
);