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

Características de Área: Mapeamento das condições geográficas e climáticas das regiões.

Portadores: Registro dos entregadores ativos no sistema.

Preppers: Sobreviventes e administradores cadastrados no sistema que emitem ou são os destinatários dos pedidos, possuindo um nível de conexão (Estrelas).

Itens: Catálogo de tipos de carga circulantes na rede (medicamentos, peças, alimentos, metais).

Pedidos: Controle das solicitações de entrega. Associa os locais de origem e destino, o Portador responsável pelo transporte e o Prepper que solicitou. Um pedido pode conter múltiplos Itens.

Estruturas: Registro de ferramentas de infraestrutura construídas pelos Portadores (pontes, escadas, geradores).

Likes: Sistema de avaliação quantitativa. Um like pode ser dado diretamente a um Portador (pela conclusão de um pedido) ou vinculado a uma Estrutura útil deixada no mapa.

3. Restrições e Regras de Negócio

Validação de Entrega: Todo pedido deve ser associado a locais válidos, a um Prepper e assumido por um Portador ativo.

Capacidade de Carga: O peso total dos Itens não pode exceder a capacidade do Portador.

Condições de Rota: Cargas de alta fragilidade requerem rotas seguras contra Timefall.

Dependência de Conexão: Apenas Locais ativos na Rede Quiral usam o sistema de forma plena (sendo ativados ao atingirem 2 estrelas de conexão).

Evolução de Confiança: O nível de conexão quiral e o saldo de Likes evoluem mediante entregas bem-sucedidas.

Manutenção e Likes: As Estruturas sofrem degradação e podem receber Likes dos usuários, que são repassados ao Portador que as construiu.