package audiodiccionarioweb

class Vocabulario {
    static searchable = true 
    String palabra
    String definicion
    String toString() {
        "${palabra}"
    }
  
    //static belongsTo = [diccionario:Diccionario]
    static constraints = {
        definicion size: 5..100
    }
}
