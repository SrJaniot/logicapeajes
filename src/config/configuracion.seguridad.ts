export namespace ConfiguracionSeguridad{
    //-------------------------VARIABLES DE ENTORNO  -------------------------------------
    //instalar el paquete dotenv npm i dotenv para poder leer variables de entorno  y importar en application.ts require('dotenv').config();
    //export const connection_user_postgres = process.env.CONNECTION_USER_POSTGRES ;
    //export const connection_password_postgres = process.env.CONNECTION_PASSWORD_POSTGRES ;
    //export const connection_database_postgres = process.env.CONNECTION_DATABASE_POSTGRES ;
    //
    //cambiar esta ruta por la url del server con el puerto a la api de seguridad
    export const hostSeguridad = 'http://127.0.0.1:3000' ;


    //-------------------------menus -------------------------------------
    export const menuadmin = 1;


    //-------------------------acciones -------------------------------------
    export const listarAccion = "listar";
    export const guardarAccion = "guardar";
    export const eliminarAccion = "eliminar";
    export const editarAccion = "editar";
    export const buscarAccion_id = "buscar_id";




  //------------------------variables de entorno-------------------------------------
  //instalar el paquete dotenv npm i dotenv para poder leer variables de entorno  y
  //importar en application.ts require('dotenv').config();
  export const connection_user_postgres = process.env.CONNECTION_USER_POSTGRES ;
  export const connection_password_postgres = process.env.CONNECTION_PASSWORD_POSTGRES ;
  export const connection_database_postgres = process.env.CONNECTION_DATABASE_POSTGRES ;



}
