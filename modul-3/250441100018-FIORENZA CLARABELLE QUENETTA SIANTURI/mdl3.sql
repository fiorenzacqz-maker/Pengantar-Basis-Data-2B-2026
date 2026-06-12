SELECT nama_barang, kategori, kode_sku
FROM inventaris_gudang_pusat
WHERE lokasi_rak IS NULL
  AND stok > 0
  AND status_qc = 'Lulus';

SELECT DISTINCT kategori
FROM inventaris_gudang_pusat
WHERE kode_sku LIKE '%ELEC%X'
  AND harga_satuan > 5000000;

SELECT 
  nama_barang,
  stok,
  CASE
    WHEN stok = 0 AND kategori = 'Aksesoris' THEN 'Urgent - Restock Segera'
    WHEN stok < 10 AND stok != 0 AND kategori IN ('Laptop', 'Smartphone') THEN 'High Priority'
    WHEN stok BETWEEN 10 AND 50 THEN 'Medium'
    ELSE 'Aman'
  END AS prioritas_restock
FROM inventaris_gudang_pusat
ORDER BY stok ASC;

SELECT *
FROM inventaris_gudang_pusat
WHERE lokasi_rak LIKE 'B%'
  AND NOT (harga_satuan BETWEEN 1000000 AND 5000000)
  AND kategori != 'Monitor';

SELECT nama_barang, harga_satuan, status_qc
FROM inventaris_gudang_pusat
WHERE kategori != 'Furniture'
  AND status_qc = 'Lulus'
ORDER BY harga_satuan DESC
LIMIT 3;
