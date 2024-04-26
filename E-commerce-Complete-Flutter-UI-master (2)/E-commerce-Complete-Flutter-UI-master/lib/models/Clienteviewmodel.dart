class clienteViewmodel{
 int? Usua_Id ;
        String? Usua_Usuario;
         String? Usua_Contra ;
         bool? Usua_Admin ;
         int? Empl_Id ;
         int? Clie_Id ;
         int? Rol_Id ;
         int? Usua_Usua_Creacion ;
         DateTime? Usua_Fecha_Creacion; 
         int? Usua_Usua_Modifica ;
         DateTime? Usua_Fecha_Modifica; 
         bool? Usua_Activo ;
         String? Clie_Identidad; 
         String? Clie_Nombre ;
         String? Clie_Apellido; 
         String? Clie_Telefono ;
         String? Clie_CorreoElectronico; 
         String? Clie_Sexo;
         int? Esta_Id ;
         String? Muni_Id; 
         bool? Clie_Estado; 
         int? Carg_Id ;
         int? Clie_Usua_Creacion; 
         DateTime? Clie_Fecha_Creacion; 

   clienteViewmodel({
     this.Usua_Id,
     this.Usua_Usuario, 
     this.Usua_Admin,
     this.Usua_Contra,
     this.Rol_Id,
     this.Clie_Id,
     this.Empl_Id,
     this.Usua_Usua_Creacion,
     this.Usua_Fecha_Creacion,
     this.Usua_Usua_Modifica,
     this.Usua_Fecha_Modifica,
     this.Usua_Activo,
     this.Clie_Identidad,
     this.Clie_Nombre,
     this.Clie_Apellido,
     this.Clie_Telefono,
     this.Clie_CorreoElectronico,
     this.Clie_Sexo,
     this.Esta_Id,
     this.Muni_Id,
     this.Clie_Estado,
     this.Carg_Id,
     this.Clie_Fecha_Creacion,
     this.Clie_Usua_Creacion
  });

   factory clienteViewmodel.fromJson(Map<String, dynamic> json) => clienteViewmodel(
    Usua_Id: json['usua_Id'],
    Usua_Usuario: json['usua_Usuario'],
    Usua_Admin: json['usua_Admin'],
    Usua_Contra: json['usua_Contra'],
    Rol_Id: json['rol_Id'],
       Clie_Id: json['clie_Id'],
          Empl_Id: json['empl_Id'] ,
      Usua_Usua_Creacion: json['usua_Usua_Creacion'],
      Usua_Fecha_Creacion: json['usua_Fecha_Creacion'] != null
          ? DateTime.parse(json['usua_Fecha_Modifica'])
          : null,
      Usua_Usua_Modifica: json['usua_Usua_Modifica'],
      Usua_Fecha_Modifica: json['usua_FechaModificacion'] != null
          ? DateTime.parse(json['usua_FechaModificacion'])
          : null,
          Clie_Identidad: json['clie_Identidad'],
          Clie_Nombre: json['clie_Nombre'],
          Clie_Apellido: json['clie_Apellido'],
          Clie_Telefono: json['clie_Telefono'],
          Clie_CorreoElectronico: json['clie_CorreoElectronico'],
          Clie_Sexo: json['clie_Sexo'],
          Esta_Id: json['esta_Id'],
          Muni_Id: json['muni_Id'] = '',
          Clie_Estado: json['clie_Estado'] = true,
          Carg_Id: json['carg_Id'],
          Clie_Fecha_Creacion: json['clie_Fecha_Creacion'] != null
          ? DateTime.parse(json['clie_Fecha_Creacion']):null,
          Clie_Usua_Creacion: json['clie_Usua_Creacion'],

  );

    Map<String, dynamic> toJson() => {
    'usua_id': Usua_Id,
    'usua_usuario': Usua_Usuario,
    'usua_EsAdmin': Usua_Admin,
    'usua_Contra': Usua_Contra,
    'role_Id': Rol_Id,
    'clie_Id': Clie_Id,
    'empl_Id': Empl_Id,
    'usua_Creacion': Usua_Usua_Creacion,
    'usua_FechaCreacion': Clie_Fecha_Creacion,
    'usua_Modificacion': Usua_Usua_Modifica,
    'usua_FechaModificacion': Usua_Fecha_Modifica,
    'clie_Identidad': Clie_Identidad,
    'clie_Nombre': Clie_Nombre,
    'clie_Apellido': Clie_Apellido,
    'clie_Telefono': Clie_Telefono,
    'clie_CorreoElectronico': Clie_CorreoElectronico,
    'clie_Sexo': Clie_Sexo,
    'esta_Id': Esta_Id,
    'muni_Id': Muni_Id as String,
    'clie_Estado': Clie_Estado,
    'carg_Id':Carg_Id,
    'clie_Fecha_Creacion': Clie_Fecha_Creacion,
    'clie_Usua_Creacion': Clie_Usua_Creacion,
  };
}