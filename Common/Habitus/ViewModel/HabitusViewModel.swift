//
//  HabitusViewModel.swift
//  HabitusApp
//
//  Created by Erik Loures on 01/01/23.
//

import Foundation

class HabitusViewModel: ObservableObject {
   
    @Published var uiState: HabitusUIState = .emptyList
    
    @Published var title = "Atenção"
    @Published var headline = "Fique ligado!"
    @Published var desc = "Você está atrasado nos hábitos"
}
