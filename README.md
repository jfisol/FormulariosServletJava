# FormulariosServletJava


### NOTA:
- Como buena práctica hay que usar una conformacion utf8 en maven: ` <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>`
- Támbien se agrega esto otra línea todo esta para el formato de los carácteres: `<project.reporting.outputEncoding>UTF-8</project.reporting.outputEncoding>`

### Diferencia entre atributos y parametos en Request.


`Atributos`: Permiten pasar datos de un servlet a un jsp o a otro servlet, son compartidos siempre que se mantengan dentro del request.
 - `getservletContext().getRequestDispatcher("/index.jsp").forward(req,resp)`: Sirve para redireccionar la vista a otro jsp se usa este método, el método `forwar()` se utiliza para cargar el jsp
`Parámetros`: Son los datos que envia el usuario.


### Nota
- `<%%>`: Se le conoce como scriplets
- `<%=variable %>`: Se le conoce comp expresión en jsp
- Se cambia la lista de errores por un Map esto para enlazar el tipo de error con el nombre de error para que se pueda identificar en la vista
    - Se usa el API `EL` expresion Lenguaje para no perder los valores en los formularios si ocurre un error no se borren los demas formularios.
    - En el input de tipo text se agrega "${param.username}" 
    aplica en el select/radio porque solo se agrega un `pais` / `idioma`: `${param.pais.equals("gt") ? "selected": ""}` / `${param.idioma.equals("es") ? "checked" : ""}` , cuando son varios resultados se ve despues.
- `ojo` para varios seleccionar un parámetro se utiliza `getParameter();`
    - `getParameter(String name)`: Se usa cuando esperas un solo valor de un parámetro. Devuelve un String. Si el parámetro no existe, devuelve null. 
  - `ojo` para varios seleccionar un arreglo de parámetros se utiliza `getParameterValues`
    - `getParameterValues(String name)` Se usa cuando un parámetro puede tener múltiples valores (como checkboxes, listas múltiples). Devuelve un String[] (arreglo de cadenas). Si no hay valores, devuelve null. 