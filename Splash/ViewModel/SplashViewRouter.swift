//
//  SplashViewRouter.swift
//  HabitusApp
//
//  Created by Erik Loures on 28/11/22.
//

import SwiftUI

enum SplashViewRouter {
    
    static func makeSignInView() -> some View {
        let viewModel = SignInViewModel()
        return SignInView(viewModel: viewModel)
        
        
    }
    
    
}
