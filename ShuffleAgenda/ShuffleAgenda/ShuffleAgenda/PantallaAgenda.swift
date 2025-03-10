//
//  PantallaAgenda.swift
//  ShuffleAgenda
//
//  Created by alumno on 26/02/25.
//

import SwiftUI

struct PantallaAgenda: View {
    var largo_de_pantalla = UIScreen.main.bounds.width
    var ancho_de_pantalla = UIScreen.main.bounds.height
    var esquinas_redondeadas = CGSize(width: 25, height: 25)
    
    @State var pantalla_agregar_contacto: Bool = false
    @State var pantalla_elegir_contacto: Bool = false
    
    @State var contactos_actuales: [ContactoAgenda] = []
    
    var body: some View {
        ZStack {
            Color.purple
                .ignoresSafeArea()
            
            VStack {
                ScrollView {
                    LazyVStack(spacing: 20) {
                        ForEach(contactos_actuales) { contacto in
                            ContactoPrevista(contacto_a_mostar: contacto)
                                .background(Color.mint)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .clipShape(RoundedRectangle(cornerSize: esquinas_redondeadas))
                                .shadow(color: .black, radius: 1, x: 0, y: 1)
                        }
                    }
                    .padding(.vertical, 10)
                }
                .background(Color.purple)
                
                HStack {
                    ZStack {
                        Circle()
                            .fill(.purple)
                            .frame(width: 100)
                        
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 75, height: 75)
                    }
                    .onTapGesture {
                        print("Todavia no se implementa")
                        pantalla_agregar_contacto.toggle()
                    }
                    .shadow(color: .black, radius: 1, x: 0, y: 1)
                    
                    Spacer()
                    
                    ZStack {
                        Circle()
                            .fill(.purple)
                            .frame(width: 100)
                        
                        Image(systemName: "shuffle")
                            .resizable()
                            .frame(width: 75, height: 75)
                    }
                    .shadow(color: .black, radius: 1, x: 0, y: 1)
                    .onTapGesture {
                        if contactos_actuales.isEmpty {
                            print("La lista esta vacia")
                        } else {
                            pantalla_elegir_contacto.toggle()
                        }
                    }
                }
                .padding(.horizontal)
                .background(Color.mint)
            }
        }
        .sheet(isPresented: $pantalla_agregar_contacto) {
            AgregarContacto(boton_salir: {
                pantalla_agregar_contacto.toggle()
            }, boton_agregar: { nombre, numero in
                let contacto_nuevo = ContactoAgenda(nombre: nombre, telefono: numero)
                contactos_actuales.append(contacto_nuevo)
                pantalla_agregar_contacto.toggle()
            })
        }
        .sheet(isPresented: $pantalla_elegir_contacto) {
            Ganador(contacto_a_molestar: contactos_actuales.randomElement()!)
        }
    }
}

#Preview {
    PantallaAgenda()
}
