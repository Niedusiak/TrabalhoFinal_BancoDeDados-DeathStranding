SELECT * FROM Portador
WHERE id_portador = 1;

SELECT * FROM Prepper
WHERE id_local = 15;

SELECT * FROM Local
WHERE id_local = 15;

SELECT * FROM Pedido
WHERE id_pedido = 80;

UPDATE Pedido
SET status_pedido = 'Entregue',
    condicao_final_carga = 'Perfeita'
WHERE id_pedido = 80;

SELECT * FROM Portador
WHERE id_portador = 1;

SELECT * FROM Prepper
WHERE id_local = 15;

SELECT * FROM Local
WHERE id_local = 15;