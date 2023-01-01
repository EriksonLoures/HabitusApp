//
//  RefreshRequest.swift
//  HabitusApp
//
//  Created by Erik Loures on 01/01/23.
//

import Foundation


struct RefreshRequest: Encodable {
  
  let token: String
  
  enum CodingKeys: String, CodingKey {
    case token = "refresh-token"
  }
}
