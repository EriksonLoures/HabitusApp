//
//  HabitusCardViewModel.swift
//  HabitusApp
//
//  Created by Erik Loures on 02/01/23.
//

import Foundation
import SwiftUI

struct HabitusCardViewModel: Identifiable, Equatable {
    
    var id: Int = 0
    var icon: String = ""
    var date: String = ""
    var name: String = ""
    var label: String = ""
    var value: String = ""
    var state: Color = .green
    
    static func == (lhs: HabitusCardViewModel, rhs: HabitusCardViewModel) -> Bool {
        return lhs.id == rhs.id
    }
}
