// Uncomment these imports to begin using these cool features!

import { DefaultCrudRepository, juggler } from "@loopback/repository";
import { GenericModel, ModelActualizarArchivo, ModelInsertarArchivos } from "../models";
import { inject } from "@loopback/core";
import { authenticate } from "@loopback/authentication";
import { ConfiguracionSeguridad } from "../config/configuracion.seguridad";
import { get, getModelSchemaRef, param, post, requestBody, response } from "@loopback/rest";
import { SQLConfig } from "../config/sql.config";

// import {inject} from '@loopback/core';


export class ArchivosController {
  //Generacion de un repositorio generico para conectarme a la base de datos postgresql
  private genericRepository: DefaultCrudRepository <GenericModel, typeof GenericModel.prototype.id>;

  constructor(
    // inyectar el datasource de postgresql
    @inject('datasources.postgres') dataSource:  juggler.DataSource,
  ) {
    //configuracion del genericRepository para que se conecte a la base de datos postgresql
    this.genericRepository = new DefaultCrudRepository<any,any>(
      GenericModel,
      dataSource
    );
  }





  //METODO PARA CREAR UNA archivo en la base de datos


@authenticate({
  strategy: 'auth',
  options: [ConfiguracionSeguridad.menuadmin, ConfiguracionSeguridad.guardarAccion]
})
@post('/CrearArchivo')
@response(200, {
  description: 'creacion de un Contexto',
  content:{
    'application/json':{
      schema: getModelSchemaRef(ModelInsertarArchivos),
    },
  },
})
async crearcontexto(
  @requestBody({
    content:{
      'application/json':{
        schema: getModelSchemaRef(ModelInsertarArchivos),
      },
    },
  })
  data: ModelInsertarArchivos,
):Promise<object>{
  try{
    //const sql =SQLConfig.crearContexto;
    // EN ESTE CASO ESTA FUNCION RETORNA UN JSON DESDE POSTGRES
    const sql = SQLConfig.InsertarArchivo;
    const params =[
      data.nombre,
      data.descripcion,
      data.nombre_archivo,
      data.id_modulo,
    ];
    const result = await this.genericRepository.dataSource.execute(sql, params);
    //console.log(result[0]);
    //console.log(result[0]);
    //console.log(result[0].fun_insertar_contexto_json);
    //console.log(result[0].fun_insert_torneo.id_torneo);
    if(result[0].insertar_archivo.CODIGO !=200){
      return {
        "CODIGO": result[0].insertar_archivo.CODIGO,
        "MENSAJE": result[0].insertar_archivo.MENSAJE,
        "DATOS": null
      };
    }
    return {
      "CODIGO": result[0].insertar_archivo.CODIGO,
      "MENSAJE": result[0].insertar_archivo.MENSAJE,
      "DATOS": result[0].insertar_archivo.DATOS
    };
  }catch(error){
    return {
      "CODIGO": 500,
      "MENSAJE": "ERROR POSTGRES",
      "DATOS": error
    };
  }
}



//METODO GET PARA OPTENER DATOS DE  UN ARCHIVO
@get('/ObtenerArchivo/{id_archivo}')
@response(200, {
 description: 'Obtener Archivo por id',
 content:{
   'application/json':{
     schema: getModelSchemaRef(GenericModel),
   },
 },
})
async ObtenerArchivo(
 @param.path.number('id_archivo') id_contexto: number,
):Promise<object>{
 try{
   //const sql =SQLConfig.crearContexto;
   // EN ESTE CASO ESTA FUNCION RETORNA UN JSON DESDE POSTGRES
   const sql = SQLConfig.ObtenerArchivosporID;
   const params =[
    id_contexto
   ];
   //console.log(sql);
   //console.log(params);
   const result = await this.genericRepository.dataSource.execute(sql, params);
   //console.log(result[0]);
   //FUN_CONSULTAR_CONTEXTO_ID() fun_consultar_contexto_id()
   if(result[0].consultar_archivo.CODIGO !=200){
     return {
       "CODIGO": result[0].consultar_archivo.CODIGO,
       "MENSAJE": result[0].consultar_archivo.MENSAJE,
       "DATOS": null
     };
   }
   return {
     "CODIGO": result[0].consultar_archivo.CODIGO,
     "MENSAJE": result[0].consultar_archivo.MENSAJE,
     "DATOS": result[0].consultar_archivo.DATOS
   };
 }catch(error){
   return {
     "CODIGO": 500,
     "MENSAJE": "Error POSTGRES",
     "DATOS": error
   };
 }
}
//METODO GET PARA OPTENER DATOS ARCHIVOS POR MODULO

 @get('/ObtenerArchivosporModulo/{id_modulo}')
 @response(200, {
   description: 'Obtener ObtenerArchivosporModulo',
   content:{
     'application/json':{
       schema: getModelSchemaRef(GenericModel),
     },
   },
 })
 async ObtenerArchivosporModulo(
   @param.path.number('id_modulo') id_modulo: number,
 ):Promise<object>{
   try{
     //const sql =SQLConfig.crearContexto;
     // EN ESTE CASO ESTA FUNCION RETORNA UN JSON DESDE POSTGRES
     const sql = SQLConfig.ObtenerArchivosporIDModulo;
     const params =[
      id_modulo
      ];
     const result = await this.genericRepository.dataSource.execute(sql,params);
     // FUN_CONSULTAR_CONTEXTO()  fun_consultar_contexto()

     if(result[0].consultar_archivos_por_modulo.CODIGO !=200){
       return {
         "CODIGO": result[0].consultar_archivos_por_modulo.CODIGO,
         "MENSAJE": result[0].consultar_archivos_por_modulo.MENSAJE,
         "DATOS": null
       };
     }
     return {
       "CODIGO": result[0].consultar_archivos_por_modulo.CODIGO,
       "MENSAJE": result[0].consultar_archivos_por_modulo.MENSAJE,
       "DATOS": result[0].consultar_archivos_por_modulo.DATOS
     };


   }catch(error){
     return {
       "CODIGO": 500,
       "MENSAJE": "Error POSTGRES",
       "DATOS": error
     };
   }
 }





 //METODO POST PARA ACTUALIZAR UN ARCHIVO
 

@authenticate({
  strategy: 'auth',
  options: [ConfiguracionSeguridad.menuadmin, ConfiguracionSeguridad.guardarAccion]
})
@post('/ActualizarArchivo')
@response(200, {
  description: 'ActualizarArchivo de un Contexto',
  content:{
    'application/json':{
      schema: getModelSchemaRef(ModelActualizarArchivo),
    },
  },
})
async ActualizarArchivo(
  @requestBody({
    content:{
      'application/json':{
        schema: getModelSchemaRef(ModelActualizarArchivo),
      },
    },
  })
  data: ModelActualizarArchivo,
):Promise<object>{
  try{
    //const sql =SQLConfig.crearContexto;
    // EN ESTE CASO ESTA FUNCION RETORNA UN JSON DESDE POSTGRES
    const sql = SQLConfig.ActualizarArchivo;
    const params =[
      data.id_archivo,
      data.nombre,
      data.descripcion,
      data.nombre_archivo,
      data.id_modulo,
    ];
    const result = await this.genericRepository.dataSource.execute(sql, params);
    //console.log(result[0]);
    //console.log(result[0]);
    //console.log(result[0].fun_insertar_contexto_json);
    //console.log(result[0].fun_insert_torneo.id_torneo);
    if(result[0].actualizar_archivo.CODIGO !=200){
      return {
        "CODIGO": result[0].actualizar_archivo.CODIGO,
        "MENSAJE": result[0].actualizar_archivo.MENSAJE,
        "DATOS": null
      };
    }
    return {
      "CODIGO": result[0].actualizar_archivo.CODIGO,
      "MENSAJE": result[0].actualizar_archivo.MENSAJE,
      "DATOS": result[0].actualizar_archivo.DATOS
    };
  }catch(error){
    return {
      "CODIGO": 500,
      "MENSAJE": "ERROR POSTGRES",
      "DATOS": error
    };
  }
}

//metodo para eliminar un archivo
@authenticate({
  strategy: 'auth',
  options: [ConfiguracionSeguridad.menuadmin, ConfiguracionSeguridad.guardarAccion]
})
@post('/EliminarArchivo')
@response(200, {
  description: 'EliminarArchivo de un Contexto',
  content:{
    'application/json':{
      schema: getModelSchemaRef(ModelActualizarArchivo),
    },
  },
})
async EliminarArchivo(
     @param.path.number('id_archivo') id_archivo: number,
):Promise<object>{
  try{
    //const sql =SQLConfig.crearContexto;
    // EN ESTE CASO ESTA FUNCION RETORNA UN JSON DESDE POSTGRES
    const sql = SQLConfig.EliminarArchivo;
    const params =[
      id_archivo,
    ];
    const result = await this.genericRepository.dataSource.execute(sql, params);
    //console.log(result[0]);
    //console.log(result[0]);
    //console.log(result[0].fun_insertar_contexto_json);
    //console.log(result[0].fun_insert_torneo.id_torneo);
    if(result[0].eliminar_archivo.CODIGO !=200){
      return {
        "CODIGO": result[0].eliminar_archivo.CODIGO,
        "MENSAJE": result[0].eliminar_archivo.MENSAJE,
        "DATOS": null
      };
    }
    return {
      "CODIGO": result[0].eliminar_archivo.CODIGO,
      "MENSAJE": result[0].eliminar_archivo.MENSAJE,
      "DATOS": result[0].eliminar_archivo.DATOS
    };
  }catch(error){
    return {
      "CODIGO": 500,
      "MENSAJE": "ERROR POSTGRES",
      "DATOS": error
    };
  }
}
 










}
