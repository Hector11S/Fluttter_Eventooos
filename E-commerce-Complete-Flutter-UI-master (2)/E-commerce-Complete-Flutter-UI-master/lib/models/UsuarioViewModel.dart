class UsuariosViewModel{

   int? Usua_Id;
   String? Usua_Usuario;
   bool? Usua_Admin;
   String? Usua_Contra;
   int? Role_Id;
   int? Empl_Id;
   int? Clie_Id;
   int? Usua_Creacion;
   DateTime? Usua_FechaCreacion;
   int? Usua_Modificacion;
   DateTime? Usua_FechaModificacion;
   String? Usua_Codigo;

   UsuariosViewModel({
     this.Usua_Id,
     this.Usua_Usuario, 
     this.Usua_Admin,
     this.Usua_Contra,
     this.Role_Id,
     this.Clie_Id,
     this.Empl_Id,
     this.Usua_Creacion,
     this.Usua_FechaCreacion,
     this.Usua_Modificacion,
     this.Usua_FechaModificacion,
     this.Usua_Codigo
  });

  factory UsuariosViewModel.fromJson(Map<String, dynamic> json) => UsuariosViewModel(
    Usua_Id: json['usua_Id'],
    Usua_Usuario: json['usua_Usuario'],
    Usua_Admin: json['usua_Admin'],
    Usua_Contra: json['usua_Contra'],
    Role_Id: json['rol_Id'],
       Clie_Id: json['clie_Id'],
          Empl_Id: json['empl_Id'],
      Usua_Creacion: json['usua_Usua_Creacion'],
      Usua_FechaCreacion: json['usua_Fecha_Creacion'] != null
          ? DateTime.parse(json['usua_Fecha_Modifica'])
          : null,
      Usua_Modificacion: json['Usua_Usua_Modifica'],
      Usua_FechaModificacion: json['Usua_FechaModificacion'] != null
          ? DateTime.parse(json['Usua_FechaModificacion'])
          : null,
    Usua_Codigo: json['Usua_Codigo'],
  );

  Map<String, dynamic> toJson() => {
    'usua_Id': Usua_Id,
    'usua_Usuario': Usua_Usuario,
    'usua_Admin': Usua_Admin,
    'usua_Contra': Usua_Contra,
    'rol_Id': Role_Id,
    'clie_Id': Clie_Id,
    'empl_Id': Empl_Id,
    'usua_Usua_Creacion': Usua_Creacion,
    'usua_FechaCreacion': Usua_FechaCreacion,
    'usua_Modificacion': Usua_Modificacion,
    'usua_FechaModificacion': Usua_FechaModificacion,
    'usua_Codigo': Usua_Codigo,
  };

}