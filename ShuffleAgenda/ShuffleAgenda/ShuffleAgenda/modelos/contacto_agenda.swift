//
//  contacto_agenda.swift
//  ShuffleAgenda
//
//  Created by alumno on 26/02/25.
//

import SwiftUI

struct ContactoAgenda: Identifiable {
    var nombre: String
    var telefono: String
    
    var id: String{ nombre }
    /*
    var nombre = "Pepito Veraz"
    
    var nombre: set{
        let nombre_validado = filtrar_palabras(value)
        nombre = nombre_validado
    } get{
        return nombre.split(" ")[0]
    }
     */
}

