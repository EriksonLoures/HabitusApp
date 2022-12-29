//
//  UserAuth.swift
//  HabitusApp
//
//  Created by Erik Loures on 26/12/22.
//

import Foundation

struct UserAuth: Codable {
    var idToken: String
    var refreshToken: String
    var expires: Int = 0
    var TokenType: String
    
    enum CodingKeys: String, CodingKey {
      case idToken = "access_token"
      case refreshToken = "refresh_token"
      case expires
      case TokenType = "token_type"
    }
}
