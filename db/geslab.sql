/*==============================================================*/
/* Table: FAENA                                                 */
/*==============================================================*/
create table FAENA (
   ID_FAENA             SERIAL not null,
   NOMBRE_FAENA         TEXT                 null,
   UBICACION_FAENA      TEXT                 null,
   constraint PK_FAENA primary key (ID_FAENA)
);

/*==============================================================*/
/* Table: HARDWARE                                              */
/*==============================================================*/
create table HARDWARE (
   ID_HARDWARE          SERIAL not null,
   ID_TIPOS             INT4                 null,
   SERIE_HARDWARE       TEXT               not null,
   ESTADO_HARDWARE      BOOL                 null,
   constraint PK_HARDWARE primary key (ID_HARDWARE)
);

/*==============================================================*/
/* Table: INSTALACION                                           */
/*==============================================================*/
create table INSTALACION (
   ID_INSTALACION       SERIAL not null,
   ID_FAENA             INT4                 not null,
   EQUIPO_INSTACION     TEXT                 not null,
   FECHA_INSTALACION    DATE                 null,
   COMENTARIO_INSTALACION TEXT                 null,
   constraint PK_INSTALACION primary key (ID_INSTALACION)
);

/*==============================================================*/
/* Table: RELATIONSHIP_3                                        */
/*==============================================================*/
create table RELATIONSHIP_3 (
   ID_HARDWARE          INT4                 not null,
   ID_INSTALACION       INT4                 not null,
   constraint PK_RELATIONSHIP_3 primary key (ID_HARDWARE, ID_INSTALACION)
);

/*==============================================================*/
/* Table: REPARACION                                            */
/*==============================================================*/
create table REPARACION (
   ID_REPARACION        SERIAL not null,
   ID_INSTALACION       INT4                 null,
   FECHA_REPARACION     DATE                 null, //*Fecha de inicio de reparacion*//
   COMENTARIO_REPARACION TEXT                null,
   ESTADO_REPARACION    TEXT                 null,
   constraint PK_REPARACION primary key (ID_REPARACION)
);

/*==============================================================*/
/* Table: REPORTE                                               */
/*==============================================================*/
create table REPORTE (
   ID_REPARACION        INT4                 not null,
   ID_HARDWARE          INT4                 not null,
   constraint PK_REPORTE primary key (ID_REPARACION, ID_HARDWARE)
);

/*==============================================================*/
/* Table: RESPUESTO                                             */
/*==============================================================*/
create table RESPUESTO (
   ID_RESPUESTO         SERIAL not null,
   ID_REPARACION        INT4                 not null,
   NOMBRE_RESPUESTO     TEXT                 null,
   CANTIDAD_RESPUESTO   FLOAT8               null,
   ESTADO_RESPUESTO     BOOL                 null,
   constraint PK_RESPUESTO primary key (ID_RESPUESTO)
);

/*==============================================================*/
/* Table: TIPOS                                                 */
/*==============================================================*/
create table TIPOS (
   ID_TIPOS             SERIAL not null,
   NOMBRE_TIPOS         TEXT                 null,
   TIPO_TIPOS           TEXT                 null,
   constraint PK_TIPOS primary key (ID_TIPOS)
);

/*==============================================================*/
/* Table: USUARIO                                               */
/*==============================================================*/
create table USUARIO (
   ID_USUARIO           SERIAL not null,
   ID_FAENA             INT4                 not null,
   ID_TIPOS             INT4                 null,
   NOMBRE_USUARIO       TEXT                 null,
   CORREO_USUARIO       TEXT                 not null,
   PASS_USUARIO         TEXT                 null,
   constraint PK_USUARIO primary key (ID_USUARIO)
);

alter table HARDWARE
   add constraint FK_HARDWARE_RELATIONS_TIPOS foreign key (ID_TIPOS)
      references TIPOS (ID_TIPOS)
      on delete restrict on update restrict;

alter table INSTALACION
   add constraint FK_INSTALAC_RELATIONS_FAENA foreign key (ID_FAENA)
      references FAENA (ID_FAENA)
      on delete restrict on update restrict;

alter table RELATIONSHIP_3
   add constraint FK_RELATION_RELATIONS_HARDWARE foreign key (ID_HARDWARE)
      references HARDWARE (ID_HARDWARE)
      on delete restrict on update restrict;

alter table RELATIONSHIP_3
   add constraint FK_RELATION_RELATIONS_INSTALAC foreign key (ID_INSTALACION)
      references INSTALACION (ID_INSTALACION)
      on delete restrict on update restrict;

alter table REPARACION
   add constraint FK_REPARACI_RELATIONS_INSTALAC foreign key (ID_INSTALACION)
      references INSTALACION (ID_INSTALACION)
      on delete restrict on update restrict;

alter table REPORTE
   add constraint FK_REPORTE_REPORTE_REPARACI foreign key (ID_REPARACION)
      references REPARACION (ID_REPARACION)
      on delete restrict on update restrict;

alter table REPORTE
   add constraint FK_REPORTE_REPORTE2_HARDWARE foreign key (ID_HARDWARE)
      references HARDWARE (ID_HARDWARE)
      on delete restrict on update restrict;

alter table RESPUESTO
   add constraint FK_RESPUEST_RELATIONS_REPARACI foreign key (ID_REPARACION)
      references REPARACION (ID_REPARACION)
      on delete restrict on update restrict;

alter table USUARIO
   add constraint FK_USUARIO_RELATIONS_FAENA foreign key (ID_FAENA)
      references FAENA (ID_FAENA)
      on delete restrict on update restrict;

alter table USUARIO
   add constraint FK_USUARIO_RELATIONS_TIPOS foreign key (ID_TIPOS)
      references TIPOS (ID_TIPOS)
      on delete restrict on update restrict;

