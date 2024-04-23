class UtileriaViewModel {
  final String descripcion;
  final String imagenUrl;
  final double precio;

  UtileriaViewModel({
    required this.descripcion,
    required this.imagenUrl,
    required this.precio,
  });

  factory UtileriaViewModel.fromJson(Map<String, dynamic> json) {
    return UtileriaViewModel(
      descripcion: json['util_Descripcion'] ?? "",
      imagenUrl: json['util_Imagen'] ?? "",
      precio: json['util_Precio'] != null ? double.parse(json['util_Precio'].toString()) : 0.0,
    );
  }
}
