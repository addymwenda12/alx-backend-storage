-- This script creates a trigger that decreases the quantity of an item
-- in the 'items' table after adding a new order in the 'orders' table.
-- The quantity in the 'items' table can be negative.

DELIMITER $$

CREATE TRIGGER decrease_item_quantity
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    UPDATE items
    SET quantity = quantity - NEW.number
    WHERE name = NEW.item_name;
END$$

DELIMITER ;
