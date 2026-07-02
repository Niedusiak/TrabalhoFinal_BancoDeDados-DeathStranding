DELIMITER $$

CREATE TRIGGER trg_entrega
AFTER UPDATE ON Pedido
FOR EACH ROW
BEGIN

    IF OLD.status_pedido <> 'Entregue'
       AND NEW.status_pedido = 'Entregue' THEN

        UPDATE Portador
        SET total_likes = total_likes +
            CASE
                WHEN NEW.condicao_final_carga = 'Perfeita' THEN 100
                WHEN NEW.condicao_final_carga = 'Danificada' THEN 50
                WHEN NEW.condicao_final_carga = 'Destruida' THEN 10
                ELSE 0
            END
        WHERE id_portador = NEW.id_portador;

        IF NEW.condicao_final_carga = 'Perfeita' THEN

            UPDATE Prepper
            SET estrelas_conexao = LEAST(estrelas_conexao + 1, 5)
            WHERE id_prepper = NEW.id_prepper;

            UPDATE Local
            JOIN Prepper
                ON Local.id_local = Prepper.id_local
            SET Local.status_rede_quiral = 1
            WHERE Prepper.id_prepper = NEW.id_prepper
              AND Prepper.estrelas_conexao >= 2;

        END IF;

    END IF;

END$$

DELIMITER ;