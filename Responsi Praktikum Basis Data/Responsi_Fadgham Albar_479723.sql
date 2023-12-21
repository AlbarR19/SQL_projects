USE PVFC_database;

-- no 1
SELECT order_id, nama_cust, deskripsi_produk, quantity, tanggal_order
FROM tabel_produk as t, kust_tabel as c, order_tabel as o
WHERE o.cust_id=c.cust_id AND o.produk_id=t.produk_id AND o.tanggal_order > 2018;


-- no 2
SELECT nama_cust, quantity, alamat_cust
FROM kust_tabel as c, order_tabel as o
WHERE o.cust_id=c.cust_id AND c.alamat_cust LIKE "%Ringroad%";

-- no 3
DELIMITER $$
CREATE FUNCTION harganaik (unit_price DOUBLE, finish VARCHAR(255)) RETURNS DOUBLE
	DETERMINISTIC
BEGIN
	DECLARE harga DOUBLE;
    IF finish = 'natural' THEN
		SET harga = unit_price + (unit_price * 0.05);
	ELSEIF finish = 'leather' THEN
		SET harga = unit_price + (unit_price * 0.03);
	ELSEIF finish = 'red' THEN
		SET harga = unit_price + (unit_price * 0.02);
	ELSE
		SET harga = unit_price + (unit_price * 0.01);
	END IF;
    RETURN (harga);
END $$
DELIMITER ;

SELECT deskripsi_produk, finish,unit_price, harganaik(unit_price,finish) as new_price
FROM tabel_produk
ORDER BY finish ASC;

-- nomor 4
SELECT order_id, nama_cust, alamat_cust, quantity
FROM tabel_produk as t, kust_tabel as c, order_tabel as o
WHERE o.cust_id=c.cust_id AND o.produk_id=t.produk_id 
	AND quantity >
		(SELECT AVG(quantity)
		FROM order_tabel);

-- nomor 5
SELECT nama_cust, deskripsi_produk, quantity
FROM tabel_produk as t, kust_tabel as c, order_tabel as o
WHERE o.cust_id=c.cust_id AND o.produk_id=t.produk_id 
ORDER BY quantity ASC;

-- nomor 6
SELECT tanggal_order, nama_cust, alamat_cust, order_id
FROM tabel_produk as t, kust_tabel as c, order_tabel as o
WHERE o.cust_id=c.cust_id AND o.produk_id=t.produk_id 
ORDER BY tanggal_order DESC;

-- nomor 7
CREATE TABLE audit_harga(
  id INT AUTO_INCREMENT PRIMARY KEY,
  unit_price INT NOT NULL,
  changeDate DATETIME DEFAULT NULL,
  action VARCHAR(50) DEFAULT NULL
);

DELIMITER $$
CREATE TRIGGER before_harga_ubah BEFORE UPDATE ON tabel_produk
FOR EACH ROW
BEGIN
INSERT INTO audit_harga
SET action = unit_price = OLD.unit_price,
  changeDate = NOW();
END $$
DELIMITER ;
DROP TRIGGER before_harga_ubah;
SHOW TRIGGERS;
UPDATE tabel_produk
SET unit_price = 100
WHERE deskripsi_produk = 'Dining table';


-- nomor 8
SELECT deskripsi_produk, unit_price
FROM tabel_produk
WHERE produk_id NOT IN
	(SELECT produk_id
	FROM order_tabel);
    
-- nomor 9
SELECT  deskripsi_produk, nama_cust, tanggal_order
FROM tabel_produk as t, kust_tabel as c, order_tabel as o
WHERE o.cust_id=c.cust_id AND o.produk_id=t.produk_id 
	AND month(o.tanggal_order)>10 AND year(o.tanggal_order)=2022;
-- nomor 10
SELECT nama_cust, alamat_cust, finish
FROM tabel_produk as t, kust_tabel as c, order_tabel as o
WHERE o.cust_id=c.cust_id AND o.produk_id=t.produk_id AND finish IN ("Leather", "Yellow", "Natural Ash");
