//
//  SignInView.swift
//  HabitusApp
//
//  Created by Erik Loures on 28/11/22.
//

import SwiftUI

struct SignInView: View {
    
    @ObservedObject var viewModel: SignInViewModel
    

    
    @State var action: Int? = 0
    @State var navigationHidden = true
    
    
    var body: some View {
        ZStack {
            if case SignInUIState.goToHomeScreen = viewModel.uiState {
                viewModel.homeView()
            }else{
NavigationView {
    
ScrollView(showsIndicators: false) {
    
    VStack(alignment: .center, spacing: 20) {
        
        Spacer(minLength: 36)
        
        VStack(alignment: .center, spacing: 8) {
            Image("icon3")
                .resizable()
                .scaledToFit()
                .padding(.horizontal,48)
            Text("Login")
                .foregroundColor(Color.black)
                .font(Font.system(.title).bold())
                .padding(.bottom, 10)
            
            emailField
            passwordField
            enterButton
            registerLink
            
            Text ("Copyright - nexTi 2022")
                .foregroundColor (Color.gray)
                .font (Font.system(size: 14) .bold())
                .padding (.top, 200)
            
        }
    }
                        
    if case SignInUIState.error(let value) = viewModel.uiState {
        Text("")
            .alert(isPresented: .constant(true)) {
                Alert(title: Text("Habitus"), message: Text(value), dismissButton:
                        .default(Text("OK")){
            })
        }
    }
}
                .frame(maxWidth:.infinity, maxHeight: .infinity)
                .padding(.horizontal, 32)
                .navigationBarTitle("Login", displayMode: .inline)
                .navigationBarHidden(navigationHidden)
                }
            }
        }
    }
}

extension SignInView {
    var emailField: some View {
        EditTextView(text: $viewModel.email,
                    placeholder: "E-mail",
                    keyboard: .emailAddress,
                    error: "e-mail invalido",
                     failure: !viewModel.email.isEmail())
    }
}

extension SignInView {
    var passwordField: some View {
        EditTextView(text: $viewModel.password,
                    placeholder: "Senha",
                    keyboard: .emailAddress,
                    error: "a senha dever ter ao menos 8 caracteres",
                     failure: viewModel.password.count < 8,
                    isSecure: true)
    }
}

extension SignInView {
    var enterButton: some View {
        LoadingButtonView(action: {
            viewModel.login()
        },
                text:"Entrar",
           showProgress: self.viewModel.uiState ==
                    SignInUIState.loading,
                          disabled: !viewModel.email.isEmail() ||
                          viewModel.password.count < 8)
    }
}

extension SignInView {
    var registerLink: some View {
        VStack {
            Text ("Esqueceu a senha?")
                .foregroundColor (.gray)
                .padding (.top, 48)
            
        ZStack {
            NavigationLink(
                destination: viewModel.signUpView(),
                tag: 1,
                selection: $action,
                label: { EmptyView () })
            
            Button ("Cadastre-se agora") {
                self.action = 1
                }
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            let viewModel = SignInViewModel(interactor: SignInInteractor())
            SignInView(viewModel: viewModel)
                .previewDevice("iPhone 11")
                .preferredColorScheme($0)
        }
    }
}
