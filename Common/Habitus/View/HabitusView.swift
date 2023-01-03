//
//  HabitusView.swift
//  HabitusApp
//
//  Created by Erik Loures on 01/01/23.
//

import Foundation
import SwiftUI

struct HabitusView: View {
    @ObservedObject var viewModel: HabitusViewModel
    var body: some View {
        ZStack {
            if case HabitusUIState.loading = viewModel.uiState {
                progress
            } else {
                
    NavigationView {
        ScrollView(showsIndicators: false) {
            // espacamento do botao criar
            VStack(spacing: 30){
//                
                
                topContainer
               
                addButton
                if case HabitusUIState.emptyList = viewModel.uiState {
                    // espacamento do alerta 
//                    Spacer(minLength: 10)
                    
                    VStack {
                        Image(systemName: "exclamationmark.octagon.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 30, alignment: .center)
                        Text("Nenhum Habitus encontrado")
                    }
                    
                } else if case HabitusUIState.fullList(let rows) = viewModel.uiState {
                    
                    LazyVStack {
                    
                    ForEach(rows, content: HabitusCardView.init(viewModel:))
                    }.padding(.horizontal)
                    
                } else if case HabitusUIState.error = viewModel.uiState {
              }
            }
          }
        }
      }
        }.onAppear {
            viewModel.onAppear()
        }
  }
}


extension HabitusView {
    var progress: some View {
        ProgressView()
    }
}

extension HabitusView {
    var topContainer: some View {
        VStack(alignment: .center, spacing: 12) {
            Image(systemName: "exclamationmark.triangle")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50, alignment: .center)
            Text(viewModel.title)
                .font(Font.system(.title).bold())
                .foregroundColor(Color.red)
            Text(viewModel.headline)
                .font(Font.system(.title).bold())
                .foregroundColor(Color.purple)
            Text(viewModel.desc)
                .font(Font.system(.title3).bold())
                .foregroundColor(Color("textColor"))
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 20)
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.gray, lineWidth: 10)
        )
        .padding(.horizontal, 16)
        .padding(.top, 6)
    }
}

extension HabitusView {
    
    var addButton: some View {
        NavigationLink(destination: Text("Tela e adicionar")
            .frame(maxWidth: .infinity)) {
            Label("Criar Hábitus", systemImage: "plus.app")
            .modifier(ButtonStyle())
        }
            .padding(.horizontal, 2)
        
    }
}

struct HabitusView_Previws: PreviewProvider {
    static var previews: some View {
        ForEach (ColorScheme.allCases, id: \.self) {
            HomeViewRouter.makeHabitusView()
                .previewDevice ("")
                .preferredColorScheme ($0)
        }
    }
}
