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

Locais: Cadastro de instalações (bunkers, cidades-nó, abrigos e postos avançados) espalhadas pelo mundo e seu status na Rede Quiral.

Características de Área: Mapeamento das condições geográficas e climáticas das regiões (como tipo de terreno, clima, exposição a Timefall e presença de EPs).

Portadores: Registro dos entregadores ativos no sistema, suas estatísticas e capacidade máxima de carga.

Preppers: Sobreviventes e clientes cadastrados no sistema que emitem os pedidos e recebem entregas em seus respectivos abrigos, possuindo um nível de conexão (Estrelas).

Itens: Catálogo de tipos de carga circulantes na rede (ex: medicamentos, peças, alimentos, metais), com suas características de fragilidade e peso padrão.

Pedidos: Controle das solicitações de entrega, ligando o Prepper de origem ao Prepper de destino, além de registrar a carga transportada e seu status.

Estruturas: Registro de ferramentas de infraestrutura construídas pelos Portadores (pontes, escadas, geradores) e monitoramento de sua durabilidade.

Likes: Sistema de avaliação quantitativa que contabiliza o reconhecimento recebido pelos Portadores ao concluírem entregas ou ao terem suas estruturas utilizadas por outros.

3. Restrições e Regras de Negócio

Para o funcionamento adequado da malha logística, o sistema impõe as seguintes restrições que devem ser garantidas e modeladas pelo banco de dados:

Validação de Entrega: Todo pedido de entrega deve, obrigatoriamente, ser solicitado por um Prepper remetente, direcionado a um Prepper destinatário válido e assumido por um Portador ativo.

Capacidade de Carga: O peso total dos Itens de um Pedido não pode, em hipótese alguma, exceder a capacidade máxima suportada pelo Portador designado para o transporte.

Condições de Rota e Área: A integridade dos Itens durante a entrega pode ser afetada pelas Características da Área associada ao trajeto ou local. Cargas de alta fragilidade não devem passar por áreas com alta exposição a Timefall (chuva quiral).

Dependência de Conexão: Um Prepper ou Local só pode emitir ou receber novos pedidos pelo sistema se estiver devidamente conectado à Rede Quiral (Status ativo).

Evolução de Confiança: O nível de conexão quiral (Estrelas) de um Prepper e o saldo total de Likes do Portador devem ser atualizados quando um Pedido chega ao seu destino de forma bem-sucedida.

Manutenção de Infraestrutura: As Estruturas construídas sofrem degradação contínua (especialmente em áreas com incidência de Timefall). O banco deve registrar a durabilidade percentual da estrutura, vinculando-a à área em que foi instalada e ao Portador que a criou.