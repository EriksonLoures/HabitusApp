//
//  ButtonStyle.swift
//  HabitusApp
//
//  Created by Erik Loures on 02/01/23.
//

import Foundation
import SwiftUI

struct ButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
        .frame(maxWidth: .infinity)
        .padding(.vertical, 14)
        .padding(.horizontal, 16)
        .font(Font.system(.title3).bold())
        .background(Color.blue)
        .foregroundColor(.white)
        .cornerRadius(17.0)
    }
}
