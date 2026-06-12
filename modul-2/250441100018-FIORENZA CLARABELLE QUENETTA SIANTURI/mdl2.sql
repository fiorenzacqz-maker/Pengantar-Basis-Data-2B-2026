`dokter`create database rumahsakit;
use rumahsakit;

CREATE TABLE dokter (
    id_dokter INT PRIMARY KEY,
    nama_dokter VARCHAR(100),
    spesialisasi VARCHAR(100)
);
describe dokter

CREATE TABLE pasien (
    id_pasien INT PRIMARY KEY,
    nama_pasien VARCHAR(100),
    tanggal_lahir DATE,
    no_telepon VARCHAR(15)
);
describe pasien

CREATE TABLE rekam_medis (
    id_rekam INT PRIMARY KEY,
    id_pasien INT,
    id_dokter INT,
    tanggal_periksa DATE,
    diagnosis VARCHAR(255),
    FOREIGN KEY (id_pasien) REFERENCES pasien(id_pasien) ON DELETE RESTRICT,
    FOREIGN KEY (id_dokter) REFERENCES dokter(id_dokter) ON DELETE RESTRICT
);
describe rekam_medis

INSERT INTO dokter VALUES (1,'Dr. Andi','Umum'), (2,'Dr. Sinta','Gigi');
INSERT INTO pasien VALUES (1,'Budi','2000-05-10','08123456789'),
(2,'Ani','1998-03-15','08234567890');


INSERT INTO rekam_medis VALUES
(1,1,1,'2025-01-01','Flu'),
(2,2,2,'2025-01-02','Sakit Gigi');

INSERT INTO rekam_medis VALUES (3,1,99,'2025-01-03','Demam');

UPDATE pasien SET no_telepon='08999999999' WHERE id_pasien=1;
UPDATE dokter SET spesialisasi='Spesialis Anak' WHERE id_dokter=1;
DELETE FROM rekam_medis WHERE id_rekam=1;

drop table rekam_medis

CREATE TABLE rekam_medis (
    id_rekam INT PRIMARY KEY,
    id_pasien INT,
    id_dokter INT,
    tanggal_periksa DATE,
    diagnosis VARCHAR(255),
    FOREIGN KEY (id_pasien) REFERENCES pasien(id_pasien) ON DELETE RESTRICT,
    FOREIGN KEY (id_dokter) REFERENCES dokter(id_dokter) ON DELETE CASCADE
);
describe rekam_medis

INSERT INTO rekam_medis VALUES
(1, 1, 1, '2024-01-01', 'Demam'),
(2, 2, 1, '2024-01-02', 'Flu');

DELETE FROM dokter
WHERE id_dokter = 1;

SELECT * FROM rekam_medis;

CREATE TABLE rekam_medis (
    id_rekam INT PRIMARY KEY,
    id_pasien INT,
    id_dokter INT,
    tanggal_periksa DATE,
    diagnosis VARCHAR(255),
    FOREIGN KEY (id_pasien) REFERENCES pasien(id_pasien) ON DELETE RESTRICT,
    FOREIGN KEY (id_dokter) REFERENCES dokter(id_dokter) ON DELETE RESTRICT
);

TRUNCATE TABLE rekam_medis;
TRUNCATE TABLE pasien;