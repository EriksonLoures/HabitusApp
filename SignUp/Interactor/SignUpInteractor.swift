//
//  SignUpInteractor.swift
//  HabitusApp
//
//  Created by Erik Loures on 25/12/22.
//

import SwiftUI
import Combine

class SignUpInteractor {
    
    private let remoteSignUp: SignUpRemoteDataSource = .shared
    private let remoteSignIn: SignInRemoteDataSource = .shared
    private let local: LocalDataSource = .shared

    
}

extension SignUpInteractor {
    func postUser(signUpRequest request: SignUpRequest) -> Future<Bool, AppError> {
        return remoteSignUp.postUser(request: request)
        
    }
    func login(signInRequest request: SignInRequest) -> Future<SignInResponse, AppError> {
        return remoteSignIn.login(request: request)
    }
    func insertAuth(userAuth: UserAuth) {
        local.insertUserAuth(userAuth: userAuth)
    }
}
