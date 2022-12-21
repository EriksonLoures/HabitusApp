//
//  SignInErrorResponse.swift
//  HabitusApp
//
//  Created by Erik Loures on 20/12/22.
//

import SwiftUI

struct SignInErrorResponse: Decodable {
    
    let detail: SignInDetailErrorResponse
   
enum CodingKeys: String, CodingKey {
      case detail
    }
}


struct SignInDetailErrorResponse: Decodable {
    
    let message: String
   
enum CodingKeys: String, CodingKey {
      case message
    }
}
