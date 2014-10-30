package audiodiccionario

class Definicion {
    String palabra
    String definicion
    Diccionario diccionario
    static belongsTo = Diccionario
    String toString() {
        "${palabra}"
    }
    static constraints = {
    }
}
