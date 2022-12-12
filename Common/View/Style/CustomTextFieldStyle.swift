//
//  CustomTextFieldStyle.swift
//  HabitusApp
//
//  Created by Erik Loures on 05/12/22.
//

import SwiftUI

struct CustomTextFieldStyle: TextFieldStyle {
    public func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.horizontal, 8)
            .padding(.vertical, 6)
            .overlay(
                RoundedRectangle(cornerRadius: 10.0)
                    .stroke(Color.gray, lineWidth: 0.9)
            )
        
    }
    
}
