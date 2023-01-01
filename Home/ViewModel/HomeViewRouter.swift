//
//  HomeViewRouter.swift
//  HabitusApp
//
//  Created by Erik Loures on 01/01/23.
//

import Foundation
import SwiftUI

enum HomeViewRouter {
    static func makeHabitusView() -> some View {
        let viewModel = HabitusViewModel()
        return HabitusView(viewModel: viewModel)
    }
}
