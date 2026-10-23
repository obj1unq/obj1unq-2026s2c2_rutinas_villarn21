import gimnasia.*

class Persona {
  var peso
  
  method tiempo()
  
  method caloriasPorKg()
  
  method peso() = peso
  
  method pesoPerdido(rutina) = self.caloriasAPerderEn(
    rutina
  ) / self.caloriasPorKg()
  
  method hacerRutina(rutina) {
    self.validarEjercitar(rutina)
    peso = peso - self.pesoPerdido(rutina)
  }
  
  method caloriasAPerderEn(rutina) = rutina.caloriasConsumidas(self.tiempo())
  
  method validarEjercitar(rutina) {
    if (not self.puedeEjercitar(rutina)) self.error(
        "No puede realizar la rutina"
      )
  }
  
  method puedeEjercitar(rutina)
}

class Sedentaria inherits Persona {
  var property tiempoEjercicio
  
  override method caloriasPorKg() = 7000
  
  override method puedeEjercitar(rutina) = peso > 50
  
  override method tiempo() = tiempoEjercicio
}

class Atleta inherits Persona {
  override method caloriasPorKg() = 8000
  
  override method puedeEjercitar(rutina) = self.caloriasAPerderEn(
    rutina
  ) > 10000
  
  override method pesoPerdido(rutina) = super(rutina) - 1
  
  override method tiempo() = 90
}