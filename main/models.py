# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from __future__ import unicode_literals
from django.contrib import admin
from django.db import models
from django.core.urlresolvers import reverse


class Actividade(models.Model):
    cod_actividad = models.AutoField(primary_key=True)
    actividad = models.CharField(max_length=50, blank=True, null=True)
    duracion = models.FloatField(blank=True, null=True)
    creado = models.DateTimeField()
    modificado = models.DateTimeField()
    def __unicode__(self):
        return str(self.actividad)
    class Meta:
        managed = False
        db_table = 'Actividade'


class Aprobacione(models.Model):
    cod_ok = models.IntegerField(primary_key=True)
    nombre = models.CharField(max_length=45, blank=True, null=True)
    creado = models.DateTimeField()
    modificado = models.DateTimeField()
    def __unicode__(self):
        return str(self.nombre)
    class Meta:
        managed = False
        db_table = 'Aprobacione'


class Asignacione(models.Model):
    cod_asignacion = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=45, blank=True, null=True)
    creado = models.DateTimeField()
    modificado = models.DateTimeField()
    def __unicode__(self):
        return str(self.nombre)
    class Meta:
        managed = False
        db_table = 'Asignacione'


class Atp(models.Model):
    cod_atp = models.AutoField(primary_key=True)
    cod_po = models.ForeignKey('Po', models.DO_NOTHING, db_column='cod_po', blank=True, null=True)
    cod_station = models.ForeignKey('Estacione', models.DO_NOTHING, db_column='cod_station', blank=True, null=True)
    creado = models.DateTimeField()
    modificado = models.DateTimeField()
    def __unicode__(self):
        return str(self.cod_station)
    class Meta:
        managed = False
        db_table = 'Atp'


class Ciudade(models.Model):
    cod_ciudad = models.AutoField(primary_key=True)
    provincia = models.CharField(max_length=45, blank=True, null=True)
    region = models.ForeignKey('Regione', models.DO_NOTHING, db_column='region', blank=True, null=True)
    nombre = models.CharField(max_length=45, blank=True, null=True)
    creado = models.DateTimeField()
    modificado = models.DateTimeField()
    def __unicode__(self):
        return str(self.nombre)
    class Meta:
        managed = False
        db_table = 'Ciudade'


class Contratista(models.Model):
    cod_contratista = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=45, blank=True, null=True)
    region = models.ForeignKey(Ciudade, models.DO_NOTHING, db_column='region', blank=True, null=True)
    creado = models.DateTimeField()
    modificado = models.DateTimeField()
    def __unicode__(self):
        return str(self.nombre)
    class Meta:
        managed = False
        db_table = 'Contratista'


class Diseno(models.Model):
    cod_diseno = models.AutoField(primary_key=True)
    cod_po = models.ForeignKey('Po', models.DO_NOTHING, db_column='cod_po')
    cod_contratista = models.ForeignKey(Contratista, models.DO_NOTHING, db_column='cod_contratista')
    cod_station = models.ForeignKey('Estacione', models.DO_NOTHING, db_column='cod_station')
    nombre = models.CharField(max_length=45, blank=True, null=True)
    creado = models.DateTimeField()
    modificado = models.DateTimeField()
    def __unicode__(self):
        return str(self.nombre)
    class Meta:
        managed = False
        db_table = 'Diseno'


class Entregable(models.Model):
    cod_entregable = models.AutoField(primary_key=True)
    tipo_entregable = models.CharField(max_length=45, blank=True, null=True)
    creado = models.DateTimeField()
    modificado = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'Entregable'


class Estacione(models.Model):
    cod_station = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=45)
    ciudad = models.ForeignKey(Ciudade, models.DO_NOTHING, db_column='ciudad')
    creado = models.DateTimeField()
    modificado = models.DateTimeField()
    def __unicode__(self):
        return str(self.nombre)
    class Meta:
        managed = False
        db_table = 'Estacione'


class Estado(models.Model):
    cod_estado = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=50, blank=True, null=True)
    creado = models.DateTimeField()
    modificado = models.DateTimeField()
    def __unicode__(self):
        return str(self.nombre)
    class Meta:
        managed = False
        db_table = 'Estado'


class Factura(models.Model):
    cod_factura = models.IntegerField(primary_key=True)
    nombre = models.CharField(max_length=45, blank=True, null=True)
    referencia = models.IntegerField(blank=True, null=True)
    monto = models.FloatField(blank=True, null=True)
    tipo_factura = models.ForeignKey('TipoFactura', models.DO_NOTHING, db_column='tipo_factura', blank=True, null=True)
    creado = models.DateTimeField()
    modificado = models.DateTimeField()
    def __unicode__(self):
        return str(self.nombre)
    class Meta:
        managed = False
        db_table = 'Factura'


class Implementacione(models.Model):
    cod_imp = models.AutoField(primary_key=True)
    cod_station = models.ForeignKey(Estacione, models.DO_NOTHING, db_column='cod_station', blank=True, null=True)
    cod_po = models.ForeignKey('Po', models.DO_NOTHING, db_column='cod_po', blank=True, null=True)
    cod_contratista = models.ForeignKey(Contratista, models.DO_NOTHING, db_column='cod_contratista', blank=True, null=True)
    estimado = models.DateTimeField()
    creado = models.DateTimeField()
    modificado = models.DateTimeField()
    def __unicode__(self):
        return str(self.cod_station)
    class Meta:
        managed = False
        db_table = 'Implementacione'


class Inspeccione(models.Model):
    cod_srvy = models.AutoField(primary_key=True)
    cod_station = models.OneToOneField(Estacione, on_delete=models.CASCADE, primary_key=True,db_column='cod_station', ) 
    cod_estado = models.ForeignKey(Estado, models.DO_NOTHING, db_column='cod_estado', blank=True, null=True)
    cod_contratista = models.ForeignKey(Contratista, models.DO_NOTHING, db_column='cod_contratista')
    estimada = models.DateTimeField(blank=True, null=True)
    creado = models.DateTimeField()
    modificado = models.DateTimeField(blank=True, null=True)
    def __unicode__(self):
        return str(self.cod_station)
    class Meta:
        managed = False
        db_table = 'Inspeccione'


class Operacione(models.Model):
    cod_operacion = models.AutoField(primary_key=True)
    cod_contratista = models.ForeignKey(Contratista, models.DO_NOTHING, db_column='cod_contratista', blank=True, null=True)
    cod_operadora = models.ForeignKey('Operadora', models.DO_NOTHING, db_column='cod_operadora', blank=True, null=True)
    cod_vendor = models.ForeignKey('Vendor', models.DO_NOTHING, db_column='cod_vendor', blank=True, null=True)
    cod_entregable = models.ForeignKey(Entregable, models.DO_NOTHING, db_column='cod_entregable', blank=True, null=True)
    cod_tipo = models.ForeignKey('Tipo', models.DO_NOTHING, db_column='cod_tipo', blank=True, null=True)
    cod_station = models.ForeignKey(Estacione, models.DO_NOTHING, db_column='cod_station', blank=True, null=True)
    cod_po = models.ForeignKey('Po', models.DO_NOTHING, db_column='cod_po', blank=True, null=True)
    cod_atp = models.ForeignKey(Atp, models.DO_NOTHING, db_column='cod_atp', blank=True, null=True)
    fecha_inicio = models.DateField(blank=True, null=True)
    fecha_fin = models.DateField(blank=True, null=True)
    creado = models.DateTimeField()
    modificado = models.DateTimeField()
    def __unicode__(self):
        return str(self.cod_station)
    class Meta:
        managed = False
        db_table = 'Operacione'


class Operadora(models.Model):
    cod_operadora = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=45, blank=True, null=True)
    direccion = models.CharField(max_length=45, blank=True, null=True)
    creado = models.DateTimeField()
    modificado = models.DateTimeField()
    def __unicode__(self):
        return str(self.nombre)
    class Meta:
        managed = False
        db_table = 'Operadora'

class TipoPo(models.Model):
    cod_tipo = models.IntegerField(primary_key=True)
    nombre = models.CharField(max_length=50, blank=True, null=True)
    creado = models.DateTimeField(blank=True, null=True)
    modificado = models.DateTimeField(blank=True, null=True)
    def __unicode__(self):
        return str(self.nombre)
    class Meta:
        managed = False
        db_table = 'Tipo_PO'

class PO(models.Model):
    cod_po = models.AutoField(primary_key=True)
    cod_station = models.ForeignKey(Estacione, models.DO_NOTHING, db_column='cod_station', blank=True, null=True)
    num_tipo = models.CharField(max_length=50, blank=True, null=True)
    cod_tipo = models.ForeignKey('TipoPo', models.DO_NOTHING, db_column='cod_tipo', blank=True, null=True)
    creado = models.DateTimeField()
    modificado = models.DateTimeField()
    def __unicode__(self):
        return str(self.cod_station)
    class Meta:
        managed = False
        db_table = 'PO'


class Privilegio(models.Model):
    level = models.AutoField(primary_key=True)
    descripcion = models.CharField(max_length=45, blank=True, null=True)
    creado = models.DateTimeField()
    modificado = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'Privilegio'


class Regione(models.Model):
    cod_region = models.AutoField(primary_key=True)
    region = models.CharField(max_length=50, blank=True, null=True)
    creado = models.DateTimeField()
    modificado = models.DateTimeField()
    def __unicode__(self):
        return str(self.region)
    class Meta:
        managed = False
        db_table = 'Regione'


class Tipo(models.Model):
    cod_tipo = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=45, blank=True, null=True)
    creado = models.DateTimeField()
    modificado = models.DateTimeField()
    def __unicode__(self):
        return str(self.nombre)
    class Meta:
        managed = False
        db_table = 'Tipo'


class TipoFactura(models.Model):
    cod_tipo = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=45, blank=True, null=True)
    creado = models.DateTimeField()
    modificado = models.DateTimeField()
    def __unicode__(self):
        return str(self.nombre)
    class Meta:
        managed = False
        db_table = 'Tipo_factura'


class Usuario(models.Model):
    cod_usuario = models.AutoField(primary_key=True)
    username = models.CharField(unique=True, max_length=45, blank=True, null=True)
    password = models.CharField(max_length=45, blank=True, null=True)
    level = models.ForeignKey(Privilegio, models.DO_NOTHING, db_column='level', blank=True, null=True)
    creado = models.DateTimeField()
    modificado = models.DateTimeField()
    def __unicode__(self):
        return str(self.username)
    class Meta:
        managed = False
        db_table = 'Usuario'


class Vendor(models.Model):
    cod_vendor = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=45, blank=True, null=True)
    creado = models.DateTimeField()
    modificado = models.DateTimeField()
    def __unicode__(self):
        return str(self.nombre)
    class Meta:
        managed = False
        db_table = 'Vendor'


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=80)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.IntegerField()
    username = models.CharField(unique=True, max_length=30)
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=30)
    email = models.CharField(max_length=254)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.SmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


        #----------------------------------AdminModels--------------------
class ActividadeAdmin(admin.ModelAdmin):
    list_display = ('actividad','duracion')

class EstacioneAdmin(admin.ModelAdmin):
    list_display = ('nombre','ciudad')
    raw_id_search = ['nombre',]

class ContratistaAdmin(admin.ModelAdmin):
    list_display = ('nombre','region')

class CiudadeAdmin(admin.ModelAdmin):
    list_display = ('provincia','nombre','region')
class DisenoAdmin(admin.ModelAdmin):
    list_display = ('cod_station','nombre','creado','modificado')    
class InspeccioneAdmin(admin.ModelAdmin):
    list_display = ('cod_station','creado','modificado') 
    ordering = ['-creado',] 
class ImplementacioneAdmin(admin.ModelAdmin):
    list_display = ('cod_station','creado','modificado')  
class AtpAdmin(admin.ModelAdmin):
    list_display = ('cod_station','creado','modificado')             
class RegioneAdmin(admin.ModelAdmin):
    list_display = ('region',)

admin.site.register(Actividade,ActividadeAdmin)
admin.site.register(Asignacione)
admin.site.register(Atp,AtpAdmin)
admin.site.register(Ciudade,CiudadeAdmin)
admin.site.register(Contratista,ContratistaAdmin)
admin.site.register(Diseno,DisenoAdmin)
admin.site.register(Entregable)
admin.site.register(Factura)
admin.site.register(Implementacione,ImplementacioneAdmin)
admin.site.register(Aprobacione)
admin.site.register(Operacione)
admin.site.register(Operadora)
admin.site.register(PO)
admin.site.register(Privilegio)
admin.site.register(Regione,RegioneAdmin)
admin.site.register(Estacione,EstacioneAdmin)
admin.site.register(Inspeccione,InspeccioneAdmin)
admin.site.register(Tipo)
admin.site.register(TipoFactura)
admin.site.register(Usuario)
admin.site.register(Vendor)
