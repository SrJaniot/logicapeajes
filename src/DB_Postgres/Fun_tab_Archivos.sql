-- funcion para la insercion de un registro en la tabla archivos
CREATE OR REPLACE FUNCTION insertar_archivo(
  p_nombre VARCHAR,
  p_descripcion VARCHAR,
  p_nombre_archivo VARCHAR,
  p_id_modulo INTEGER
) RETURNS JSON AS $$
DECLARE
  resultado JSON;
BEGIN
  INSERT INTO archivos (nombre, descripcion, nombre_archivo, id_modulo)
  VALUES (p_nombre, p_descripcion, p_nombre_archivo, p_id_modulo);

  resultado := json_build_object(
    'CODIGO', 200,
    'MENSAJE', 'Inserción exitosa',
    'DATOS', NULL
  );
  RETURN resultado;
EXCEPTION WHEN OTHERS THEN
  resultado := json_build_object(
    'CODIGO', 500,
    'MENSAJE', 'Error en la inserción',
    'DATOS', NULL
  );
  RETURN resultado;
END;
$$ LANGUAGE plpgsql;

-- funcion para la actualizacion de un registro en la tabla archivos
CREATE OR REPLACE FUNCTION actualizar_archivo(
  p_id INTEGER,
  p_nombre VARCHAR,
  p_descripcion VARCHAR,
  p_nombre_archivo VARCHAR,
  p_id_modulo INTEGER
) RETURNS JSON AS $$
DECLARE
  resultado JSON;
  filas_afectadas INTEGER;
BEGIN
  UPDATE archivos
  SET nombre = p_nombre,
      descripcion = p_descripcion,
      nombre_archivo = p_nombre_archivo,
      id_modulo = p_id_modulo
  WHERE id = p_id;
  GET DIAGNOSTICS filas_afectadas = ROW_COUNT;

  IF filas_afectadas = 0 THEN
    resultado := json_build_object(
      'CODIGO', 404,
      'MENSAJE', 'No existe el registro a actualizar',
      'DATOS', NULL
    );
  ELSE
    resultado := json_build_object(
      'CODIGO', 200,
      'MENSAJE', 'Actualización exitosa',
      'DATOS', NULL
    );
  END IF;
  RETURN resultado;
EXCEPTION WHEN OTHERS THEN
  resultado := json_build_object(
    'CODIGO', 500,
    'MENSAJE', 'Error en la actualización',
    'DATOS', NULL
  );
  RETURN resultado;
END;
$$ LANGUAGE plpgsql;

-- funcion para la eliminacion de un registro en la tabla archivos
CREATE OR REPLACE FUNCTION eliminar_archivo(
  p_id INTEGER
) RETURNS JSON AS $$
DECLARE
  resultado JSON;
  filas_afectadas INTEGER;
BEGIN
  DELETE FROM archivos
  WHERE id = p_id;
  GET DIAGNOSTICS filas_afectadas = ROW_COUNT;

  IF filas_afectadas = 0 THEN
    resultado := json_build_object(
      'CODIGO', 404,
      'MENSAJE', 'No existe el registro a eliminar',
      'DATOS', NULL
    );
  ELSE
    resultado := json_build_object(
      'CODIGO', 200,
      'MENSAJE', 'Eliminación exitosa',
      'DATOS', NULL
    );
  END IF;
  RETURN resultado;
EXCEPTION WHEN OTHERS THEN
  resultado := json_build_object(
    'CODIGO', 500,
    'MENSAJE', 'Error en la eliminación',
    'DATOS', NULL
  );
  RETURN resultado;
END;
$$ LANGUAGE plpgsql;

-- funcion para la consulta de un registro en la tabla archivos que retorna un json con estructura personalizada
CREATE OR REPLACE FUNCTION consultar_archivo(
  p_id INTEGER
) RETURNS JSON AS $$
DECLARE
  resultado JSON;
  datos JSONB;
BEGIN
  SELECT to_jsonb(a)
  INTO datos
  FROM (
    SELECT id, nombre, descripcion, nombre_archivo, id_modulo
    FROM archivos
    WHERE id = p_id
  ) a;

  IF datos IS NULL THEN
    resultado := json_build_object(
      'CODIGO', 404,
      'MENSAJE', 'No existen registros',
      'DATOS', NULL
    );
  ELSE
    resultado := json_build_object(
      'CODIGO', 200,
      'MENSAJE', 'Consulta exitosa',
      'DATOS', datos
    );
  END IF;

  RETURN resultado;
EXCEPTION WHEN OTHERS THEN
  resultado := json_build_object(
    'CODIGO', 500,
    'MENSAJE', 'Error en la consulta',
    'DATOS', NULL
  );
  RETURN resultado;
  END;
$$ LANGUAGE plpgsql;

-- FUNCION PARA CONSULTAR TODOS LOS REGISTROS DE UN MODULO ESPECIFICO RETORNANDO UN JSON CON ESTRUCTURA PERSONALIZADA
CREATE OR REPLACE FUNCTION consultar_archivos_por_modulo(
  p_id_modulo INTEGER
) RETURNS JSON AS $$
DECLARE
  resultado JSON;
  datos JSONB;
BEGIN
  SELECT json_agg(a)
  INTO datos
  FROM (
    SELECT id, nombre, descripcion, nombre_archivo, id_modulo
    FROM archivos
    WHERE id_modulo = p_id_modulo
  ) a;

  IF datos IS NULL THEN
    resultado := json_build_object(
      'CODIGO', 404,
      'MENSAJE', 'No existen registros',
      'DATOS', NULL
    );
  ELSE
    resultado := json_build_object(
      'CODIGO', 200,
      'MENSAJE', 'Consulta exitosa',
      'DATOS', datos
    );
  END IF;

  RETURN resultado;
EXCEPTION WHEN OTHERS THEN
  resultado := json_build_object(
    'CODIGO', 500,
    'MENSAJE', 'Error en la consulta',
    'DATOS', NULL
  );
  RETURN resultado;
END;
$$ LANGUAGE plpgsql;

