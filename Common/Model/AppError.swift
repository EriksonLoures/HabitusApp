//
//  AppError.swift
//  HabitusApp
//
//  Created by Erik Loures on 25/12/22.
//

import Foundation

enum AppError: Error {
case response(message: String)
    
    public var message: String {
        switch self {
        case .response(let message):
            return message
        }
    }
}
