//
//  SignUpUIState.swift
//  HabitusApp
//
//  Created by Erik Loures on 04/12/22.
//

import SwiftUI

enum SignUpUIState: Equatable {
    case none
    case loading
    case success
    case error(String)
    
}
