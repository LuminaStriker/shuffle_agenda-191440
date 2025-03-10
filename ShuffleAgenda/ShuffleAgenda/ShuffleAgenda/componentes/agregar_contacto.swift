//
//  agregar_contacto.swift
//  ShuffleAgenda
//
//  Created by alumno on 03/03/25.
//

import SwiftUI

extension Color {
    init(hex: Int, opacity: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: opacity
        )
    }
}

struct AgregarContacto: View {
    @State private var nombre: String = ""
    @State private var numero_telefonico: String = ""
    
    var boton_salir: () -> Void = {}
    var boton_agregar: (_ nombre: String, _ numero: String) -> Void = {nombre, numero in}
    
    var body: some View {
        VStack{
            Text("Colocar etiqueta nombre")
            TextField("placeholder", text: $nombre)
                .frame(height: 35)
                .padding(10)
                .background(Color.white)
            Text("Campo numero telefonico")
            TextField("placeholder", text: $numero_telefonico)
                .frame(height: 35)
                .padding(10)
                .background(Color.white)
            HStack{
                Image(systemName: "person.crop.circle.badge.plus")
                    .resizable()
                        .frame(width: 75, height: 70)
                        .onTapGesture {
                            boton_agregar(nombre, numero_telefonico)
                        }
                Spacer()
                Image(systemName: "return")
                    .resizable()
                        .frame(width: 75, height: 75)
                        .background(Color.red)
                        .onTapGesture {
                            boton_salir()
                        }
            }
            .background(Color.mint)
        }
        .background(Color.purple)
        
    }
}

#Preview {
    AgregarContacto()
}
