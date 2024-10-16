import 'package:get/get.dart';
import '../models/user.dart';
import '../services/user_service.dart';

class UserController extends GetxController {
  var isLoading = true
      .obs; // Variable observable que indica si una operación está en proceso (carga)
  var userList =
      <User>[].obs; // Lista observable de usuarios, inicialmente vacía

  @override
  void onInit() {
    fetchUsers(); // Llama a este método para cargar usuarios
    super.onInit();
  }

  void fetchUsers() async {
    try {
      isLoading(true);
      final users = await UserService.getUsers();
      print(users); // Verifica si los usuarios se están cargando
      userList.value = users;
    } catch (e) {
      print('Error al cargar usuarios: $e'); // Imprime el error
    } finally {
      isLoading(false);
    }
  }

  // Método para agregar un usuario
  void addUser(User user) async {
    try {
      isLoading(true);
      var newUser = await UserService.createUser(user);
      userList.add(newUser);
    } finally {
      isLoading(false);
    }
  }

  // Método para actualizar un usuario existente
  void updateUser(User user) async {
    try {
      isLoading(true);
      var updatedUser = await UserService.updateUser(user);
      int index = userList.indexWhere((u) => u.id == user.id);
      if (index != -1) {
        userList[index] = updatedUser; // Actualiza la entrada en la lista
      }
    } finally {
      isLoading(false);
    }
  }

  // Método para eliminar un usuario
  void deleteUser(int id) async {
    try {
      isLoading(true);
      await UserService.deleteUser(id);
      userList.removeWhere((u) => u.id == id);
    } finally {
      isLoading(false);
    }
  }
}
