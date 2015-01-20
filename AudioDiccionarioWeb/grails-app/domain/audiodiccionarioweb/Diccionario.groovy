package audiodiccionarioweb

class Diccionario {
    String nombre
    String nivelEducativo
    String toString() {
        "${nombre}"
    }
    static hasMany = [vocabulario: Vocabulario]
   

    static constraints = {
    }
}
