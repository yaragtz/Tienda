CREATE DATABASE Tienda;

USE Tienda;

CREATE TABLE productos(
idproducto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(255),
descripción VARCHAR(255), 
precio DOUBLE);

/Teinda/
/PROCEDURE INSERTAR/
DELIMITER //
DROP PROCEDURE IF EXISTS p_InsertarProducto;
CREATE PROCEDURE p_InsertarProducto
(
   IN _idproducto INT,
   IN _nombre VARCHAR(255),
   IN _descripcion VARCHAR(255),
   IN _precio DOUBLE
)
BEGIN
DECLARE existe INT;
   SELECT COUNT(*) INTO existe FROM productos WHERE idproducto=_idproducto;
   IF existe = 0 THEN 
   INSERT INTO productos VALUES(_idproducto, _nombre, _descripcion, _precio);
	END IF;
END;
//

CALL p_InsertarProducto(NULL, 'Colorante en polvo', 'Colorante rojo fresa', '3.00'); 
CALL p_InsertarProducto(NULL, 'Charola Grande Reyma ', 'Paquete con 50 piezas', '28.00'); 
CALL p_InsertarProducto(NULL, 'Charola Chica Reyma ', 'Paquete con 50 piezas', '18.00');
CALL p_InsertarProducto(NULL, 'Vaso 32eu', 'Vaso 32eu(micheladas)', '55.00'); 
CALL p_InsertarProducto(NULL, 'Vaso #16 Reyma ', 'Vaso 16 ancho', '28.00');  
CALL p_InsertarProducto(NULL, 'Vaso #16L Reyma ', 'Vaso 16 largo', '28.00');
CALL p_InsertarProducto(NULL, 'Cobertura de chocolate', 'Chocolate para chocobananas', '80.00'); 
CALL p_InsertarProducto(NULL, 'Vaso #8 Reyma ', 'Paquete con 50 piezas', '28.00');  
CALL p_InsertarProducto(NULL, 'RB100 ', 'Contenedor triangular', '28.00');
CALL p_InsertarProducto(NULL, 'RB180', 'Contenedor para biónicos', '28.00');
  
SELECT * FROM productos;

/PROCEDURE ELIMINAR/
DELIMITER //
DROP PROCEDURE IF EXISTS p_EliminarProducto;
CREATE PROCEDURE p_EliminarProducto
(
   IN _idproducto INT
)
BEGIN 
 DELETE FROM productos WHERE idproducto=_idproducto;
END;
//

CALL  p_EliminarProducto(10);
SELECT * FROM productos;

/* PROCEDURE ACTUALIZAR */
DELIMITER //
DROP PROCEDURE IF EXISTS p_ActualizarProducto;
CREATE PROCEDURE p_ActualizarProducto
(
   IN _idproducto INT,
   IN _nombre VARCHAR(255),
   IN _descripcion VARCHAR(255),
   IN _precio DOUBLE 
)
BEGIN 
  UPDATE productos 
  SET 
  nombre = _nombre,
  descripción = _descripcion,
  precio = _precio
  WHERE idproducto = _idproducto;
END;
//
CALL p_ActualizarProducto(5, 'Vaso #16a', 'Vaso tequilero', '28.00');
SELECT * FROM productos;
DESCRIBE productos;