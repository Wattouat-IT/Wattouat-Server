/* Table 'node_info' */
CREATE TABLE node_info(
  id INT NOT NULL AUTO_INCREMENT,
  host_name VARCHAR(30),
  os VARCHAR(30),
  ip VARCHAR(20),
  `date_add` DATETIME,
  up_time DATE,
  day_time VARCHAR(20),
  PRIMARY KEY(id)
);

/* Table 'cpu' */
CREATE TABLE cpu(
  id INT NOT NULL AUTO_INCREMENT,
  cpu_model VARCHAR(50),
  cpu_mhz INT(50),
  cpu_core INT(50),
  id_node_info INT,
  PRIMARY KEY(id)
);

/* Table 'user' */
CREATE TABLE `user`(
  id INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(20),
  first_name VARCHAR(20),
  pwd BINARY(100),
  email VARCHAR(100),
  PRIMARY KEY(id)
);

/* Table 'prix_unitaire_kwh' */
CREATE TABLE prix_unitaire_kwh(prix_en_euro FLOAT(5));

/* Table 'kwh' */
CREATE TABLE kwh(
  id INT NOT NULL AUTO_INCREMENT,
  kwh FLOAT(20),
  cpu_id INT,
  PRIMARY KEY(id)
);

/* Table 'temps' */
CREATE TABLE temps(
  id INT NOT NULL AUTO_INCREMENT,
  temps DATETIME,
  cpu_id INT NOT NULL,
  PRIMARY KEY(id)
);

/* Relation 'node_info_list_service' */
ALTER TABLE cpu
  ADD CONSTRAINT node_info_list_service
    FOREIGN KEY (id_node_info) REFERENCES node_info (id);

/* Relation 'cpu_kwh' */
ALTER TABLE kwh ADD CONSTRAINT cpu_kwh FOREIGN KEY (cpu_id) REFERENCES cpu (id);

/* Relation 'cpu_temps' */
ALTER TABLE temps
  ADD CONSTRAINT cpu_temps FOREIGN KEY (cpu_id) REFERENCES cpu (id);
