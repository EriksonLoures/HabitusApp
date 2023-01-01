//
//  SplashView.swift
//  HabitusApp
//
//  Created by Erik Loures on 27/11/22.
//

import SwiftUI

struct SplashView: View {
    
    @ObservedObject var ViewModel: SplashViewModel
    
    var body: some View {
        Group {
            switch ViewModel.uiState {
            case .loading:
            loadingView()
            case .goToSignInScreen:
                //navega para proxima tela
                ViewModel.signInView()
            case .goToHomeScreen:
                Text("tela principal")
            case .error(let msg):
                Text("\(msg)")
            }
        }.onAppear(perform: ViewModel.onAppear)
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
            SplashView(ViewModel: viewModel)
            .previewDevice("iPhone 11")
            .preferredColorScheme($0)
    }
  }
}
