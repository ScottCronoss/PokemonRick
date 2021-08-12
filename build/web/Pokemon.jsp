
<%@page import="control.PokemonControl"%>
<%@page import="modelo.Pokemons"%>
<%@page import="java.util.List"%>
<%
    List<Pokemons> lista;
    if (session.getAttribute("listaPokemons") == null) {
        lista = new PokemonControl().ConsultarTodos();
        session.setAttribute("listaPokemons", lista);
    } else {
        lista = (List<Pokemons>) session.getAttribute("listaPokemons");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link type="text/css" href="css/bootstrap.min.css" rel="Stylesheet"  /> 
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>   
        <script type="text/javascript" src="js/jquery.validate.js" ></script>
        <title>Pokemons</title>
        <script>
            $(document).ready(function () {
                jQuery.extend(jQuery.validator.messages, {
                    required: "Este campo es obligatorio.",
                    email: "Por favor, escribe una dirección de correo válida",
                    url: "Por favor, escribe una URL válida.",
                    date: "Por favor, escribe una fecha válida.",
                    dateISO: "Por favor, escribe una fecha (ISO) válida.",
                    number: "Por favor, escribe un número válido.",
                    digits: "Por favor, escribe sólo dígitos.",
                    creditcard: "Por favor, escribe un número de tarjeta válido.",
                    equalTo: "Por favor, escribe el mismo valor de nuevo.",
                    accept: "Por favor, escribe un valor con una extensión aceptada.",
                    maxlength: jQuery.validator.format("Por favor, no escribas más de {0} caracteres."),
                    minlength: jQuery.validator.format("Por favor, no escribas menos de {0} caracteres."),
                    rangelength: jQuery.validator.format("Por favor, escribe un valor entre {0} y {1} caracteres."),
                    range: jQuery.validator.format("Por favor, escribe un valor entre {0} y {1}."),
                    max: jQuery.validator.format("Por favor, escribe un valor menor o igual a {0}."),
                    min: jQuery.validator.format("Por favor, escribe un valor mayor o igual a {0}."),
                    extension: "Por favor, selecciona un archivo con una extensión jpg."
                });
                $(".eliminarpokemon").click(function () {
                    $.ajax({
                        type: 'post',
                        url: 'PokemonServlet',
                        data: {accion: "EliminarPokemon", indice: $(this).attr("indice")},
                        success: function () {
                            location.reload();
                        }
                    });
                });
                $(".editarpokemon").click(function () {
                    $.ajax({
                        type: 'post',
                        url: 'PokemonServlet',
                        data: {accion: "CargaDatosPokemon", indice: $(this).attr("indice")},
                        success: function () {
                            $("#datoseditar").load("EditarPokemon.jsp");
                        }
                    });
                });
                $("#ordenid").click(function () {
                    $.ajax({
                        type: 'post',
                        url: 'PokemonServlet',
                        data: {accion: "Ordenar", campo: "idpokemonrick"},
                        success: function () {
                            location.reload();
                        }
                    });
                });
                $("#ordennombre").click(function () {
                    $.ajax({
                        type: 'post',
                        url: 'PokemonServlet',
                        data: {accion: "Ordenar", campo: "nombrerick"},
                        success: function () {
                            location.reload();
                        }
                    });
                });
                $("#ordentipo").click(function () {
                    $.ajax({
                        type: 'post',
                        url: 'PokemonServlet',
                        data: {accion: "Ordenar", campo: "tiporick"},
                        success: function () {
                            location.reload();
                        }
                    });
                });
                $("#ordenevoluciones").click(function () {
                    $.ajax({
                        type: 'post',
                        url: 'PokemonServlet',
                        data: {accion: "Ordenar", campo: "evolucionesrick"},
                        success: function () {
                            location.reload();
                        }
                    });
                });
                $("#ordenhabitat").click(function () {
                    $.ajax({
                        type: 'post',
                        url: 'PokemonServlet',
                        data: {accion: "Ordenar", campo: "habitatrick"},
                        success: function () {
                            location.reload();
                        }
                    });
                });
                $("#ordenaltura").click(function () {
                    $.ajax({
                        type: 'post',
                        url: 'PokemonServlet',
                        data: {accion: "Ordenar", campo: "alturarick"},
                        success: function () {
                            location.reload();
                        }
                    });
                });
                $("#ordendebilidad").click(function () {
                    $.ajax({
                        type: 'post',
                        url: 'PokemonServlet',
                        data: {accion: "Ordenar", campo: "debilidadrick"},
                        success: function () {
                            location.reload();
                        }
                    });
                });
                $("#frmnuevopokemon").validate({
                    rules: {
                        nombrerick: {required: true, maxlength: 50},
                        tiporick: {required: true, maxlength: 50},
                        evolucionesrick: {required: true, digits: true},
                        habitatrick: {required: true, maxlength: 50},
                        alturaricka: {required: true, digits: true},
                        debilidadrick: {required: true, maxlength: 50}
                    },
                    submitHandler: function (form) {
                        $.ajax({
                            type: 'post',
                            url: 'PokemonServlet',
                            data: $(form).serialize(),
                            cache: false,
                            processData: false,
                            success: function () {
                                location.reload();
                            }
                        });
                    }
                });
                $("#frmeditapokemon").validate({
                    rules: {
                        nombrerick: {required: true, maxlength: 50},
                        tiporick: {required: true, maxlength: 50},
                        evolucionesrick: {required: true, digits: true},
                        habitatrick: {required: true, maxlength: 50},
                        alturaricka: {required: true, digits: true},
                        debilidadrick: {required: true, maxlength: 50}
                    },
                    submitHandler: function (form) {
                        $.ajax({
                            type: 'post',
                            url: 'PokemonServlet',
                            data: $(form).serialize(),
                            cache: false,
                            processData: false,
                            success: function () {
                                location.reload();
                            }
                        });
                    }
                });
            });
        </script>
    </head>
    <body>
        <table class='table table-hover'>
            <tr class='table-secondary'>
                <th><a class="nav-link" href="#" id="ordenid">IDPokemonRick</a>
                <th><a class="nav-link" href="#" id="ordennombre">NombreRick</a>
                <th><a class="nav-link" href="#" id="ordentipo">TipoRick</a>
                <th><a class="nav-link" href="#" id="ordenevoluciones">EvolucionesRick</a>
                <th><a class="nav-link" href="#" id="ordenhabitat">HabitatRick</a>
                <th><a class="nav-link" href="#" id="ordenaltura">AlturaRick</a>
                <th><a class="nav-link" href="#" id="ordendebilidad">DebilidadRick</a>
                <th><div class="row">
                        <div class="col"><a class="nav-link" href="#">Acciones</a>
                        </div><div class="col">
                            <button type="button" class="btn btn-info" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                Nuevo
                            </button></div></div>
                            <%
                                for (int i = 0; i < lista.size(); i++) {
                                    Pokemons pok = lista.get(i);
                                    out.println(i % 2 == 0 ? "<tr class='table-primary'>" : "<tr class='table-success'>");
                                    out.println("<td>" + pok.getIdpokemonrick());
                                    out.println("<td>" + pok.getNombrerick());
                                    out.println("<td>" + pok.getTiporick());
                                    out.println("<td>" + pok.getEvolucionesrick());
                                    out.println("<td>" + pok.getHabitatrick());
                                    out.println("<td>" + pok.getAlturarick());
                                    out.println("<td>" + pok.getDebilidadrick());


                            %>
                <td>
                    <button type="button" class="btn btn-info editarpokemon" indice="<%= i%>" data-bs-toggle="modal" data-bs-target="#exampleModal2" >
                                Editar
                            </button>
                   
                    <button type="button" class="btn btn-danger eliminarpokemon" indice="<%= i%>">Eliminar</button> 
                    <%

                        }
                    %>
        </table>

        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Nuevo Pokemon</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form id="frmnuevopokemon" name="frmnuevopokemon">
                        <input type="hidden" class="form-control" id="accion" name="accion" value="CreaPokemon">
                        <div class="modal-body">
                            
                            <fieldset>
                                <div class="form-group">
                                    <label for="nombrerick" class="form-label mt-4">NombreRick</label>
                                    <input type="text" class="form-control" id="nombrerick" name="nombrerick" placeholder="Escribe el nombre del pokemon">
                                </div>
                                <div class="form-group">
                                    <label for="tiporick" class="form-label mt-4">TipoRick</label>
                                    <input type="text" class="form-control" id="tiporick" name="tiporick" placeholder="Escribe el tipo de pokemon">
                                </div>
                                <div class="form-group">
                                    <label for="evolucionesrick" class="form-label mt-4">EvolucionesRick</label>
                                    <input type="number" class="form-control" id="evolucionesrick" name="evolucionesrick" placeholder="Escribe la cantidad de evoluciones">
                                </div>
                                <div class="form-group">
                                    <label for="habitatrick" class="form-label mt-4">HabitatRick</label>
                                    <input type="text" class="form-control" id="habitatrick" name="habitatrick" placeholder="Escribe elhabitat del pokemon">
                                </div>
                                <div class="form-group">
                                    <label for="alturarick" class="form-label mt-4">AlturaRick</label>
                                    <input type="number" class="form-control" id="alturarick" name="alturarick" placeholder="Escribe la altura del pokemon">
                                </div>
                              
                                <div class="form-group">
                                    <label for="debilidadrick" class="form-label mt-4">DebilidadRick</label>
                                    <input type="text" class="form-control" id="debilidadrick" name="debilidadrick" placeholder="Escribe la debilidad del pokemon">
                                </div>
                            </fieldset>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                            <button type="submit" class="btn btn-primary">Crear Pokemon</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        
        <!-- Modal -->
        <div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Editar Pokemon</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div id="datoseditar">
                        
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
