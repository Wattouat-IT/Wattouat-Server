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
  id_node_info INT NOT NULL,
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

/* Table 'price_kwh' */
CREATE TABLE price_kwh(single FLOAT(5), `day` FLOAT(5), night FLOAT(5));

/* Table 'kwh' */
CREATE TABLE kwh(
  id INT NOT NULL AUTO_INCREMENT,
  kwh FLOAT(20),
  temps DATETIME,
  cpu_id INT,
  PRIMARY KEY(id)
);

/* Table 'service' */
CREATE TABLE service(
  id INT NOT NULL AUTO_INCREMENT,
  service_name VARCHAR(50),
  id_node_info INT NOT NULL,
  PRIMARY KEY(id)
);

/* Table 'kwh_service' */
CREATE TABLE kwh_service(
  id INT NOT NULL AUTO_INCREMENT,
  kwh FLOAT(20),
  temps DATETIME,
  service_id INT NOT NULL,
  PRIMARY KEY(id)
);

/* Table 'gpu' */
CREATE TABLE gpu(
  id INT NOT NULL AUTO_INCREMENT,
  gpu_model VARCHAR(50),
  id_node_info INT NOT NULL,
  PRIMARY KEY(id)
);

/* Table 'kwh_gpu' */
CREATE TABLE kwh_gpu(
  id INT NOT NULL,
  kwh FLOAT(20),
  temps DATETIME,
  gpu_id INT NOT NULL,
  PRIMARY KEY(id)
);

/* Relation 'cpu_kwh' */
ALTER TABLE kwh ADD CONSTRAINT cpu_kwh FOREIGN KEY (cpu_id) REFERENCES cpu (id);

/* Relation 'node_info_service' */
ALTER TABLE service
  ADD CONSTRAINT node_info_service
    FOREIGN KEY (id_node_info) REFERENCES node_info (id);

/* Relation 'service_kwh_service' */
ALTER TABLE kwh_service
  ADD CONSTRAINT service_kwh_service
    FOREIGN KEY (service_id) REFERENCES service (id);

/* Relation 'gpu_kwh_gpu' */
ALTER TABLE kwh_gpu
  ADD CONSTRAINT gpu_kwh_gpu FOREIGN KEY (gpu_id) REFERENCES gpu (id);

/* Relation 'node_info_cpu' */
ALTER TABLE cpu
  ADD CONSTRAINT node_info_cpu
    FOREIGN KEY (id_node_info) REFERENCES node_info (id);

/* Relation 'node_info_gpu' */
ALTER TABLE gpu
  ADD CONSTRAINT node_info_gpu
    FOREIGN KEY (id_node_info) REFERENCES node_info (id);
