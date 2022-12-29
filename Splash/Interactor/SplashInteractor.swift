//
//  File.swift
//  HabitusApp
//
//  Created by Erik Loures on 28/12/22.
//

import SwiftUI
import Combine

class SplashInteractor {
    
    //private let remote: SignInRemoteDataSource = .shared
    private let local: LocalDataSource = .shared
    
}

extension SplashInteractor {
   
    func fetchAuth () -> Future<UserAuth?, Never> {
        return local.getUserAuth()
    }
}
