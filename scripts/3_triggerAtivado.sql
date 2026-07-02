UPDATE Pedido SET status_pedido = 'Pendente', condicao_final_carga = NULL WHERE id_pedido = 80;

SELECT * FROM Portador WHERE id_portador = 80;
SELECT * FROM Prepper WHERE id_prepper = 81;
SELECT * FROM Local WHERE id_local = 81;
SELECT * FROM Pedido WHERE id_pedido = 80;

UPDATE Pedido
SET status_pedido = 'Entregue',
    condicao_final_carga = 'Perfeita'
WHERE id_pedido = 80;

SELECT * FROM Portador WHERE id_portador = 80;
SELECT * FROM Prepper WHERE id_prepper = 81;
SELECT * FROM Local WHERE id_local = 81;