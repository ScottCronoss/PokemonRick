package modelo;
// Generated 6/06/2021 08:16:50 PM by Hibernate Tools 4.3.1



/**
 * Pokemons generated by hbm2java
 */
public class Pokemons  implements java.io.Serializable {


     private Integer idpokemonrick;
     private String nombrerick;
     private String tiporick;
     private int evolucionesrick;
     private String habitatrick;
     private byte alturarick;
     private String debilidadrick;

    public Pokemons() {
    }

    public Pokemons(String nombrerick, String tiporick, int evolucionesrick, String habitatrick, byte alturarick, String debilidadrick) {
       this.nombrerick = nombrerick;
       this.tiporick = tiporick;
       this.evolucionesrick = evolucionesrick;
       this.habitatrick = habitatrick;
       this.alturarick = alturarick;
       this.debilidadrick = debilidadrick;
    }
   
    public Integer getIdpokemonrick() {
        return this.idpokemonrick;
    }
    
    public void setIdpokemonrick(Integer idpokemonrick) {
        this.idpokemonrick = idpokemonrick;
    }
    public String getNombrerick() {
        return this.nombrerick;
    }
    
    public void setNombrerick(String nombrerick) {
        this.nombrerick = nombrerick;
    }
    public String getTiporick() {
        return this.tiporick;
    }
    
    public void setTiporick(String tiporick) {
        this.tiporick = tiporick;
    }
    public int getEvolucionesrick() {
        return this.evolucionesrick;
    }
    
    public void setEvolucionesrick(int evolucionesrick) {
        this.evolucionesrick = evolucionesrick;
    }
    public String getHabitatrick() {
        return this.habitatrick;
    }
    
    public void setHabitatrick(String habitatrick) {
        this.habitatrick = habitatrick;
    }
    public byte getAlturarick() {
        return this.alturarick;
    }
    
    public void setAlturarick(byte alturarick) {
        this.alturarick = alturarick;
    }
    public String getDebilidadrick() {
        return this.debilidadrick;
    }
    
    public void setDebilidadrick(String debilidadrick) {
        this.debilidadrick = debilidadrick;
    }




}


