package audiodiccionario
import grails.rest.*

@Resource(uri='/diccionario')
class Diccionario {
    String creador
    String descripcion
    String tematica
    String toString() {
        "${descripcion}"
    }
 // static belongsTo = [diccionario : Diccionario] 
    static hasMany = [definiciones : Definicion]

    static constraints = {
        
    }
}
