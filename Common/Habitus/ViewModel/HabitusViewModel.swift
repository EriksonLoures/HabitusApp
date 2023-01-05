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
    
    func onAppear() {
        self.uiState = .loading
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            
            var rows: [HabitusCardViewModel] = []
            
            rows.append(HabitusCardViewModel(id: 1,
                                           icon: "https://via.placeholder.com/150",
                                           date: "01/01/2023 00:00:00",
                                           name: "Estudar Bando de Dados",
                                          label: "",
                                          value: "",
                                          state: .blue))
            
            rows.append(HabitusCardViewModel(id: 2,
                                           icon: "https://via.placeholder.com/150",
                                           date: "01/01/2023 00:00:00",
                                           name: "Estudar Eng de Software",
                                          label: "",
                                          value: "",
                                          state: .blue))
            
            rows.append(HabitusCardViewModel(id: 3,
                                           icon: "https://via.placeholder.com/150",
                                           date: "01/01/2023 00:00:00",
                                           name: "Estudar Bando de Dados",
                                          label: "",
                                          value: "",
                                          state: .blue))
            
            rows.append(HabitusCardViewModel(id: 4,
                                           icon: "https://via.placeholder.com/150",
                                           date: "01/01/2023 00:00:00",
                                           name: "Estudar Bando de Dados",
                                          label: "",
                                          value: "",
                                          state: .blue))
            
            rows.append(HabitusCardViewModel(id: 5,
                                           icon: "https://via.placeholder.com/150",
                                           date: "01/01/2023 00:00:00",
                                           name: "Estudar Bando de Dados",
                                          label: "",
                                          value: "",
                                          state: .blue))
//            self.uiState = .fullList(rows)
            self.uiState = .error("falha interna no servidor")
        }
    }
}
