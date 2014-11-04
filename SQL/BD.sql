/*
Transcriptor: Diego Monterroza
Sugiero que esta es una base de datos sencilla para el cálculo de planilla de empleados de una empresa.
Coloqué las referencias y llaves tal como lo indica el diagrama, con mis dudas y sugerencias a la par en comentario. Espero que podamos
resolverlo juntos para llegar a un acuerdo; cualquier onda me pueden avisar, ando un poco desfasado en escribir SQL :v

No he colocado los campos como NOT NULL por cualquier onda...
*/
create database clave2;

create table Departamento(
	id_depto VARCHAR(2) primary key,
	nombre_depto VARCHAR(25),
	zona_geografica VARCHAR(15)
);

create table Municipio(
	id_municipio VARCHAR(2),
	id_depto VARCHAR(2),
	nomb_municipio VARCHAR(25),
	primary key(id_municipio,id_depto),
	foreign key (id_depto) references Departamento.id_depto
);
--no caigo en cuenta el porqué de la doble primaria... a mi parecer solo debería ser la id_municipio.

create table Puesto(
	id_puesto SMALLINT primary key,
	nomb_puesto VARCHAR(45),
	perfil_puesto VARCHAR(255),
	fecha_Ing DATE,
	sueldo_min DECIMAL(11,2),
	sueldo_max DECIMAL(11,2)
);

create table Oficina(
	id_oficina VARCHAR(5),
	nomb_oficina VARCHAR(45),
	domicilio VARCHAR(100),
	id_municipio VARCHAR(2),
	id_depto VARCHAR(2),
	foreign key (id_municipio,id_depto) references (Municipio.id_municipio,Municipio.id_depto) -- no creo que esto exista xD, yo haría la referencia al municipio nada más
); 

create table Genero(
	id_sexo VARCHAR(1) primary key,
	d_sexo VARCHAR(12)
);

create table TiposDescuentos(
	id_tiposdescuentos VARCHAR(5) primary key,
	descripcion VARCHAR(250),
	porcentaje_descuento DECIMAL(5,3),
	fecha_ingreso DATE
);

create table Empleado(
	id_empleado VARCHAR(5) primary key,
	nit VARCHAR(14),
	dui VARCHAR(9), --corrección para almacenar solo los dígitos del DUI, sin el guión
	nombres VARCHAR(45),
	apellido_paterno VARCHAR(45),
	apellido_materno VARCHAR(45),
	fecha_nacimiento DATE,
	fecha_ingreso DATE,
	sueldo DECIMAL(11,2),
	e_mail VARCHAR(45),
	telefono VARCHAR(45), -- no sé, creo que debería de ser como de 8 o 9 dígitos...
	activo VARCHAR(1),
	id_jefe VARCHAR(5),
	id_puesto SMALLINT,
	id_oficina VARCHAR(5),
	id_sexo VARCHAR(1),
	foreign key (id_jefe) references Empleado.id_empleado,
	foreign key (id_puesto) references Puesto.id_puesto,
	foreign key (id_oficina) references Oficina.id_oficina,
	foreign key (id_sexo) references Sexo.id_sexo
);

create table BoletaPago(
	id_boletapago SMALLINT primary key,
	periodo_pago VARCHAR(25),
	sueldo_neto DECIMAL(10,2),
	id_empleado VARCHAR(5),
	foreign key (id_empleado) references Empleado.id_empleado
);

create table BoletaPagoDescuento(
	id_boletapagosdescuento INT primary key,
	id_boletapago SMALLINT,
	id_tiposdescuentos VARCHAR(5),
	monto_descuento DECIMAL(11,2),
	foreign key (id_boletapago) references BoletaPago.id_boletapago,
	foreign key (id_tiposdescuentos) references TiposDescuentos.id_tiposdescuentos;
);

insert into Genero values(1, 'Masculino');
insert into Genero values(2, 'Femenino');