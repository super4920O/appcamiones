import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:get/get.dart'; // Asegúrate de que 'get' esté importado
import 'controllers/user_controller.dart'; // Asegúrate de que esta línea apunte correctamente a tu controlador
import 'screens/user_form_screen.dart';

void main() {
  // Inicializa el controlador UserController aquí para que esté disponible globalmente
  Get.put(UserController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // Cambiado a GetMaterialApp para compatibilidad con GetX
      title: 'CRUD Usuario',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: HomeScreen(), // Pantalla principal que lista los usuarios
    );
  }
}
