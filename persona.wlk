import gimnasia.*

class Persona{
    var peso 
    method tiempo()
    method caloriasPorKg()   
    method pesoPerdido(rutina){
        return rutina.caloriasConsumidas(self.tiempo()) / self.caloriasPorKg()
    }
    method hacerRutina(rutina){
        self.validarEjercitar(rutina)
        peso = peso - self.pesoPerdido(rutina)
    }
    method validarEjercitar(rutina) {
        if(not self.puedeEjercitar(rutina)){
            self.error("No puede realizar la rutina")
        }    
    }
    method puedeEjercitar(rutina)
}

class Sedentaria inherits Persona{
    var property tiempoEjercicio 
    override method caloriasPorKg(){
        return 7000
    }
    override method puedeEjercitar(rutina){
        return (peso < 51)
    }
    override method tiempo(){
        return tiempoEjercicio
    }
}

class Atleta inherits Persona{
    override method caloriasPorKg(){
        return 8000
    }
    override method puedeEjercitar(rutina){
        return(rutina.caloriasConsumidas(self.tiempo()) <= 1000)
    }
    override method pesoPerdido(rutina){
        return super(rutina) - 1
    }
    override method tiempo(){
        return 90
    }   
}