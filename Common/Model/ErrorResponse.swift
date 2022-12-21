//
//  ErrorResponse.swift
//  HabitusApp
//
//  Created by Erik Loures on 16/12/22.
//

import SwiftUI

struct ErrorResponse: Decodable {
    
    let detail: String?
   
enum CodingKeys: String, CodingKey {
      case detail
    }
}
