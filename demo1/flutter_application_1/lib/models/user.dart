class User {
  int id; // Cambiar a int
  String correo;
  String nombre;

  User({required this.id, required this.correo, required this.nombre});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'], // Asignar como int
      correo: json['correo'],
      nombre: json['nombre'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id, // Mantener como int
      "correo": correo,
      "nombre": nombre,
    };
  }
}
