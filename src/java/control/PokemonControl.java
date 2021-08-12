package control;

import java.util.List;
import modelo.Pokemons;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author NoelCS
 */
public class PokemonControl {

    public List<Pokemons> ConsultarTodos() throws Throwable {
        List<Pokemons> lista;
        try (ConexionControl conn = new ConexionControl()) {
            Session s = conn.getSesionHibernate();
            lista = s.createCriteria(Pokemons.class).list();
        }
        return lista;
    }

    public List<Pokemons> ConsultarTodos(String orden) throws Throwable {
        List<Pokemons> lista;
        try (ConexionControl conn = new ConexionControl()) {
            Session s = conn.getSesionHibernate();
            lista = s.createCriteria(Pokemons.class).addOrder(Order.asc(orden)).list();
        }
        return lista;
    }
    public void EliminarPokemon(Pokemons pokemons) throws Throwable {
        try (ConexionControl conn = new ConexionControl()) {
            Session s = conn.getSesionHibernate();
            s.delete(pokemons);
            conn.getTransaccion().commit();
        }
    }
    public void GuardaPokemon(Pokemons pokemons) throws Throwable {
        try (ConexionControl conn = new ConexionControl()) {
            Session s = conn.getSesionHibernate();
            s.saveOrUpdate(pokemons);
            conn.getTransaccion().commit();
        }
    }
}
