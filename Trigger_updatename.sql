CREATE TRIGGER name_clients
ON facturas
AFTER INSERT
AS
BEGIN
   UPDATE f
   SET f.nom_cliente = c.nombrecli
   FROM facturas f
   JOIN Clientes c ON f.cod_cliente = c.cod_cliente
   WHERE f.numero IN (SELECT numero FROM inserted);
END;