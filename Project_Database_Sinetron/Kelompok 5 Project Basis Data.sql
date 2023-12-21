--------- Big Project - KOM B - Kelompok 5 ---------
-- Delfia Nur Anrianti Putri - 21/473882/PA/20438 --
-- Fadgham Albar R.          - 21/479723/PA/20802 --
-- Billy Fahd Qodama         - 21/479773/PA/20808 --
-- Andyan Yogawardhana       - 21/482180/PA/21030 --

CREATE DATABASE sinetron;

USE sinetron;

CREATE TABLE divisi (
  nama_divisi VARCHAR(100),
  kode_divisi INT NOT NULL,
  kepala_divisi VARCHAR(100) NOT NULL,
  lokasi_divisi VARCHAR(100) NOT NULL,
  PRIMARY KEY (kode_divisi)
) ENGINE = INNODB;

CREATE TABLE sinetron (
  nomor_sinetron VARCHAR(100),
  judul_sinetron VARCHAR(200) NOT NULL,
  lokasi_sinetron VARCHAR(100) NOT NULL,
  ketua_sinetron VARCHAR(100) NOT NULL,
  biaya_sinetron INT NOT NULL,
  client_sinetron VARCHAR(100) NOT NULL,
  PRIMARY KEY (nomor_sinetron)
) ENGINE = INNODB;

CREATE TABLE staf (
  nama_staf VARCHAR(100),
  kode_staf INT NOT NULL,
  kode_divisi INT NOT NULL,
  nomor_sinetron VARCHAR(100) NOT NULL,  
  PRIMARY KEY (kode_staf, nomor_sinetron),
  FOREIGN KEY (kode_divisi) REFERENCES divisi(kode_divisi)
) ENGINE = INNODB;

CREATE TABLE jadwal (
  kode_staf_ambil INT,
  nomor_sinetron VARCHAR(100), 
  nama_sinetron VARCHAR(100) NOT NULL,
  jam_kerja INT NOT NULL,
  honor INT NOT NULL,
  PRIMARY KEY (kode_staf_ambil, nomor_sinetron),
  FOREIGN KEY (nomor_sinetron) REFERENCES sinetron(nomor_sinetron)
) ENGINE = INNODB; 


CREATE VIEW ViewStaf
AS SELECT  staf.nama_staf, staf.kode_staf, staf.kode_divisi,  divisi.nama_divisi, divisi.kepala_divisi, divisi.lokasi_divisi, staf.nomor_sinetron, sinetron.judul_sinetron, sinetron.lokasi_sinetron, sinetron.ketua_sinetron, sinetron.biaya_sinetron, sinetron.client_sinetron
FROM sinetron, staf, divisi
WHERE sinetron.nomor_sinetron=staf.nomor_sinetron 
AND divisi.kode_divisi=staf.kode_divisi;

-- Data untuk tabel sinetron
INSERT INTO sinetron
(nomor_sinetron, judul_sinetron, lokasi_sinetron, ketua_sinetron, biaya_sinetron, client_sinetron)
VALUES
('A01','Ada Apa Dengan Tugas','Sleman','Yoga W.',85,'Trans TV'      ),
('A02','Hati-Hati di Jalan','Bantul','Tulus',120,'Trans TV'         ),
('A03','Benar Tapi Kurang Tepat','Semarang','Pigit S.',90,'Trans TV'),
('A04','Merah dan Jingga','Kendal','Joko W.',85,'SCTV'              ),
('B01','Bidadari Surga','Bantul','Hani F.',115,'SCTV'               ),
('B02','Tugas Datang Tiba-Tiba','Semarang','Tombing K.',115,'RCTI'  ),
('B03','Senja di Filsafat','Sleman','Slamet J.',130,'RCTI'          ),
('B04','Semburat Fajar','Jakarta','Anwar L.',140,'NET'              ),
('C01','Jendela Dunia','Jakarta','Doni S.',115,'NET'                ),
('C02','Data dan Air Mata','Depok','Bong',100,'NET'                 ),
('D01','Cinta Ayu','Bandung','Bono S.',100,'SCTV'                   ),
('D02','Dihantui Burung Hantu','Semarang','Dimas H.',135,'SCTV'     ),
('D03','Bulu-Bulu Oranye','Semarang','Daud D.',110,'SCTV'           ),
('E01','Di Masa Remaja','Surabaya','Alfa M.',95,'NET'               ),
('F01','Galih dan Narta','Malang','Boy R.',105,'RCTI'               ),
('G01','Cilok dan Cinlok','Malang','Zarah K.',115,'RCTI'            ),
('K01','Malu-Malu Tikus','Surabaya','Susi I.',90,'RCTI'             ),
('K02','Dua Garis Hitam Putih','Jakarta','Kimbo',130,'NET'          ),
('K03','Mata-Mata Cinta','Surabaya','James B.',85,'NET'             ),
('L01','Buaya Darat','Surabaya','Ituk M.',145,'Trans TV'            ),
('L02','Dekat di Hati','Bantul','Meran A.',90,'RCTI'                );

-- data untuk divisi
INSERT INTO divisi
(nama_divisi, kode_divisi, kepala_divisi, lokasi_divisi                   )
VALUES
('Lighting',1,'Inka Lidi','Gedung 1, Lantai 2, Ruang A2103'               ),
('Sound',2,'Fre Kuensi','Gedung 1, Lantai 2, Ruang A4729'                 ),
('Visual Effect',3,'Cah Aya','Gedung 1, Lantai 2, Ruang A4730'            ),
('Costume',4,'Halo Wen','Gedung 1, Lantai 2, Ruang A4731'                 ),
('Makeup Artist',5,'Emu A.','Gedung 1, Lantai 2, Ruang A4732'             ),
('Camera',6,'Dimas','Gedung 1, Lantai 2, Ruang A4733'                     ),
('Marketing',7,'Gigi','Gedung 1, Lantai 2, Ruang A4734'                   ),
('Assistant Directors',8,'Rania','Gedung 1, Lantai 2, Ruang A4735'        ),
('Transportation',9,'Khansa','Gedung 1, Lantai 2, Ruang A4736'            ),
('Properties',10,'Daffa','Gedung 1, Lantai 2, Ruang A4737'                ),
('Stunts',11,'Rhinta','Gedung 1, Lantai 2, Ruang A4738'                   ),
('Special Effects',12,'Genta','Gedung 1, Lantai 2, Ruang A4739'           ),
('Catering and Food Services',13,'Alfi','Gedung 1, Lantai 2, Ruang A4740' ),
('Safety',14,'Alifia','Gedung 1, Lantai 2, Ruang A4741'                   ),
('Script',15,'Via','Gedung 1, Lantai 2, Ruang A4742'                      ),
('Audit',16,'Poetra','Gedung 1, Lantai 2, Ruang A4743'                    ),
('Operator',17,'Jimbo','Gedung 1, Lantai 2, Ruang A4744'                  ),
('Driver',18,'Leo','Gedung 1, Lantai 2, Ruang A4745'                      ),
('Electrician',19,'Pietro','Gedung 1, Lantai 2, Ruang A4746'              ),
('Entertainment lawyer',20,'Lora','Gedung 1, Lantai 2, Ruang A4747'       );

-- Data untuk tabel staff
INSERT INTO staf
(kode_staf, nama_staf, kode_divisi, nomor_sinetron)
VALUES
(10210,'Lia Halim',1,'D01'              ),
(10210,'Lia Halim',1,'K01'              ),
(10211,'Rehan Wangsaff',6,'A02'         ),
(10212,'Sigit Rendang',3,'B02'          ),
(10213,'Roger Sumatra',2,'A03'          ),
(10214,'Dilan Cepmek',19,'C02'          ),
(10215,'Delfia Nur',3,'A04'             ),
(10216,'Fadhgam Albar',11,'D03'         ),
(10217,'Andyan Yogawardhana',5,'B01'    ),
(10218,'Dyandra Aulia',9,'E01'          ),
(10219,'Billy Fahd Qodama',4,'K02'      ),
(10220,'Felicia Eureka',10,'L02'        ),
(10221,'Jonathan Edmund',7,'B03'        ),
(10222,'Muhammad Linggar',8,'B04'       ),
(10223,'Kadek Ninda',20,'C01'           ),
(10224,'Rachel Naragifta',12,'F01'      ),
(10225,'Fadya Nabila',17,'A01'          ),
(10226,'Muhammad Irfan',2,'C02'         ),
(10227,'Konang Tyagazain',14,'D01'      ),
(10228,'Faris Zaidan Nafis',16,'G01'    ),
(10229,'Abid Nujaiba',15,'L01'          ),
(10230,'Diki Bagastama',18,'D03'        ),
(10231,'Uzumaki Naruto',11,'NULL'       ),
(10232,'Uchiha Sasuke',15,'NULL'        ),
(10233,'Haruno Sakura',8,'NULL'         ),
(10234,'Hatake Kakashi',16,'NULL'       ),
(10235,'Hyuuga Hinata',4,'NULL'         );

-- Data untuk tabel jadwal
insert into jadwal(kode_staf_ambil, nomor_sinetron, nama_sinetron, jam_kerja, honor)
values
(10210,'D01','Cinta Ayu',20,70000                ),
(10210,'K01','Malu-Malu Tikus',10,50000          ),
(10211,'A02','Hati-Hati di Jalan',15,60000       ),
(10212,'A02','Hati-Hati di Jalan',10,70000       ),
(10213,'A03','Benar Tapi Kurang Tepat',8,65000   ),
(10214,'A03','Benar Tapi Kurang Tepat',10,75000  ),
(10215,'A04','Merah dan Jingga',9,30000          ),
(10216,'A04','Merah dan Jingga',6,90000          ),
(10217,'B01','Bidadari Surga',9,50000            ),
(10218,'B01','Bidadari Surga',17,80000           ),
(10219,'B02','Tugas Datang Tiba-Tiba',5,60000    ),
(10220,'B02','Tugas Datang Tiba-Tiba',13,80000   ),
(10221,'B03','Senja di Filsafat',5,90000         ),
(10222,'B04','Semburat Fajar',9,50000            ),
(10223,'C01','Jendela Dunia',20,80000            ),
(10224,'C01','Jendela Dunia',15,70000            ),
(10225,'C02','Data dan Air Mata',20,60000        ),
(10226,'C02','Data dan Air Mata',19,40000        ),
(10227,'D01','Cinta Ayu',14,70000                ),
(10228,'D01','Cinta Ayu',10,40000                ),
(10229,'D02','Dihantui Burung Hantu',16,80000    ),
(10230,'D02','Dihantui Burung Hantu',13,40000    );


SELECT judul_sinetron, ketua_sinetron, client_sinetron, biaya_sinetron
FROM sinetron
WHERE biaya_sinetron > 95;

SELECT nama_divisi , AVG(honor) as gaji
FROM divisi as d, staf as st, jadwal as j
WHERE st.nomor_sinetron=j.nomor_sinetron and d.kode_divisi=st.kode_divisi
GROUP BY nama_divisi;

