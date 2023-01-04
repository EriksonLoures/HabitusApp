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
            VStack(spacing: 12) {
              
              topContainer
              
              addButton
         
              if case HabitusUIState.emptyList = viewModel.uiState {
                
                Spacer(minLength: 80)
                
                VStack {
                  Image(systemName: "exclamationmark.octagon.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 22, alignment: .center)
                  
                  Text("Nenhum hábito encontrado")
                }
                
              } else if case HabitusUIState.fullList(let rows) = viewModel.uiState {
                
                LazyVStack {
                  
                  ForEach(rows, content: HabitusCardView.init(viewModel:))
                  
                }.padding(.horizontal, 5)
                
              } else if case HabitusUIState.error(let msg) = viewModel.uiState {
                  Text("")
                      .alert(isPresented: .constant(true)) {
                  Alert(
                    title: Text("Ops! \(msg)"),
                    message: Text("Tentar novamente"),
                    primaryButton: .default(Text ("Sim")) {
                        // aqui ele fará uma nova tentativa
                    },
                    secondaryButton: .cancel()
                  )
                }
              }
            }
          }.navigationTitle("Meus Hábitos")
          
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
        // texto atencao
        .foregroundColor(Color.red)
      
      Text(viewModel.headline)
        .font(Font.system(.title3).bold())
        .foregroundColor(Color("textColor"))
      
      Text(viewModel.desc)
        .font(Font.system(.subheadline))
        .foregroundColor(Color("textColor"))
    }
    .frame(maxWidth: .infinity)
    .padding(.vertical, 32)
    .overlay(
      RoundedRectangle(cornerRadius: 6)
        .stroke(Color.blue, lineWidth: 1)
    )
    .padding(.horizontal, 16)
    .padding(.top, 16)
  }
}

extension HabitusView {
  var addButton: some View {
    NavigationLink(destination: Text("Tela de adicionar")
        .frame(maxWidth: .infinity, maxHeight: .infinity)) {
      Label("Criar Hábito", systemImage: "plus.app")
        .modifier(ButtonStyle())
    }
    .padding(.horizontal, 16)
  }
}

struct HabitusView_Previews: PreviewProvider {
  static var previews: some View {
    ForEach(ColorScheme.allCases, id: \.self) {
      HomeViewRouter.makeHabitusView()
        .previewDevice("iPhone 11")
        .preferredColorScheme($0)
    }
  }
}
