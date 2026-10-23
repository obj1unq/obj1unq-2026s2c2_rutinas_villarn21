import persona.*
import gimnasia.*

class Club {
  const predios = #{}
  
  method mejorPredioPara(persona) = predios.max(
    { predio => predio.caloriasTotalesPara(persona) }
  )
  
  method prediosTranquisPara(persona) = predios.filter(
    { predio => predio.esPredioTranquiPara(persona) }
  )
  
  method rutinasMasExigentesPara(persona) = predios.map(
    { predio => predio.rutinaMasExigentePara(persona) }
  )
}

class Predio {
  const rutinas = #{}
  
  method caloriasTotalesPara(persona) = rutinas.sum(
    { rutina => persona.caloriasAPerderEn(rutina) }
  )
  
  method esPredioTranquiPara(persona) = rutinas.any(
    { rutina => persona.caloriasAPerderEn(rutina) < 500 }
  )
  
  method rutinaMasExigentePara(persona) = rutinas.max(
    { rutina => persona.caloriasAPerderEn(rutina) }
  )
}