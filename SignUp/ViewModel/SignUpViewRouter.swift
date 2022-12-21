//
//  SignUpViewRouter.swift
//  HabitusApp
//
//  Created by Erik Loures on 04/12/22.
//
import SwiftUI

enum SignUpViewRouter {
  
  static func makeHomeView() -> some View {
    let viewModel = HomeViewModel()
    return HomeView(viewModel: viewModel)
  }
  
}
