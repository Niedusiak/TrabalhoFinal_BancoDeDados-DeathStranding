# Trigger - Atualização automática após entrega

## Regra de negócio

No universo de Death Stranding, quando uma entrega é concluída, o portador recebe likes conforme a qualidade da carga entregue e a condição dela. Além disso, o Prepper do destino aumenta sua confiança no portador, representada pelas estrelas de conexão, e a instalação passa a integrar a Rede Quiral caso essa conexão chegue a duas estrelas.

## Funcionamento

O gatilho é executado após uma atualização na tabela Pedido.

Quando um pedido muda para o status "Entregue":

- adiciona likes ao portador;
- aumenta em uma unidade as estrelas do Prepper (máximo de 5);
- ativa a Rede Quiral da instalação de destino.

## Objetivo

Automatizar regras importantes do sistema sem depender da aplicação, garantindo consistência dos dados.