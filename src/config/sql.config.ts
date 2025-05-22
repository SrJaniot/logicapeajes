export namespace SQLConfig {

  //FUNCIONES PARA EL CONTROLADOR DE CONTEXTOPREGUNTA ---------------------------------------------------------------------------------------------------------
  export const InsertarArchivo: string = "SELECT insertar_archivo($1,$2,$3,$4);";
  export const ObtenerArchivosporID: string = "SELECT consultar_archivo($1);";
  export const ObtenerArchivosporIDModulo: string = "SELECT consultar_archivos_por_modulo($1);";
  export const ActualizarArchivo: string = "SELECT actualizar_archivo($1,$2,$3,$4,$5);"; 
  export const EliminarArchivo: string = "SELECT eliminar_archivo($1);";

}
