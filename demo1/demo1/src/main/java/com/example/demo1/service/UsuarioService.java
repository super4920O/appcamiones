package com.example.demo1.service;

import com.example.demo1.model.Usuario;
import com.example.demo1.repository.UsuarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;
import java.util.List;

@Service
public class UsuarioService {

    @Autowired
    private UsuarioRepository usuarioRepository;

    // Método para obtener todos los usuarios
    public List<Usuario> getAllUsuarios() {
        return usuarioRepository.findAll();
    }

    // Método para obtener un usuario por ID
    public Optional<Usuario> getUsuarioById(Long id) {
        return usuarioRepository.findById(id);
    }

    // Método para crear o guardar un nuevo usuario
    public Usuario saveUsuario(Usuario usuario) {
        return usuarioRepository.save(usuario);
    }

    // **Nuevo método para actualizar un usuario existente**
    public Usuario updateUsuario(Long id, Usuario usuarioActualizado) {
        // Buscar el usuario por ID
        return usuarioRepository.findById(id)
            .map(usuarioExistente -> {
                // Actualizar los campos necesarios
                usuarioExistente.setNombre(usuarioActualizado.getNombre());
                usuarioExistente.setCorreo(usuarioActualizado.getCorreo());
                // Otros campos que necesites actualizar
                return usuarioRepository.save(usuarioExistente); // Guardar los cambios
            })
            .orElseThrow(() -> new RuntimeException("Usuario no encontrado")); // Manejo de errores
    }

    // Método para eliminar un usuario por su ID
    public void deleteUsuario(Long id) {
        usuarioRepository.deleteById(id);
    }
}
