# Visão: vw_resumo_entregas

## Objetivo

A visão `vw_resumo_entregas` reúne em uma única consulta as principais informações relacionadas às entregas realizadas no Sistema Logístico Quiral.

Ela combina dados provenientes das tabelas:

- Pedido
- Portador
- Prepper
- Local (Origem)
- Local (Destino)

## Relevância

Durante o funcionamento do sistema é comum consultar diversas informações sobre uma entrega, como:

- quem realizou a entrega;
- qual prepper recebeu a carga;
- local de origem;
- local de destino;
- status da entrega;
- condição final da carga;
- quantidade de likes do portador;
- quantidade de estrelas de conexão do prepper.

Sem a utilização da visão seria necessário realizar diversos comandos `JOIN` sempre que essas informações fossem necessárias.

A view simplifica esse processo, tornando as consultas mais legíveis, reutilizáveis e facilitando o desenvolvimento de relatórios e painéis administrativos.

## Benefícios

- reduz a complexidade das consultas;
- evita repetição de código SQL;
- melhora a organização do banco de dados;
- facilita consultas para geração de relatórios.