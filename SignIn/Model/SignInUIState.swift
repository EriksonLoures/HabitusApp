//
//  SignInUIState.swift
//  HabitusApp
//
//  Created by Erik Loures on 29/11/22.
//

import SwiftUI

enum SignInUIState: Equatable {
    case none
    case loading
    case goToHomeScreen
    case error(String)
    
}
