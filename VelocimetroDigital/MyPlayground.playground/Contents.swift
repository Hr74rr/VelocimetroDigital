//Velocimetro digital


import UIKit

//declaro enumerador con 4 valores del tipo Int
enum Velocidades: Int{
    case Apagado = 0
    case VelocidadBaja = 20
    case VelocidadMedia = 50
    case VelocidadAlta = 120
    
    //inicializador enumerador
    init(velocidadInicial: Velocidades){
        self = velocidadInicial
    }
    
}

//declaro clase Auto

class Auto {
    
    //variable instancia del numerador Velocidades . variable tipo Velocidades
    var velocidad : Velocidades
    
    //inicializador
    //hay que inicializar velocidad de la propia clase  (self)
    //aplicandole un valor de la enum Velocidades por defecto (.Apagado)
    
    init(){
        self.velocidad = Velocidades(velocidadInicial: .Apagado)
    }
    
    //Función para que cambie de velocidad
    //que devolverá una tupla de dos elementos
    //ella misma va cambiando el valor en velocidad cada vez que es llamada
    func cambioDeVelocidad() -> (actual : Int, velocidadEnCadena: String) {
        
        switch velocidad {
            
        case .Apagado :
            velocidad = .VelocidadBaja
            return (velocidad.rawValue, "Velocidad Baja")
        case .VelocidadBaja:
            velocidad = .VelocidadMedia
            return (velocidad.rawValue, "Velocidad Media")
        case .VelocidadMedia:
            velocidad = .VelocidadAlta
            return (velocidad.rawValue, "Velocidad Alta")
        case .VelocidadAlta:
            velocidad = .VelocidadMedia
            return (velocidad.rawValue, "Velocidad Media")
            
        }
    }
}



//zona de pruebas del playground

var auto: Auto = Auto() // instancio Auto

var rdo : (actual : Int , velocidadEnCadena : String) //declaro tupla para almacenar resultado de la funcion
print ("\(auto.velocidad.hashValue) ,\t\(auto.velocidad)") //imprimo 0, apagado

//bucle que se ejecuta 20 veces y llama 20 veces a la funcion de cambio de velocidad
for i in 1...20 {
    rdo = auto.cambioDeVelocidad() //llamada funcion
    print ("\(rdo.actual), \t\(rdo.velocidadEnCadena)") //imprimo resultado
}



