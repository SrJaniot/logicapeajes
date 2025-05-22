import {Model, model, property} from '@loopback/repository';

@model()
export class ModelInsertarArchivos extends Model {
  @property({
    type: 'string',
    required: true,
  })
  nombre: string;

  @property({
    type: 'string',
    required: true,
  })
  descripcion: string;

  @property({
    type: 'string',
    required: true,
  })
  nombre_archivo: string;

  @property({
    type: 'number',
    required: true,
  })
  id_modulo: number;


  constructor(data?: Partial<ModelInsertarArchivos>) {
    super(data);
  }
}

export interface ModelInsertarArchivosRelations {
  // describe navigational properties here
}

export type ModelInsertarArchivosWithRelations = ModelInsertarArchivos & ModelInsertarArchivosRelations;
