//
//  HomeViewModel.swift
//  HabitusApp
//
//  Created by Erik Loures on 29/11/22.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    
}

extension HomeViewModel {
    func HabitusView() -> some View {
        return HomeViewRouter.makeHabitusView()
    }
}
