package audiotext

class Texto {
    static searchable = true
    String titulo
    String texto
    String toString() {
        "${titulo}"
    }
    static mapping = {
        texto type: "text"
    }
    static constraints = {
       
    }
}
