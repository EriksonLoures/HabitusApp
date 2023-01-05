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
                
                Spacer(minLength: 60)
                
                VStack {
                  Image(systemName: "exclamationmark.octagon.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24, alignment: .center)
                  
                  Text("Nenhum hábito encontrado :(")
                }
                
              } else if case HabitusUIState.fullList(let rows) = viewModel.uiState {
                
                LazyVStack {
                  
                  ForEach(rows, content: HabitusCardView.init(viewModel:))
                  
                }.padding(.horizontal, 14)
                
              } else if case HabitusUIState.error = viewModel.uiState {
                  
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
        .foregroundColor(Color.orange)
      
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
        .stroke(Color.gray, lineWidth: 1)
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
