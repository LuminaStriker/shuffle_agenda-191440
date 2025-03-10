//
//  pantalla_ganador.swift
//  ShuffleAgenda
//
//  Created by alumno on 05/03/25.
//

import SwiftUI

var contacto_alterno = ContactoAgenda(nombre: "Telefoncio", telefono: "6565102367")

struct Ganador: View {
    var contacto_a_molestar: ContactoAgenda
    var body: some View {
        VStack{
            Image(uiImage: #imageLiteral(resourceName: "imagen.jpg"))
                .resizable()
                .scaledToFit()
                .frame(width: 150)
            Text("El contacto escogido para molestar es: ")
            Text(contacto_a_molestar.nombre)
            Text(contacto_a_molestar.telefono)
        }
         .background(Color.green)
         .shadow(color: .black, radius: 1, x: 0, y: 1)
    }
}

#Preview {
    Ganador(contacto_a_molestar: contacto_alterno)
}
