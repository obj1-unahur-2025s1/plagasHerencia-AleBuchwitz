//elementos
class Hogar {
  var property nivelDeMugre
  const nivelDeConfort

  method esBueno() = nivelDeMugre <= (nivelDeConfort / 2)
  method ataqueDePlaga(plaga) {
    nivelDeMugre += plaga.nivelDeDanio()
  }
}
class Huerta {
  var property capacidadDeProduccion

  method esBueno() = capacidadDeProduccion > valorDeLaHuerta.valor()
  method ataqueDePlaga(plaga) {
    capacidadDeProduccion -= (plaga.nivelDeDanio() * 0.1)
    if(plaga.transmiteEnfermedad()){
      capacidadDeProduccion -= 10
    }
  }
}
object valorDeLaHuerta {
  var property valor = 10
}
class Mascota {
  var property nivelDeSalud

  method esBueno() = nivelDeSalud > 250
  method ataqueDePlaga(plaga) {
    if(plaga.transmiteEnfermedad()){
      nivelDeSalud -= plaga.nivelDeDanio()
    }
  }
}
//barrio
class Barrio {
  const elementos = #{}

  method esCopado() = elementos.count({e => e.esBueno()}) > elementos.count({e => !e.esBueno()})
}
//plagas
class Plaga {
  var property poblacion

  method transmiteEnfermedad() = poblacion >= 10
  method atacarElemento(elemento) {
    poblacion += poblacion * 0.1
    elemento.ataqueDePlaga(self)
  }
}
class PlagaCucarachas inherits Plaga {
  var property peso

  method pesoPromedio() = peso / poblacion
  method nivelDeDanio() = poblacion / 2
  override method transmiteEnfermedad() = super() && self.pesoPromedio() >= 10
  override method atacarElemento(elemento) {
    super(elemento)
    peso += 2
  }
}
class PlagaPulgas inherits Plaga {
  method nivelDeDanio() = poblacion * 2
}
class PlagaGarrapata inherits Plaga {
  method nivelDeDanio() = poblacion * 2
  override method atacarElemento(elemento) {
    poblacion += poblacion * 0.2
    elemento.ataqueDePlaga(self)
  }
}
class PlagaMosquitos inherits Plaga {
  method nivelDeDanio() = poblacion
  override method transmiteEnfermedad() = super() && poblacion % 3 == 0
}