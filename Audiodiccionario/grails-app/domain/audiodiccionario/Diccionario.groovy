package audiodiccionario

class Diccionario {
    String creador
    String descripcion
    String Tematica
    String toString() {
        "${descripcion}"
    }
    static belongsTo = Diccionario //Sin mapa [author : Author] 
    static hasMany = [definiciones : Definicion]

    static constraints = {
    }
}
