DROP VIEW IF EXISTS vw_resumo_entregas;

CREATE VIEW vw_resumo_entregas AS
SELECT
    p.id_pedido,
    po.nome AS portador,
    pr.nome AS prepper,
    lo.nome AS origem,
    ld.nome AS destino,
    p.status_pedido,
    p.condicao_final_carga,
    po.total_likes,
    pr.estrelas_conexao
FROM Pedido p
JOIN Portador po
    ON p.id_portador = po.id_portador
JOIN Prepper pr
    ON p.id_prepper = pr.id_prepper
JOIN Local lo
    ON p.id_local_origem = lo.id_local
JOIN Local ld
    ON p.id_local_destino = ld.id_local;

SELECT *
FROM vw_resumo_entregas;