<%@page import="modelo.Pokemons"%>
<%
    Pokemons pok = session.getAttribute("PokemonAEditar") != null ? (Pokemons) session.getAttribute("PokemonAEditar") : new Pokemons();
%>

<script>
    $(document).ready(function () {
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

<form id="frmeditapokemon" name="frmeditapokemon">
    <input type="hidden" class="form-control" id="accion" name="accion" value="GuardaPokemon">
    <div class="modal-body">

        <fieldset>
            <div class="form-group">
                <label for="nombrerick" class="form-label mt-4">NombreRick</label>>
                <input type="text" class="form-control" id="nombrerick" name="nombrerick" value="<%= pok.getNombrerick()%>" placeholder="Escribe el nombre del pokemon">
            </div>
            <div class="form-group">
                <label for="tiporick" class="form-label mt-4">TipoRick</label>
                <input type="text" class="form-control" id="tiporick" name="tiporick" value="<%= pok.getTiporick() %>" placeholder="Escribe el tipo de pokemon">
            </div>
            <div class="form-group">
                <label for="evolucionesrick" class="form-label mt-4">EvolucionesRick</label>
                <input type="number" class="form-control" id="evolucionesrick" name="evolucionesrick" value="<%= pok.getEvolucionesrick() %>" placeholder="Escribe la cantidad de evoluciones">
            </div>
            <div class="form-group">
                <label for="habitatrick" class="form-label mt-4">HabitatRick</label>
                <input type="text" class="form-control" id="habitatrick" name="habitatrick" value="<%= pok.getHabitatrick() %>" placeholder="Escribe elhabitat del pokemon">
            </div>
            <div class="form-group">
                <label for="alturarick" class="form-label mt-4">AlturaRick</label>
                <input type="number" class="form-control" id="alturarick" name="alturarick" value="<%= pok.getAlturarick() %>" placeholder="Escribe la altura del pokemon">
            </div>
    </div>
    <div class="form-group">
        <label for="debilidadrick" class="form-label mt-4">DebilidadRick</label>
        <input type="text" class="form-control" id="debilidadrick" name="debilidadrick" value="<%= pok.getDebilidadrick() %>" placeholder="Escribe la debilidad del pokemon">
    </div>
</fieldset>

</div>
<div class="modal-footer">
    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
    <button type="submit" class="btn btn-primary">Actualizar Pokemon</button>
</div>
</form>