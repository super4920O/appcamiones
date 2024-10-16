import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class UserService {
  // URL base de la API
  static const String baseUrl = 'http://10.0.2.2:8080/api/usuarios';

  // Método para obtener la lista de usuarios
  static Future<List<User>> getUsers() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<User> users =
          body.map((dynamic item) => User.fromJson(item)).toList();
      return users;
    } else {
      throw Exception('Error al cargar usuarios');
    }
  }

  // Método para crear un nuevo usuario
  static Future<User> createUser(User user) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toJson()), // Convertir el objeto User a JSON
    );

    if (response.statusCode == 201) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error al crear usuario');
    }
  }

  // Método para actualizar un usuario existente
  // Método para actualizar un usuario existente
  static Future<User> updateUser(User user) async {
    print('Actualizando usuario con ID: ${user.id}');
    print('Datos enviados: ${jsonEncode(user.toJson())}');

    final response = await http.put(
      Uri.parse(
          '$baseUrl/${user.id}'), // No es necesario convertir id a String explícitamente
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      print('Error al actualizar usuario: ${response.statusCode}');
      print('Cuerpo de la respuesta: ${response.body}');
      throw Exception('Error al actualizar usuario: ${response.statusCode}');
    }
  }

  // Método para eliminar un usuario existente por su ID
  static Future<void> deleteUser(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));

    if (response.statusCode != 204) {
      throw Exception('Error al eliminar usuario');
    }
  }
}
