//
//  Gender.swift
//  HabitusApp
//
//  Created by Erik Loures on 04/12/22.
//

import SwiftUI

enum Gender: String, CaseIterable, Identifiable {
    case male = "Masculino"
    case female = "Feminino"
    case Nbinario = "Não-binário"
    
    var id: String {
        self.rawValue
    }
    
    var index: Self.AllCases.Index{
        return Self.allCases.firstIndex { self == $0 } ?? 0
    }
    
}
