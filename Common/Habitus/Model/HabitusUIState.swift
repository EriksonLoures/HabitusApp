//
//  HabitusUIState.swift
//  HabitusApp
//
//  Created by Erik Loures on 01/01/23.
//

import Foundation

enum HabitusUIState: Equatable {
    case loading
    case emptyList
    case fullList([HabitusCardViewModel])
    case error (String)
}
