//
//  HomeView.swift
//  HabitusApp
//
//  Created by Erik Loures on 29/11/22.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    @State var selection = 0

    var body: some View {
        TabView(selection: $selection) {
            viewModel.HabitusView()
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                    Text("Habitus")
                }.tag(0)
            Text("Conteúdos de Gráficos \(selection)")
                .tabItem {
                    Image(systemName: "chart.bar")
                    Text("Gráficos")
                }.tag(1)
            Text("Conteúdos de perfil \(selection)")
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Perfil")
                }.tag(2)
        }
        .background(Color.white)
        .accentColor(Color.black)
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel())
    }
}
