Trabalho Final — Banco de Dados I

Integrantes

|     Nome         |     RGA      |
|------------------|--------------|
| Mateus Niedusiak | 202522901010 | 
| Gustavo Torres   | ___________  |
| Matheus Rossa    | 202321901032 |

Descrição do Problema

1. Contexto do Problema (Death Stranding)

O sistema modela a rede logística do universo de Death Stranding, um cenário pós-apocalíptico onde a civilização humana foi fragmentada após um evento catastrófico que deu origem a eventos paranormais, conectando o mundo dos mortos ao mundo dos vivos. A humanidade foi obrigada a se isolar em abrigos e instalações fortificadas por medo das EPs (Entidades da Praia).

Nesse contexto, a reconexão entre essas comunidades se dá por meio dos Porters (entregadores, como Sam Porter Bridges), que realizam o trabalho duro de transportar cargas entre os diferentes pontos habitados, enfrentando os perigos do lado de fora. Toda a comunicação e coordenação logística é mediada pela Rede Quiral (Chiral Network), uma infraestrutura tecnológica que conecta as instalações e permite o compartilhamento de dados e recursos entre os sobreviventes.

2. Objetivo do Sistema

O banco de dados tem como objetivo registrar e gerenciar as operações logísticas da rede de entregas. Para isso, o escopo do banco contempla o gerenciamento das seguintes entidades:

Locais: Cadastro de instalações (bunkers, cidades-nó, abrigos e postos avançados) espalhadas pelo mundo, com sua respectiva Região (Leste, Central, Oeste) e status na Rede Quiral.

Características de Área: Mapeamento das condições geográficas e climáticas das regiões (como tipo de terreno, clima, exposição a Timefall e presença de EPs).

Portadores: Registro dos entregadores ativos no sistema, suas estatísticas e capacidade máxima de carga.

Preppers: Sobreviventes e administradores cadastrados no sistema que emitem os pedidos e recebem entregas em seus respectivos abrigos/cidades, possuindo um nível de conexão (Estrelas).

Itens: Catálogo de tipos de carga circulantes na rede (ex: medicamentos, peças, alimentos, metais), com suas características de fragilidade e peso padrão.

Pedidos: Controle das solicitações de entrega, ligando o Local de origem ao Local de destino, além de registrar a carga transportada e seu status.

Estruturas: Registro de ferramentas de infraestrutura construídas pelos Portadores (pontes, escadas, geradores) e monitoramento de sua durabilidade.

Likes: Sistema de avaliação quantitativa que contabiliza o reconhecimento recebido pelos Portadores.

3. Restrições e Regras de Negócio

Para o funcionamento adequado da malha logística, o sistema impõe as seguintes restrições:

Validação de Entrega: Todo pedido de entrega deve, obrigatoriamente, ser associado a um Local de origem e destino válidos, além de assumido por um Portador ativo.

Capacidade de Carga: O peso total dos Itens de um Pedido não pode exceder a capacidade máxima suportada pelo Portador designado.

Condições de Rota: Cargas de alta fragilidade não devem passar por áreas com alta exposição a Timefall.

Dependência de Conexão: Um Local só pode usar a rede de forma plena se estiver com o status ativo na Rede Quiral. Ao atingir 2 estrelas de conexão com o Prepper/Administrador correspondente, o Local é conectado à rede automaticamente.

Evolução de Confiança: O nível de conexão quiral (Estrelas) e o saldo de Likes são atualizados mediante entregas bem-sucedidas.

Manutenção de Infraestrutura: As Estruturas sofrem degradação e devem ter sua durabilidade rastreada com base na área onde foram construídas.