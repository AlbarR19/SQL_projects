use resuldok;

create table satusehatpasien(
nik INT NOT NULL,
nama_pasien varchar(255) NOT NULL,
email_pasien varchar(255) NOT NULL,
alamat_pasien varchar(255) not null,
notelp_pasien INT NOT NULL,
no_res int,
PRIMARY KEY (nik),
FOREIGN KEY (no_res) REFERENCES reservasi(no_res)
) engine=innodb;

create table dokter(
no_str INT NOT NULL,
nama_dokter varchar(255) NOT NULL,
email_dokter varchar(255) NOT NULL,
no_rs int,
no_date int,
PRIMARY KEY (no_str),
FOREIGN KEY (no_rs) REFERENCES his(no_rs),
FOREIGN KEY (no_date) REFERENCES jadwal(no_date)
) engine=innodb;

create table his(
no_rs INT NOT NULL,
nama_rs varchar(255) NOT NULL,
alamat_rs varchar(255) NOT NULL,
hotline INT NOT NULL,
PRIMARY KEY (no_rs)
) engine=innodb;

create table rekamedis(
no_rm INT NOT NULL auto_increment,
nik INT,
nama_pasien varchar(255),
alamat_pasien varchar(255),
riwayat_penyakit varchar(255),
PRIMARY KEY (no_rm),
FOREIGN KEY (nik) REFERENCES satusehatpasien(nik)
) engine=innodb;

create table jadwal(
no_date int not null auto_increment,
tanggal date NOT NULL,
jampraktik time NOT NULL,
jamselesai time not null,
PRIMARY KEY (no_date)
) engine=innodb;

create table reservasi(
no_res int not null auto_increment,
no_date int,
tanggal date,
jampraktik time,
jamselesai time,
PRIMARY KEY (no_res),
FOREIGN KEY (no_date) REFERENCES jadwal(no_date)
) engine=innodb;

create table MoH(
no_rs int,
nama_rs varchar(255),
alamat_rs varchar(255),
no_rm int,
FOREIGN KEY (no_rs) REFERENCES his(no_rs),
FOREIGN KEY (no_rm) REFERENCES rekamedis(no_rm)
) engine=innodb;

/* ,
FOREIGN KEY (tanggal) REFERENCES jadwal(tanggal),
FOREIGN KEY (jampraktik) REFERENCES jadwal(jampraktik),
FOREIGN KEY (jamselesai) REFERENCES jadwal(jamselesai)
,
FOREIGN KEY (nama_pasien) REFERENCES satusehatpasien(nama_pasien),
FOREIGN KEY (alamat_pasien) REFERENCES satusehatpasien(alamat_pasien)
,
FOREIGN KEY (nama_rs) REFERENCES his(nama_rs),
FOREIGN KEY (alamat_rs) REFERENCES his(alamat_rs)*/
