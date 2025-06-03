class Hogar {
  var property nivelDeMugre
  const nivelDeConfort

  method esBueno() = nivelDeMugre <= (nivelDeConfort / 2)
}
class Huerta {
  var property capacidadDeProduccion

  method esBueno() = capacidadDeProduccion > valorDeLaHuerta.valor()
}
object valorDeLaHuerta {
  var property valor = 10
}
class Mascota {
  var property nivelDeSalud

  method esBueno() = nivelDeSalud > 250
}
class Plaga {
  var property poblacion

  method transmiteEnfermedad() = poblacion >= 10
}
class PlagaCucarachas inherits Plaga {
  var property peso

  method pesoPromedio() = peso / poblacion
  method nivelDeDanio() = poblacion / 2
  override method transmiteEnfermedad() = super() && self.pesoPromedio() >= 10
}
class PlagaPulgas inherits Plaga {
  method nivelDeDanio() = poblacion * 2
}
class PlagaGarrapata inherits Plaga {
  method nivelDeDanio() = poblacion * 2
}
class PlagaMosquitos inherits Plaga {
  method nivelDeDanio() = poblacion
  override method transmiteEnfermedad() = super() && poblacion % 3 == 0
}