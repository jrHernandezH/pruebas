# 'Que opciones daran cada dropdown?

## Información Personal

### Personal

**Tipo de documento** (opciones posibles):

- CURP
- Pasaporte
- Identificación oficial
- Tarjeta de residencia
- Certificado de nacimiento

**Estado civil**:

- Soltero(a)
- Casado(a)
- Divorciado(a)
- Viudo(a)
- Unión libre

**País**:

- Mostrará todos los países por medio de su API

**Estado**:

- En disputa ya que se tiene una API que rellena los campos

**Tipo de celular** (la base de datos ya tiene un enum que necesita):

- Casa
- Oficina
- Celular

**Relación / Parentesco**:

- Madre
- Padre
- Hermano(a)
- Hijo(a)
- Cónyuge
- Amigo(a)
- Otro

### Resumen

La información presentada puede ser enviada desde el backend como datos fijos o ser obtenida desde una base de datos. Para opciones como "Tipo de documento", "Estado civil", "Tipo de celular" y "Relación / Parentesco", es común que se utilicen datos fijos debido a su naturaleza estática. Sin embargo, para "País" y "Estado", es más eficiente obtener los datos desde una base de datos o API, ya que estas listas pueden cambiar con el tiempo y necesitan ser actualizadas dinámicamente.
