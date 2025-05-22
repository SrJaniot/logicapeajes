import {Model, model, property} from '@loopback/repository';

@model()
export class ModelActualizarArchivo extends Model {
  @property({
    type: 'number',
    id: true,
    generated: false,
    required: true,
  })
  id_archivo: number;

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


  constructor(data?: Partial<ModelActualizarArchivo>) {
    super(data);
  }
}

export interface ModelActualizarArchivoRelations {
  // describe navigational properties here
}

export type ModelActualizarArchivoWithRelations = ModelActualizarArchivo & ModelActualizarArchivoRelations;
