package com.example.demo1.repository;
//importamos la clase del Usuario que respresentará la Entidad
//importamos la inetefaz JPA CRUD
//Importamos La clse Usuario que representa la Entidad
import com.example.demo1.model.Usuario;
//Importamos la interfaz JpaRepository que nos proporciona métodos CRUD estándar
import org.springframework.data.jpa.repository.JpaRepository;
//Importamos la anotación Repository que indica que esta interfaz es un repositorio 
import org.springframework.stereotype.Repository;
//Indicamos que esta inetrfaz es un repositorio con la @
@Repository
//Definicmos la interfaz UsuarioRepository que extiebde JpaRepository
//JpaRepository<T, ID> toma dos parámetros: la entidad y el tipo de la clave primaria
public interface UsuarioRepository extends JpaRepository<Usuario, Long> {
//JpaRepository ya proporciona métodos CRUD básicos como save, findId, findALL, deleteById, etc.countBy
//Podemos agregar métodos personalizados si es necesario
//Nota: tenemos que crearlo en el ordenes en el que lo estamos realizando

}
