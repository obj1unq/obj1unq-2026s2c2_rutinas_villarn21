class Rutina {
    method descanso(timepo)
    method intensidad()
    method caloriasConsumidas(tiempo){
        return 100 * (tiempo - self.descanso(tiempo)) * self.intensidad()
    }
}

class Running inherits Rutina {
  var property intensidad  
  override method descanso(tiempo){
    if (tiempo > 20){
        return  5
    }else{
        return  2
    }
  }
}

class Maraton inherits Running{
    override method caloriasConsumidas(tiempo){
        return super(tiempo) * 2
    }
}

class Remo inherits Rutina{
    override method intensidad(){
        return 1.3
    }
    override method descanso(tiempo){
        return tiempo / 5
    }
}

class RemoCompeti inherits Remo{
  override method intensidad() {
    return 1.7
  }
  override method descanso(tiempo){
    return (super(tiempo) - 3).max(2)
  }
}
/*4. Reflexión:
Indicar un template method en la solución. Dónde está el template y cuales son los métodos hooks. Indicar quienes implementan métodos hooks
-El template method en este caso es 'caloriasConsumidas(tiempo)' ya que su algoritmo es definido solo una vez.
-Los metodos "hooks" serina descanso(timepo) y intensidad()
-Los implementan:Running, Remo, Maraton y RemoCompeti
*/