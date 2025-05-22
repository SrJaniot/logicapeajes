-- Test script for Fun_tab_Archivos.sql functions

-- 1. Insertar un nuevo archivo
SELECT insertar_archivo(
  'Archivo Test',
  'Descripción de prueba',
  'archivo_test.pdf',
  1
);

-- 2. Consultar el archivo recién insertado (asumiendo que el id generado es 1, ajustar según corresponda)
SELECT consultar_archivo(2);

-- 3. Actualizar el archivo
SELECT actualizar_archivo(
  1,
  'Archivo Test Actualizado',
  'Descripción actualizada',
  'archivo_test_actualizado.pdf',
  2
);

-- 4. Consultar el archivo actualizado
SELECT consultar_archivo(1);

-- 5. Consultar todos los archivos del módulo 2
SELECT consultar_archivos_por_modulo(2);

-- 6. Eliminar el archivo
SELECT eliminar_archivo(1);

-- 7. Intentar consultar el archivo eliminado
SELECT consultar_archivo(1);

-- 8. Consultar todos los archivos del módulo 2 después de la eliminación
SELECT consultar_archivos_por_modulo(1);

SELECT * FROM archivos;