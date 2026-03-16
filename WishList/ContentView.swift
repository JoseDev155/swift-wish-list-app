//
//  ContentView.swift
//  WishList
//
//  Created by Jose Ramos on 15/3/26.
//

import SwiftUI

// Definición del objeto Deseo
struct Deseo: Identifiable {
    let id = UUID() // Genera un ID único automáticamente
    var nombre: String
}

struct ContentView: View {
    // Estado para la lista de datos
    @State private var listaDeDeseos: [Deseo] = [
        Deseo(nombre: "Dominar Xcode"),
        Deseo(nombre: "Publicar mi primera App")
    ]
    
    // Estado para capturar lo que el usuario escribe
    @State private var nuevoDeseoTexto: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                // Cabecera para agregar nuevos elementos
                HStack {
                    TextField("Escribe un deseo...", text: $nuevoDeseoTexto)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button(action: agregarDeseo) {
                        Image(systemName: "plus.circle.fill").font(.title)
                    }
                    .disabled(nuevoDeseoTexto.isEmpty) // Validación simple
                }
                .padding()
                
                // Listado con funciones de borrado
                List {
                    ForEach(listaDeDeseos) { deseo in
                        Text(deseo.nombre)
                    }
                    .onDelete(perform: borrarDeseo)
                }
            }
            .navigationTitle("Wishlist 2026")
            .toolbar { EditButton() } // Permite gestionar la lista
        }
    }
    
    // Función para insertar datos con animación
    func agregarDeseo() {
        withAnimation {
            let nuevo = Deseo(nombre: nuevoDeseoTexto)
            listaDeDeseos.insert(nuevo, at: 0)
            nuevoDeseoTexto = ""
        }
    }

    // Función para eliminar datos
    func borrarDeseo(at offsets: IndexSet) {
        listaDeDeseos.remove(atOffsets: offsets)
    }
}
