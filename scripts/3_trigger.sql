DELIMITER $$

CREATE TRIGGER trg_entrega
AFTER UPDATE ON Pedido
FOR EACH ROW
BEGIN

    IF OLD.status_pedido <> 'Entregue'
        AND NEW.status_pedido = 'Entregue' THEN

        UPDATE Portador
        SET total_likes =
            total_likes +
            CASE 
                WHEN NEW.condicao_final_carga = 'Perfeita' THEN 100
                WHEN NEW.condicao_final_carga = 'Danificada' THEN 50
                ELSE 10
            END
        WHERE id_portador = NEW.id_portador;
    
        UPDATE Prepper
        SET estrelas_conexao = 
            LEAST(estrelas_conexao + 1, 5)
        WHERE id_local = NEW.id_local_destino;
    
    END IF;
END$$

DELIMITER ;

