//
//  SignUpRequest.swift
//  HabitusApp
//
//  Created by Erik Loures on 14/12/22.
//

import Foundation

struct SignUpRequest: Encodable {
  
  let fullName: String
  let email: String
  let password: String
  let document: String
  let phone: String
  let birthday: String
  let gender: Int
  
  enum CodingKeys: String, CodingKey {
    case fullName = "name"
    case email
    case password
    case document
    case phone
    case birthday
    case gender
  }
}
