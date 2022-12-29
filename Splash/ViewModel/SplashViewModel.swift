//
//  SplashViewModel.swift
//  HabitusApp
//
//  Created by Erik Loures on 28/11/22.
//

import SwiftUI
import Combine

class SplashViewModel: ObservableObject {
    
    @Published var uiState: SplashUIState = .loading
    
    private var cancellableAuth: AnyCancellable?
    //private var cancellableRequest: AnyCancellable?

      
    private let interactor: SplashInteractor
    
      init(interactor: SplashInteractor) {
          self.interactor = interactor
 
    }
    
    deinit {
      cancellableAuth?.cancel()
    }
    
    func onAppear() {
       cancellableAuth = interactor.fetchAuth()
            .receive(on: DispatchQueue.main)
            .sink { userAuth in
            // se o userAuth == nulo -> login
            if userAuth == nil {
              self.uiState = .goToSignInScreen
            // senao se userAuth
            } else if (Date().timeIntervalSince1970 > Date().timeIntervalSince1970 + Double(userAuth!.expires)){
            // chamar o refresh token na API
                print("token expirou")
            }
            // senao -> Tela princial
            else {
              self.uiState = .goToHomeScreen
            }
        }
    }
}
extension SplashViewModel {
        func signInView() -> some View {
        return SplashViewRouter.makeSignInView()
    }
}
