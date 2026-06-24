Trabalho Final — Banco de Dados I

Integrantes

|     Nome         |     RGA      |
|------------------|--------------|
| Mateus Niedusiak | 202522901010 | 
| Gustavo Torres   | ___________  |
| Matheus Rossa    | 202321901032 |

Descrição do Problema

Contexto

O sistema modela a rede logística do universo de Death Stranding, um cenário pós-apocalíptico onde a civilização humana foi fragmentada após um evento catastrófico denominado Death Stranding. Nesse contexto, a humanidade sobrevive em instalações isoladas, e a reconexão entre essas comunidades se dá por meio de porters — carregadores responsáveis por transportar cargas entre os diferentes pontos habitados. Toda a comunicação e coordenação logística é mediada pela Rede Quiral (Chiral Network), uma infraestrutura tecnológica que conecta as instalações e permite o compartilhamento de recursos e informações entre os sobreviventes.

Objetivo do Sistema

O banco de dados tem como objetivo registrar e gerenciar as operações logísticas da rede de entregas, contemplando:


O cadastro de instalações (bunkers, cidades-nó, abrigos e postos avançados) distribuídas por diferentes regiões do território;
O registro de porters responsáveis pelas entregas e sua relação com as instalações;
O controle de cargas e seus respectivos tipos, com atributos como peso, fragilidade e condição;
O gerenciamento de pedidos de entrega entre instalações, com rastreamento do estado de cada pedido;
O registro das entregas executadas, associando porters, pedidos e avaliações de desempenho;
O mapeamento de rotas entre instalações, incluindo condições de percurso como exposição a timefall (chuva quiral que acelera o envelhecimento da carga);
O registro de estruturas construídas pelos porters ao longo das rotas (pontes, escadas, geradores), com controle de durabilidade;
Um sistema de likes que permite aos porters avaliarem entregas realizadas e estruturas utilizadas;
O monitoramento de eventos de timefall por região, que impactam diretamente a degradação de cargas e rotas;
O acompanhamento do nível de conexão quiral de cada instalação à rede, que evolui conforme entregas são realizadas.


Restrições Principais


Toda entrega deve estar associada a um pedido válido e a um porter ativo;
O peso total da carga de uma entrega não pode exceder a capacidade máxima do porter;
Uma instalação só pode emitir pedidos se estiver conectada à Rede Quiral;
Cargas com alto grau de fragilidade exigem rotas sem exposição a timefall;
O nível de conexão quiral de uma instalação é atualizado automaticamente ao término de entregas bem-sucedidas com destino a ela;
Estruturas possuem durabilidade limitada e devem ser monitoradas para manutenção.