/*==============================================================*/
/* Table: AGENTE                                                */
/*==============================================================*/
create table AGENTE (
   ID_AGENTE            INT4                 not null,
   ID_LUGARNACIMIENTO   INT4                 null,
   ID_ASEGURADORA       INT4                 null,
   NOMBRE_AGENTE        CHAR(20)             not null,
   APELLIDO_AGENTE      CHAR(20)             not null,
   CEDULA_AGENTE        CHAR(10)             not null,
   FECHANCTO_AGENTE     CHAR(45)             not null,
   TELEFONO_AGENTE      CHAR(10)             not null,
   DIRECCION_AGENTE     CHAR(45)             not null,
   INGRESOS_ASEGURADO   CHAR(20)             not null,
   constraint PK_AGENTE primary key (ID_AGENTE)
);

/*==============================================================*/
/* Index: AGENTE_PK                                             */
/*==============================================================*/
create unique index AGENTE_PK on AGENTE (
ID_AGENTE
);

/*==============================================================*/
/* Index: RELATIONSHIP_5_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_5_FK on AGENTE (
ID_LUGARNACIMIENTO
);

/*==============================================================*/
/* Index: RELATIONSHIP_15_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_15_FK on AGENTE (
ID_ASEGURADORA
);

/*==============================================================*/
/* Table: ASEGURADO                                             */
/*==============================================================*/
create table ASEGURADO (
   ID_ASEGURADO         INT4                 not null,
   ID_LUGARNACIMIENTO   INT4                 null,
   ID_SEGURO_CONTRATO   INT4                 null,
   NOMBRE_ASEGURADO     CHAR(20)             not null,
   APELLIDO_ASEGURADO   CHAR(20)             not null,
   CEDULA_ASEGURADO     CHAR(10)             not null,
   FECHANCTO_ASEGURADO  CHAR(45)             not null,
   TELEFONO_ASEGURADO   CHAR(10)             not null,
   DIRECCION_ASEGURADO  CHAR(45)             not null,
   OCUPACION_ASEGURADO  CHAR(20)             not null,
   INGRESOS_ASEGURADO   NUMERIC(6)           not null,
   TPOSANGRE_ASEGURADO  CHAR(4)              not null,
   ESTADOSALUD_ASEGURADO CHAR(10)             not null,
   constraint PK_ASEGURADO primary key (ID_ASEGURADO)
);

/*==============================================================*/
/* Index: ASEGURADO_PK                                          */
/*==============================================================*/
create unique index ASEGURADO_PK on ASEGURADO (
ID_ASEGURADO
);

/*==============================================================*/
/* Index: TIENE_FK                                              */
/*==============================================================*/
create  index TIENE_FK on ASEGURADO (
ID_LUGARNACIMIENTO
);

/*==============================================================*/
/* Index: RELATIONSHIP_12_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_12_FK on ASEGURADO (
ID_SEGURO_CONTRATO
);

/*==============================================================*/
/* Table: ASEGURADORA                                           */
/*==============================================================*/
create table ASEGURADORA (
   ID_ASEGURADORA       INT4                 not null,
   NOMBRE_ASEGURADORA   CHAR(20)             not null,
   constraint PK_ASEGURADORA primary key (ID_ASEGURADORA)
);

/*==============================================================*/
/* Index: ASEGURADORA_PK                                        */
/*==============================================================*/
create unique index ASEGURADORA_PK on ASEGURADORA (
ID_ASEGURADORA
);

/*==============================================================*/
/* Table: BENEFICIARIO                                          */
/*==============================================================*/
create table BENEFICIARIO (
   ID_BENEFICIARIO      INT4                 not null,
   ID_LUGARNACIMIENTO   INT4                 null,
   ID_ASEGURADO         INT4                 null,
   NOMBRE_BENEFICIARIO  CHAR(20)             not null,
   APELLIDO_BENEFICIARIO CHAR(20)             not null,
   CEDULA_BENEFICIARIO  CHAR(10)             not null,
   FECHANCTO_BENEFICIARIO CHAR(45)             not null,
   TELEFONO_BENEFICIARIO CHAR(10)             not null,
   DIRECCION_BENEFICIARIO CHAR(45)             not null,
   OCUPACION_BENEFICIARIO CHAR(20)             not null,
   INGRESOS_BENEFICIARIO NUMERIC(6)           not null,
   TIPOSANGRE_BENEFICIARIO CHAR(4)              not null,
   NUMCUENTA_BENEFICIARIO CHAR(10)             not null,
   constraint PK_BENEFICIARIO primary key (ID_BENEFICIARIO)
);

/*==============================================================*/
/* Index: BENEFICIARIO_PK                                       */
/*==============================================================*/
create unique index BENEFICIARIO_PK on BENEFICIARIO (
ID_BENEFICIARIO
);

/*==============================================================*/
/* Index: RELATIONSHIP_6_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_6_FK on BENEFICIARIO (
ID_LUGARNACIMIENTO
);

/*==============================================================*/
/* Index: RELATIONSHIP_7_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_7_FK on BENEFICIARIO (
ID_ASEGURADO
);

/*==============================================================*/
/* Table: COBRO_DE_POLIZA                                       */
/*==============================================================*/
create table COBRO_DE_POLIZA (
   ID_COBRO_DE_POLIZA   INT4                 not null,
   ID_BENEFICIARIO      INT4                 null,
   ID_ASEGURADORA       INT4                 null,
   VALOR_COBRAR         NUMERIC              not null,
   FECHA_COBRO          DATE                 not null,
   constraint PK_COBRO_DE_POLIZA primary key (ID_COBRO_DE_POLIZA)
);

/*==============================================================*/
/* Index: COBRO_DE_POLIZA_PK                                    */
/*==============================================================*/
create unique index COBRO_DE_POLIZA_PK on COBRO_DE_POLIZA (
ID_COBRO_DE_POLIZA
);

/*==============================================================*/
/* Index: RELATIONSHIP_10_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_10_FK on COBRO_DE_POLIZA (
ID_BENEFICIARIO
);

/*==============================================================*/
/* Index: RELATIONSHIP_16_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_16_FK on COBRO_DE_POLIZA (
ID_ASEGURADORA
);

/*==============================================================*/
/* Table: FACTURA_PAGO                                          */
/*==============================================================*/
create table FACTURA_PAGO (
   NUM_FACTURA          INT4                 not null,
   ID_ASEGURADO         INT4                 null,
   ID_METODOPAGO        INT4                 null,
   FECHA_FACTURA        DATE                 not null,
   constraint PK_FACTURA_PAGO primary key (NUM_FACTURA)
);

/*==============================================================*/
/* Index: FACTURA_PAGO_PK                                       */
/*==============================================================*/
create unique index FACTURA_PAGO_PK on FACTURA_PAGO (
NUM_FACTURA
);

/*==============================================================*/
/* Index: RELATIONSHIP_8_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_8_FK on FACTURA_PAGO (
ID_ASEGURADO
);

/*==============================================================*/
/* Index: RELATIONSHIP_9_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_9_FK on FACTURA_PAGO (
ID_METODOPAGO
);

/*==============================================================*/
/* Table: LUGAR_NACIMIENTO                                      */
/*==============================================================*/
create table LUGAR_NACIMIENTO (
   ID_LUGARNACIMIENTO   INT4                 not null,
   CIUDAD               CHAR(20)             not null,
   PROVINCIA            CHAR(20)             not null,
   PAIS                 CHAR(20)             not null,
   constraint PK_LUGAR_NACIMIENTO primary key (ID_LUGARNACIMIENTO)
);

/*==============================================================*/
/* Index: LUGAR_NACIMIENTO_PK                                   */
/*==============================================================*/
create unique index LUGAR_NACIMIENTO_PK on LUGAR_NACIMIENTO (
ID_LUGARNACIMIENTO
);

/*==============================================================*/
/* Table: METODO_PAGO                                           */
/*==============================================================*/
create table METODO_PAGO (
   ID_METODOPAGO        INT4                 not null,
   FORMA_PAGO           CHAR(40)             not null,
   constraint PK_METODO_PAGO primary key (ID_METODOPAGO)
);

/*==============================================================*/
/* Index: METODO_PAGO_PK                                        */
/*==============================================================*/
create unique index METODO_PAGO_PK on METODO_PAGO (
ID_METODOPAGO
);

/*==============================================================*/
/* Table: RETIRO_CONTRATO                                       */
/*==============================================================*/
create table RETIRO_CONTRATO (
   ID_RETIRO_CONTRATO   INT4                 not null,
   ID_SEGURO_CONTRATO   INT4                 null,
   ID_ASEGURADO         INT4                 null,
   VALORCANCELACION_CONTRATO NUMERIC              not null,
   FECHA_RETIRO_CONTRATO DATE                 not null,
   constraint PK_RETIRO_CONTRATO primary key (ID_RETIRO_CONTRATO)
);

/*==============================================================*/
/* Index: RETIRO_CONTRATO_PK                                    */
/*==============================================================*/
create unique index RETIRO_CONTRATO_PK on RETIRO_CONTRATO (
ID_RETIRO_CONTRATO
);

/*==============================================================*/
/* Index: RELATIONSHIP_17_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_17_FK on RETIRO_CONTRATO (
ID_SEGURO_CONTRATO
);

/*==============================================================*/
/* Index: RELATIONSHIP_18_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_18_FK on RETIRO_CONTRATO (
ID_ASEGURADO
);

/*==============================================================*/
/* Table: SEGURO_CONTRATO                                       */
/*==============================================================*/
create table SEGURO_CONTRATO (
   ID_SEGURO_CONTRATO   INT4                 not null,
   ID_TIPOSEGURO        INT4                 null,
   DESCRIPCION_SEGURO_CONTRATO CHAR(60)             not null,
   constraint PK_SEGURO_CONTRATO primary key (ID_SEGURO_CONTRATO)
);

/*==============================================================*/
/* Index: SEGURO_CONTRATO_PK                                    */
/*==============================================================*/
create unique index SEGURO_CONTRATO_PK on SEGURO_CONTRATO (
ID_SEGURO_CONTRATO
);

/*==============================================================*/
/* Index: RELATIONSHIP_11_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_11_FK on SEGURO_CONTRATO (
ID_TIPOSEGURO
);

/*==============================================================*/
/* Table: TIPO_SEGURO                                           */
/*==============================================================*/
create table TIPO_SEGURO (
   ID_TIPOSEGURO        INT4                 not null,
   NOMBRE_TIPOSEGURO    CHAR(20)             not null,
   TIEMPO_TIPOSEGURO    CHAR(20)             not null,
   COSTO_TIPOSEGURO     NUMERIC(4)           not null,
   constraint PK_TIPO_SEGURO primary key (ID_TIPOSEGURO)
);

/*==============================================================*/
/* Index: TIPO_SEGURO_PK                                        */
/*==============================================================*/
create unique index TIPO_SEGURO_PK on TIPO_SEGURO (
ID_TIPOSEGURO
);

/*==============================================================*/
/* Table: VENTAS                                                */
/*==============================================================*/
create table VENTAS (
   ID_VENTAS            INT4                 not null,
   ID_AGENTE            INT4                 null,
   ID_ASEGURADO         INT4                 null,
   FECHA_VENTA          DATE                 not null,
   constraint PK_VENTAS primary key (ID_VENTAS)
);

/*==============================================================*/
/* Index: VENTAS_PK                                             */
/*==============================================================*/
create unique index VENTAS_PK on VENTAS (
ID_VENTAS
);

/*==============================================================*/
/* Index: RELATIONSHIP_13_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_13_FK on VENTAS (
ID_AGENTE
);

/*==============================================================*/
/* Index: RELATIONSHIP_14_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_14_FK on VENTAS (
ID_ASEGURADO
);

alter table AGENTE
   add constraint FK_AGENTE_RELATIONS_ASEGURAD foreign key (ID_ASEGURADORA)
      references ASEGURADORA (ID_ASEGURADORA)
      on delete restrict on update restrict;

alter table AGENTE
   add constraint FK_AGENTE_RELATIONS_LUGAR_NA foreign key (ID_LUGARNACIMIENTO)
      references LUGAR_NACIMIENTO (ID_LUGARNACIMIENTO)
      on delete restrict on update restrict;

alter table ASEGURADO
   add constraint FK_ASEGURAD_RELATIONS_SEGURO_C foreign key (ID_SEGURO_CONTRATO)
      references SEGURO_CONTRATO (ID_SEGURO_CONTRATO)
      on delete restrict on update restrict;

alter table ASEGURADO
   add constraint FK_ASEGURAD_RELATIONS_LUGAR_NA foreign key (ID_LUGARNACIMIENTO)
      references LUGAR_NACIMIENTO (ID_LUGARNACIMIENTO)
      on delete restrict on update restrict;

alter table BENEFICIARIO
   add constraint FK_BENEFICI_RELATIONS_LUGAR_NA foreign key (ID_LUGARNACIMIENTO)
      references LUGAR_NACIMIENTO (ID_LUGARNACIMIENTO)
      on delete restrict on update restrict;

alter table BENEFICIARIO
   add constraint FK_BENEFICI_RELATIONS_ASEGURAD foreign key (ID_ASEGURADO)
      references ASEGURADO (ID_ASEGURADO)
      on delete restrict on update restrict;

alter table COBRO_DE_POLIZA
   add constraint FK_COBRO_DE_RELATIONS_BENEFICI foreign key (ID_BENEFICIARIO)
      references BENEFICIARIO (ID_BENEFICIARIO)
      on delete restrict on update restrict;

alter table COBRO_DE_POLIZA
   add constraint FK_COBRO_DE_RELATIONS_ASEGURAD foreign key (ID_ASEGURADORA)
      references ASEGURADORA (ID_ASEGURADORA)
      on delete restrict on update restrict;

alter table FACTURA_PAGO
   add constraint FK_FACTURA__RELATIONS_ASEGURAD foreign key (ID_ASEGURADO)
      references ASEGURADO (ID_ASEGURADO)
      on delete restrict on update restrict;

alter table FACTURA_PAGO
   add constraint FK_FACTURA__RELATIONS_METODO_P foreign key (ID_METODOPAGO)
      references METODO_PAGO (ID_METODOPAGO)
      on delete restrict on update restrict;

alter table RETIRO_CONTRATO
   add constraint FK_RETIRO_C_RELATIONS_SEGURO_C foreign key (ID_SEGURO_CONTRATO)
      references SEGURO_CONTRATO (ID_SEGURO_CONTRATO)
      on delete restrict on update restrict;

alter table RETIRO_CONTRATO
   add constraint FK_RETIRO_C_RELATIONS_ASEGURAD foreign key (ID_ASEGURADO)
      references ASEGURADO (ID_ASEGURADO)
      on delete restrict on update restrict;

alter table SEGURO_CONTRATO
   add constraint FK_SEGURO_C_RELATIONS_TIPO_SEG foreign key (ID_TIPOSEGURO)
      references TIPO_SEGURO (ID_TIPOSEGURO)
      on delete restrict on update restrict;

alter table VENTAS
   add constraint FK_VENTAS_RELATIONS_AGENTE foreign key (ID_AGENTE)
      references AGENTE (ID_AGENTE)
      on delete restrict on update restrict;

alter table VENTAS
   add constraint FK_VENTAS_RELATIONS_ASEGURAD foreign key (ID_ASEGURADO)
      references ASEGURADO (ID_ASEGURADO)
      on delete restrict on update restrict;
	  
	  
	  
--INSERTO VALORES

--Inserción en la tabla Lugar de Nacimiento (IdLugarNac, Ciudad, Provincia, País)
insert into Lugar_Nacimiento values ('1','Manta', 'Manabí', 'Ecuador');
insert into Lugar_Nacimiento values ('2','Machala', 'El Oro', 'Ecuador');
insert into Lugar_Nacimiento values ('3','Cuenca', 'Azuay', 'Ecuador');
insert into Lugar_Nacimiento values ('4','Guayaquil', 'Guayas', 'Ecuador');
insert into Lugar_Nacimiento values ('5','Quito', 'Pichincha', 'Ecuador');

--Inserción en la tabla Tipo_Seguro (IdTipoSeguro, NombreTipoSeguro, TiempoSeguro, CostoTiposeguro)
insert into Tipo_Seguro values ('1','Término nivelado', '30 años', '220');
insert into Tipo_Seguro values ('2','Permanente tipico', 'Hasta Morir', '360');

--Inserción en la tabla Seguro_Contrato (IdSeguroContrato, IdTipoSeguro, DescripcionSeguroContrato)
insert into Seguro_Contrato values ('1','1', 'Seguro con duración de 30 años');
insert into Seguro_Contrato values ('2','2', 'Seguro indefinido hasta que muera la persona');

--Inserción en la tabla Aseguradora 
insert into Aseguradora values ('1','LIFE SAFE');

--Inserción en la tabla Asegurado (IdAsegurado, IdLugarNacimiento, IdSeguroContrato, Nombre, Apellido, Cedula, FechaNac, Telefono, Direccion, Ocupacion, Ingresos, TipoSangre, EstadoSalud)  
insert into Asegurado values ('1','1', '1', 'Giusepy', 'Calle', '1316264884', '07 de Marzo del 2002', '0998748635', 'calle 16 av 14', 'Estudiante', '20', 'B+', 'Bueno');
insert into Asegurado values ('2','2', '1', 'Milton', 'Rivadeneira', '1315928473', '01 de Abril de 1980', '0987924354', 'Av Flavio Reyes', 'Ingeniero', '2000', 'O+', 'Bueno');
insert into Asegurado values ('3','3', '2', 'Ricky', 'Suarez', '1314394837', '11 de Septiembre 1989', '0977928573', 'Av Circunvalación', 'Ingeniero', '2500', 'O+', 'Bueno');
insert into Asegurado values ('4','4', '2', 'Roberto', 'Martínez', '1313294824', '31 de Mayo de 1995', '0701933386', 'Av El Paraíso', 'Biologo', '1500', 'B+', 'Bueno');
insert into Asegurado values ('5','5', '2', 'Ramón', 'Rosero', '1312485753', '23 de Julio de 1979', '0701193850', 'Ciudad del Sol', 'Psicólogo', '1500', 'AB+', 'Bueno');
insert into Asegurado values ('6','1', '1', 'Nicole', 'Santana', '1313249703', '4 de Noviembre de 1997', '0999372947', 'Calle 100 av 23', 'Comerciante', '800', 'B-', 'Regular');
insert into Asegurado values ('7','4', '2', 'Antonella', 'Macías', '1317241093', '17 de Febrero de 1994', '0997678987', 'Calle 14 av 21', 'Diseñadora Moda', '1400', 'B-', 'Malo');
insert into Asegurado values ('8','2', '1', 'María', 'Vargas', '1316476765', '13 de Julio de 1996', '0997282473', 'Calle 399 av 250', 'Secretaria', '1200', 'O+', 'Bueno');
insert into Asegurado values ('9','5', '2', 'Ernesto', 'Fajardo', '1315827492', '27 de Mayo de 1998', '0989307683', 'Calle 23 av 12', 'Albañil', '600', 'O+', 'Bueno');
insert into Asegurado values ('10','1', '1', 'Paco', 'Briones', '1323059382', '09 de Septiembre de 1994', '0912342437', 'Avenida Malecon', 'Reportero', '1000', 'O+', 'Bueno');
insert into Asegurado values ('11','2', '2', 'Gabo', 'Alcívar', '1324212232', '02 de Julio de 1999', '0923920385', 'Los Esteros', 'Policia', '800', 'O+', 'Bueno');
insert into Asegurado values ('12','2', '2', 'Jared', 'Figueroa', '1300998538', '10 de Marzo de 1994', '0902112434', 'Tarqui', 'Futbolista', '4000', 'O+', 'Bueno');


--Inserción en la tabla Beneficiario (IdBeneficiario, IdLugarNacimiento, IdAsegurado, Nombre, Apellido, Cedula, FechaNac, Telefono, Direccion, Ocupacion, Ingresos, TipoSangre, NumCuenta)  
insert into Beneficiario values ('1','1', '1', 'Fernando', 'Calle', '1316268923', '02 de Febrero del 2002', '0998748211', 'calle 16 av 14', 'Odontólogo', '2000', 'B+', '1000000001');
insert into Beneficiario values ('2','2', '2', 'Juana', 'Rivadeneira', '1131502749', '12 de Marzo de 1999', '0990767649', 'Av Flavio Reyes', 'Profesora', '1400', 'B+', '1000000002');
insert into Beneficiario values ('3','3', '3', 'Rocío', 'Suarez', '1310097290', '6 de Mayo 2000', '0991213976', 'Av Circunvalación', 'Pediatra', '1800', 'O+', '1000000003');
insert into Beneficiario values ('4','4', '4', 'Rosaura', 'Martínez', '1313049373', '1 de Julio de 1999', '0990699543', 'Av El Paraíso', 'Abogada', '1500', 'B+', '1000000004');
insert into Beneficiario values ('5','5', '5', 'Rafael', 'Rosero', '1314302847', '13 de Julio de 1982', '0901193740', 'Ciudad del Sol', 'Economista', '1200', 'AB+', '1000000005');
insert into Beneficiario values ('6','1', '6', 'Pedro', 'Santana', '1360294823', '4 de Enero de 2000', '0909976073', 'Calle 100 av 23', 'Licenciado', '1000', 'B-', '1000000006');
insert into Beneficiario values ('7','3', '7', 'Mariana', 'Macías', '1311395835', '1 de Junio de 1997', '0982163212', 'Calle 14 av 21', 'Contadora', '900', 'B-', '1000000007');
insert into Beneficiario values ('8','2', '8', 'Carla', 'Vargas', '1334324800', '10 de Agosto de 1998', '0938597394', 'Calle 399 av 250', 'Fisioterapista', '1200', 'O+', '1000000008');
insert into Beneficiario values ('9','3', '9', 'Damián', 'Fajardo', '1376860363', '6 de Abril de 1999', '0997602156', 'Calle 23 av 12', 'Futbolista', '3000', 'O+', '1000000009');
insert into Beneficiario values ('10','3', '10', 'Alison', 'Briones', '1314752148', '11 de Noviembre de 1998', '0934547804', 'Avenida Malecon', 'Psicóloga', '1200', 'B-', '1000000010');
insert into Beneficiario values ('11','4', '11', 'Paula', 'Quiñonez', '1349212194', '8 de Mayo de 1994', '0949503753', 'Avenida Yorky', 'Escritora', '800', '0+', '1000000011');
insert into Beneficiario values ('12','5', '12', 'Renso', 'Quijije', '1323249100', '21 de Julio de 2000', '0998950503', 'San Juan de Manta', 'Ingeniero', '3000', '0+', '1000000012');


--Inserción en la tabla Agente (IdAgente, IdLugarNacimiento, IdAseguradora, Nombre, Apellido, Cedula, FechaNac, Telefono, Direccion, FechaContrato)  
insert into Agente values ('1','1', '1', 'Gregorio', 'Perez', '1318305835', '18 Mayo de 1983', '0992836232', 'calle 12 av 27', '1 Marzo de 2020');
insert into Agente values ('2','5', '1', 'Daniel', 'Bravo', '1318003739', '1 Julio de 1987', '0907292734', 'calle 19 av 18', '1 Marzo de 2020');

--Inserción en la tabla Metodo_Pago (IdMetodoPago, Forma_Pago)
insert into Metodo_Pago values ('1','Efectivo');
insert into Metodo_Pago values ('2','Transferencia');
insert into Metodo_Pago values ('3','Tarjeta de Crédito');
insert into Metodo_Pago values ('4','Tarjeta de Débito');

--Inserción en la tabla Ventas (IdVentas, IdAgente, IdAsegurado, FechaVenta)
insert into Ventas values ('1','1', '1', '01/04/2020');
insert into Ventas values ('2','2', '2', '11/04/2020');
insert into Ventas values ('3','1', '3', '04/05/2020');
insert into Ventas values ('4','2', '4', '10/05/2020');
insert into Ventas values ('5','1', '5', '17/08/2020');
insert into Ventas values ('6','1', '6', '23/02/2021');
insert into Ventas values ('7','2', '7', '12/09/2021');
insert into Ventas values ('8','2', '8', '08/11/2021');
insert into Ventas values ('9','2', '9', '28/05/2022');
insert into Ventas values ('10','1', '10', '20/12/2022');
insert into Ventas values ('11','1', '11', '25/12/2022');
insert into Ventas values ('12','1', '12', '28/12/2022');



--Inserción en la tabla Factura_Pago (NumFactura, IdAsegurado, IdMetodoPago, FechaFactura)
insert into Factura_Pago values ('1','1', '1', '01/05/2020');
insert into Factura_Pago values ('2','1', '1', '01/06/2020');
insert into Factura_Pago values ('3','2', '3', '11/05/2020');
insert into Factura_Pago values ('4','2', '3', '11/06/2020');
insert into Factura_Pago values ('5','3', '2', '04/06/2020');
insert into Factura_Pago values ('6','3', '2', '04/07/2020');
insert into Factura_Pago values ('7','4', '4', '10/06/2020');
insert into Factura_Pago values ('8','4', '4', '10/07/2020');
insert into Factura_Pago values ('9','5', '2', '17/09/2020');
insert into Factura_Pago values ('10','5', '2', '17/10/2020');
insert into Factura_Pago values ('11','6', '1', '23/09/2020');
insert into Factura_Pago values ('12','6', '1', '23/10/2020');
insert into Factura_Pago values ('13','7', '3', '12/10/2021');
insert into Factura_Pago values ('14','7', '3', '12/11/2021');
insert into Factura_Pago values ('15','8', '4', '08/12/2021');
insert into Factura_Pago values ('16','8', '4', '08/01/2022');
insert into Factura_Pago values ('17','9', '1', '28/06/2021');
insert into Factura_Pago values ('18','9', '1', '28/07/2021');
insert into Factura_Pago values ('19','10', '3', '20/01/2023');
insert into Factura_Pago values ('20','10', '3', '20/02/2023');
insert into Factura_Pago values ('21','11', '3', '25/01/2023');
insert into Factura_Pago values ('22','11', '3', '25/02/2023');
insert into Factura_Pago values ('23','12', '2', '28/01/2023');
insert into Factura_Pago values ('24','12', '2', '28/02/2023');


--Inserción en la tabla Retiro_Contrato (IdRetiroContrato, IdSeguroContrato, IdAsegurado, ValorCancelacionContrato, Fecha_retiroContrato)
insert into Retiro_Contrato values ('1','2', '4', '600', '2022/02/10');
insert into Retiro_Contrato values ('2','2', '5', '600', '2022/04/23');
insert into Retiro_Contrato values ('3','2', '6', '600', '2023/11/18');
insert into Retiro_Contrato values ('4','1', '7', '300', '2023/03/07');


--Inserción en la tabla Cobro_De_Poliza (IdCobroDePoliza, IdBeneficiario, IdAseguradora, ValorCobrar, FechaCobro)
insert into Cobro_de_Poliza values ('1','1', '1', '15000', '20/10/2042');
insert into Cobro_de_Poliza values ('2','2', '1', '20000', '15/10/2045');
insert into Cobro_de_Poliza values ('3','3', '1', '22000', '03/11/2042');
insert into Cobro_de_Poliza values ('4','4', '1', '22000', '19/03/2042');
insert into Cobro_de_Poliza values ('5','5', '1', '30000', '18/01/2045');



--CONSULTAS
--1ra Consulta
Select Nombre_Asegurado as "Asegurado", Tipo_Seguro.Id_TipoSeguro as "Id de Plan de Seguro de Vida", Tipo_Seguro.Nombre_TipoSeguro as "Plan de Seguro de Vida", Tipo_Seguro.Costo_TipoSeguro as "Precio" 
From Asegurado 
inner join Seguro_Contrato on Asegurado.Id_Seguro_Contrato = Seguro_Contrato.Id_Seguro_Contrato
inner join Tipo_Seguro on Seguro_Contrato.Id_TipoSeguro = Tipo_Seguro.Id_TipoSeguro
where Tipo_Seguro.Id_TipoSeguro = '2';

--2da Consulta
Select Nombre_Agente as "Agente", Id_Ventas as "Código de Venta", Nombre_Asegurado as "Asegurado", Fecha_Venta as "Fecha de la Venta", Nombre_TipoSeguro as "Plan de Seguro de Vida", Costo_TipoSeguro as "Valor del Plan de Seguro"
From Asegurado
inner join Seguro_Contrato on Asegurado.Id_Seguro_Contrato = Seguro_Contrato.Id_Seguro_Contrato
inner join Tipo_Seguro on Seguro_Contrato.Id_TipoSeguro = Tipo_Seguro.Id_TipoSeguro
inner join Ventas on Asegurado.Id_Asegurado = Ventas.Id_Asegurado
inner join Agente on Ventas.Id_Agente = Agente.Id_Agente
where Agente.Id_Agente = '1'and Tipo_Seguro.Id_TipoSeguro = '1';



--3ra Consulta
Select Nombre_Aseguradora as "Aseguradora", Aseguradora.Id_Aseguradora as "Código de Aseguradora", Valor_Cobrar as "Pago a los Beneficiarios", Fecha_Cobro as "Fecha de Pago"
From Aseguradora
inner join Cobro_De_Poliza on Aseguradora.Id_Aseguradora = Cobro_De_Poliza.Id_Aseguradora
where Fecha_Cobro BETWEEN '2042-01-01'::DATE AND '2042-12-31'::DATE


--4ta Consulta
Select Nombre_Asegurado as "Asegurado", Fecha_Retiro_Contrato as "Fecha de Retiro de Contrato", Nombre_TipoSeguro as "Plan de Seguro de Vida", ValorCancelacion_Contrato as "Costo de cancelación de contrato"
From Retiro_Contrato
inner join Seguro_Contrato on Retiro_Contrato.Id_Seguro_Contrato = Seguro_Contrato.Id_Seguro_Contrato
inner join Tipo_Seguro on Seguro_Contrato.Id_TipoSeguro = Tipo_Seguro.Id_TipoSeguro
inner join Asegurado on Retiro_Contrato.Id_Asegurado = Asegurado.Id_Asegurado
where Fecha_Retiro_Contrato BETWEEN '2022-01-01'::DATE AND '2022-12-31'::DATE --and  Retiro_Contrato.Id_Asegurado = Asegurado.Id_Asegurado 



--Trigger
create or replace function TR_RETIRO () RETURNS TRIGGER 
as 
$$
declare
		ID_R int ;
		R1 int; 
begin
   select count (*) into ID_R from Retiro_Contrato
   where Id_Asegurado = Id_Asegurado;
   select Id_Asegurado into R1 from  Retiro_Contrato where Id_Asegurado = new.Id_Asegurado ;
   if (ID_R>1)then 
   raise notice 'UN ASEGURADO NO PUEDE RETIRAR EL CONTRATO DOS VECES';
   raise exception 'EL ASEGURADO YA HA REALIZADO EL RETIRO DEL CONTRATO ANTERIORMENTE';
   END IF; 
   return new;
end;
$$
language plpgsql;

CREATE TRIGGER TR_RETIRO  BEFORE  INSERT
 ON Retiro_Contrato FOR EACH ROW 
 EXECUTE PROCEDURE TR_RETIRO ();

--Inserción en la tabla Retiro_Contrato
insert into Retiro_Contrato values ('1','2', '4', '600', '2022/02/10');


--Creación del cursor
DO $$
DECLARE                                              
	  CONSULTA RECORD;
	  TABLA CURSOR FOR 
		Select Nombre_Agente as Agente, Id_Ventas as CodigoVenta, Nombre_Asegurado as Asegurado, Fecha_Venta as FechaVenta, Nombre_TipoSeguro as PlanSeguroVida, Costo_TipoSeguro as ValorPlanSeguro
		From Asegurado
		inner join Seguro_Contrato on Asegurado.Id_Seguro_Contrato = Seguro_Contrato.Id_Seguro_Contrato
		inner join Tipo_Seguro on Seguro_Contrato.Id_TipoSeguro = Tipo_Seguro.Id_TipoSeguro
		inner join Ventas on Asegurado.Id_Asegurado = Ventas.Id_Asegurado
		inner join Agente on Ventas.Id_Agente = Agente.Id_Agente
		ORDER BY Agente.Nombre_Agente, Id_Ventas ASC;

BEGIN
OPEN TABLA;
FETCH TABLA INTO CONSULTA;
WHILE(FOUND)LOOP
RAISE NOTICE 'NOMBRE_AGENTE: %   Codigo_De_Venta:%  Nombre_Asegurado:% Fecha_de_Venta:%  Plan_Seguro_Vida:%  Valor_Plan_Seguro:%',
	CONSULTA.Agente,
	CONSULTA.CodigoVenta,
    CONSULTA.Asegurado,
    CONSULTA.FechaVenta,
    CONSULTA.PlanSeguroVida,
	CONSULTA.ValorPlanSeguro;
FETCH TABLA INTO CONSULTA;
END LOOP;
END $$
LANGUAGE PLPGSQL; 



--STORE PROCEDURE
CREATE OR REPLACE FUNCTION public."PAGO_POLIZA_ANUAL"(
	"idaseguradora" integer)
    RETURNS integer
    LANGUAGE 'plpgsql'
    
AS $BODY$
declare  suma numeric;

begin
    select  sum(valor_cobrar) into   suma  from Cobro_De_Poliza  
    where id_aseguradora = idaseguradora;
    
    return suma ;
end;
$BODY$;

ALTER FUNCTION public."PAGO_POLIZA_ANUAL"(integer)
    OWNER TO postgres;

select "PAGO_POLIZA_ANUAL"(1)


--CONSULTA PARA IREPORT
Select Nombre_Agente as "Agente", count (Ventas.Id_Ventas) as "Cantidad de Planes Vendidos"
From Agente
inner join Ventas on Ventas.Id_Agente = Agente.Id_Agente
group by Agente.Nombre_Agente;


Select * FROM Cobro_De_Poliza
Select * FROM seguro_contrato
Select * FROM ventas
Select * FROM Asegurado
Select * FROM Retiro_Contrato

