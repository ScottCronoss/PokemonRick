/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Pokemons;

/**
 *
 * @author NoelCS
 */
public class PokemonServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("accion") != null) {
            if (request.getParameter("accion").equals("Ordenar") && request.getParameter("campo") != null) {
                String campo = request.getParameter("campo");
                try {
                    request.getSession().setAttribute("listaPokemons", new PokemonControl().ConsultarTodos(campo));
                } catch (Throwable ex) {
                    Logger.getLogger(PokemonServlet.class.getName()).log(Level.SEVERE, null, ex);
                }

            }
            if (request.getParameter("accion").equals("EliminarPokemon") && request.getParameter("indice") != null) {
                List<Pokemons> lista = (List<Pokemons>) request.getSession().getAttribute("listaPokemons");
                int indice = Integer.parseInt(request.getParameter("indice"));
                try {
                    new PokemonControl().EliminarPokemon(lista.get(indice));
                    request.getSession().setAttribute("listaPokemons", new PokemonControl().ConsultarTodos());
                } catch (Throwable ex) {
                    Logger.getLogger(PokemonServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (request.getParameter("accion").equals("CargaDatosPokemon") && request.getParameter("indice") != null) {
                List<Pokemons> lista = (List<Pokemons>) request.getSession().getAttribute("listaPokemons");
                int indice = Integer.parseInt(request.getParameter("indice"));
                request.getSession().setAttribute("PokemonAEditar", lista.get(indice));
            }
            if (request.getParameter("accion").equals("CreaPokemon")) {
                Pokemons pok=new Pokemons();
                if(request.getParameter("nombrerick")!=null)pok.setNombrerick(request.getParameter("nombrerick"));
                if(request.getParameter("tiporick")!=null)pok.setTiporick(request.getParameter("tiporick"));
                if(request.getParameter("evolucionesrick")!=null)pok.setEvolucionesrick(Byte.parseByte(request.getParameter("evolucionesrick")));
                if(request.getParameter("habitatrick")!=null)pok.setHabitatrick (request.getParameter("habitatrick"));
                if(request.getParameter("alturarick")!=null)pok.setAlturarick((byte) Short.parseShort(request.getParameter("alturarick")));
                if(request.getParameter("debilidadrick")!=null)pok.setDebilidadrick(request.getParameter("debilidadrick"));
                try {
                    new PokemonControl().GuardaPokemon(pok);
                    request.getSession().setAttribute("listaPokemons", new PokemonControl().ConsultarTodos());
                } catch (Throwable ex) {
                    Logger.getLogger(PokemonServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (request.getParameter("accion").equals("GuardaPokemon")) {
                Pokemons pok=(Pokemons)request.getSession().getAttribute("PokemonAEditar");
                if(request.getParameter("nombrerick")!=null)pok.setNombrerick(request.getParameter("nombrerick"));
                if(request.getParameter("tiporick")!=null)pok.setTiporick(request.getParameter("tiporick"));
                if(request.getParameter("evolucionesrick")!=null)pok.setEvolucionesrick(Byte.parseByte(request.getParameter("evolucionesrick")));
                if(request.getParameter("habitatrick")!=null)pok.setHabitatrick (request.getParameter("habitatrick"));
                if(request.getParameter("alturarick")!=null)pok.setAlturarick((byte) Short.parseShort(request.getParameter("alturarick")));
                if(request.getParameter("debilidadrick")!=null)pok.setDebilidadrick(request.getParameter("debilidadrick"));
                try {
                    new PokemonControl().GuardaPokemon(pok);
                    request.getSession().setAttribute("listaPokemons", new PokemonControl().ConsultarTodos());
                } catch (Throwable ex) {
                    Logger.getLogger(PokemonServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
