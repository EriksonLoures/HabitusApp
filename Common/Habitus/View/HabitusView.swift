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
                ScrollView(showsIndicators: false) {
                    VStack {
                topContainer
                        
               

                if case HabitusUIState.emptyList = viewModel.uiState {
                    
                } else if case HabitusUIState.fullList = viewModel.uiState {
                    
                } else if case HabitusUIState.error = viewModel.uiState {
            }
          }
        }
      }
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
    }
}

struct HabitusView_Previws: PreviewProvider {
    static var previews: some View {
        HomeViewRouter.makeHabitusView()
    }
}
