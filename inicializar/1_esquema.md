erDiagram
    CARACTERISTICA_AREA {
        int id_area PK
        varchar tipo_terreno
        varchar clima
        boolean presenca_ep
        varchar nivel_timefall
    }

    LOCAL {
        int id_local PK
        varchar nome
        varchar tipo_instalacao
        boolean status_rede_quiral
        int id_area FK
    }

    PREPPER {
        int id_prepper PK
        varchar nome
        int estrelas_conexao
        int id_local FK
    }

    PORTADOR {
        int id_portador PK
        varchar nome
        decimal capacidade_max_kg
        int total_likes
    }

    ITEM {
        int id_item PK
        varchar nome
        varchar categoria
        decimal peso_kg
        varchar nivel_fragilidade
    }

    PEDIDO {
        int id_pedido PK
        varchar status_pedido
        varchar condicao_final_carga
        int quantidade_item
        int id_local_origem FK
        int id_local_destino FK
        int id_portador FK
        int id_item FK
    }

    ESTRUTURA {
        int id_estrutura PK
        varchar tipo
        decimal durabilidade_porcentual
        int id_portador FK
        int id_area FK
    }

    AVALIACAO_LIKE {
        int id_like PK
        int quantidade
        varchar motivo
        varchar origem_like
        int id_portador FK
    }

    CARACTERISTICA_AREA ||--o{ LOCAL : possui
    CARACTERISTICA_AREA ||--o{ ESTRUTURA : abriga

    LOCAL ||--|| PREPPER : residencia

    LOCAL ||--o{ PEDIDO : origem
    LOCAL ||--o{ PEDIDO : destino

    PORTADOR ||--o{ PEDIDO : transporta
    PORTADOR ||--o{ ESTRUTURA : constroi
    PORTADOR ||--o{ AVALIACAO_LIKE : recebe

    ITEM ||--o{ PEDIDO : compoe