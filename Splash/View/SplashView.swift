//
//  SplashView.swift
//  HabitusApp
//
//  Created by Erik Loures on 27/11/22.
//

import SwiftUI

struct SplashView: View {
    
    @ObservedObject var viewModel: SplashViewModel
    
    var body: some View {
        Group {
            switch viewModel.uiState {
            case .loading:
            loadingView()
            case .goToSignInScreen:
                //navega para proxima tela
                viewModel.signInView()
            case .goToHomeScreen:
                viewModel.homeView()
            case .error(let msg):
                Text("\(msg)")
            }
        }.onAppear(perform: viewModel.onAppear)
    }
}

// 3. funcoes em extensions
extension SplashView {
    func loadingView() -> some View {
        ZStack {
            Image("icon3")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(80)
                .ignoresSafeArea()
        }
    }
}


struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            let viewModel = SplashViewModel(interactor: SplashInteractor())
            SplashView(viewModel: viewModel)
            .previewDevice("iPhone 11")
            .preferredColorScheme($0)
    }
  }
}
