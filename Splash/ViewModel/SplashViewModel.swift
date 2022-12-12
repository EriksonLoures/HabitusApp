//
//  SplashViewModel.swift
//  HabitusApp
//
//  Created by Erik Loures on 28/11/22.
//

import SwiftUI

class SplashViewModel: ObservableObject {
    
    @Published var uiState: SplashUIState = .loading
    
    func onAppear() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            //self.uiState = .error("erro na resposta do servidor")
            self.uiState = .goToSignInScreen    
        }
    }
}

extension SplashViewModel {
        func signInView() -> some View {
        return SplashViewRouter.makeSignInView()
    }
}
