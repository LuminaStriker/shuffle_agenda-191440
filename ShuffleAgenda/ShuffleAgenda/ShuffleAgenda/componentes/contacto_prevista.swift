//
//  contacto_prevista.swift
//  ShuffleAgenda
//
//  Created by alumno on 26/02/25.
//

import SwiftUI

struct ContactoPrevista: View {
    var contacto_a_mostar:ContactoAgenda
    var al_pulsar: () -> Void = {print("No se ha implementado")}
    var esquinas_redondeadas = CGSize(width: 25, height: 25)
    
    var body: some View {
        HStack(alignment: VerticalAlignment.center){
            VStack{
                Image(uiImage: #imageLiteral(resourceName: "imagen.jpg"))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 75)
                    .clipShape(RoundedRectangle(cornerSize: esquinas_redondeadas))
            }
            Spacer()
            VStack{
                Text(contacto_a_mostar.nombre)
                Spacer()
                Text(contacto_a_mostar.telefono)
            }
            Spacer()
        }
        .padding(10)
        .background(Color.mint)
    }
}

#Preview {
    ContactoPrevista(contacto_a_mostar: ContactoAgenda(nombre: "kljh", telefono: "324"))
}
