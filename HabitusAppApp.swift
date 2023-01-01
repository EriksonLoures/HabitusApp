//
//  HabitusAppApp.swift
//  HabitusApp
//
//  Created by Erik Loures on 27/11/22.
//

import SwiftUI

@main
struct HabitusAppApp: App {
    var body: some Scene {
        WindowGroup {
            SplashView(viewModel: SplashViewModel(interactor: SplashInteractor()))
        }
    }
}
