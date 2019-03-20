drop database if exists DBVangely;
create database if not exists DBVangely;

use DBVangely;
create table Usuario(
				id_usuario int NOT NULL AUTO_INCREMENT  primary key,
                nombre nvarchar(20),
                tipo_us varchar(1) 
                );
                
create table Tipo(
				id_tipo int(3) not null auto_increment primary key,
				Tipo varchar(20)
                );
                
insert into Tipo values (1,'correo');
insert into Tipo values (2,'celular');
insert into Tipo values (3,'correo-celular');

create table Contacto(
				id_contacto int(3) not null auto_increment primary key,
                id_tipo int(3),
                descripcion_correo varchar (25),
                descripcion_celular varchar (25),
                foreign key (id_tipo) references Tipo(id_tipo));
 
create table DireccionUsuario(
				id_direccion int NOT NULL AUTO_INCREMENT  primary key,
				calle varchar(30),
                n_exterior varchar(10),
                n_interior varchar (10),
                colonia varchar (25),
                cp varchar (5),
                delegacion varchar (20),
                estado varchar (25),
                id_usuario int,
                foreign key Direccion(id_usuario) references Usuario(id_usuario)); 
                
create table DireccionProveedor(
				id_direccion int NOT NULL AUTO_INCREMENT  primary key,
				calle varchar(30),
                n_exterior varchar(10),
                n_interior varchar (10),
                colonia varchar (25),
                cp varchar (5),
                delegacion varchar (20),
                estado varchar (25)
                );    
                
create table Cuenta(
				id_cuenta int NOT NULL AUTO_INCREMENT  primary key,
				Usser varchar(100),
                Pasword varchar(16),
                id_usuario int,
                foreign key Cuenta(id_usuario) references Usuario(id_usuario));



                
create table Ingredientes(
				id_ingre int NOT NULL AUTO_INCREMENT  primary key,
				ingrediente varchar(15),
                especial varchar (2)); 
                
create table Pedido(
				id_pedido int NOT NULL AUTO_INCREMENT  primary key,
				nomb_prod varchar(20),
                cantidad int(3),
                id_ingre int,
                precio float(3,2),
                total float(4,2),
                foreign key Pedido(id_ingre) references Ingredientes(id_ingre));
                
create table RelPedidoCliente(
				id_cuenta varchar (3),
				id_pedido int,
                f_solicit date,
                f_entrega date,
                hora_entre datetime,
                foreign key RelPedidoCliente(id_pedido) references Pedido(id_pedido));
                
create table Detalles(
				id_detalles int NOT NULL AUTO_INCREMENT  primary key,
                sabor varchar (20),
                forma varchar (20),
                tamanio varchar (10),
                ingred_esp int,
                foreign key Detalles(ingred_esp) references Ingredientes(id_ingre));

create table Producto(
				id int NOT NULL AUTO_INCREMENT  primary key,
				nomb_prod varchar(20),
                precio varchar(5),
                id_detalles int,
                foreign key Producto(id_detalles) references Detalles(id_detalles));

create table Descripcion(
				id_descrip int NOT NULL AUTO_INCREMENT  primary key,
				f_inicio date,
                f_termino date,
                porc_desc int(3));                 

create table Promociones(
				codigo int NOT NULL AUTO_INCREMENT  primary key,
				id_descrip int,
                term_cond varchar(50),
                foreign key Promociones(id_descrip) references Descripcion(id_descrip));                
                
create table RelProductoIngrediente(
				id int,
                id_ingre int);                
 
create table Empresa(
				id_empresa int NOT NULL AUTO_INCREMENT  primary key,
				nom_empresa varchar(20),
                rfc varchar (13),
                id_direccion int,
                foreign key Empresa(id_direccion) references DireccionProveedor(id_direccion)); 

create table Provedores(
				codigo int NOT NULL AUTO_INCREMENT  primary key,
				ingrediente int,
                precio varchar(15),
                id_empre int,
                id_contacto int,
                foreign key (ingrediente) references Ingredientes(id_ingre),
                foreign key (id_empre) references Empresa(id_empresa),
               foreign key (id_contacto) references Contacto(id_contacto));
create table RelUsuarioCto(
				id_usuario int(3),                
                id_contacto int(3),                
                foreign key (id_usuario) references Usuario(id_usuario),
                foreign key (id_contacto) references Contacto(id_contacto));	
               
select * from Tipo;
select * from Detalles;
select * from Producto;

insert into  usuario values(0,'ale','1');
insert into  usuario values(0,'Jul','2');

select * from cuenta;
insert into  cuenta values(0,'jul@gmail.com','12345',2);
insert into  cuenta values(0,'ale12orozco@gmail.com','1234',1);

select id_usuario, tipo_us from usuario where id_usuario in (select id_usuario from cuenta where Usser='ale12orozco@gmail.com'  and Pasword='1234'); 




                                
