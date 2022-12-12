//
//  SignUpView.swift
//  HabitusApp
//
//  Created by Erik Loures on 02/12/22.
//

import SwiftUI

struct SignUpView: View {
    // nome completo
    // email
    // senha
    // cpf
    // telefone
    // data de nascimento
    // genero

    @ObservedObject var viewModel: SignUpViewModel
    
    var body: some View {
        ZStack {
            ScrollView(showsIndicators:false) {
                VStack(alignment: .center) {
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text ("Cadastro")
                            .foregroundColor(Color("textColor"))
                            .font(Font.system(.title).bold())
                            .padding(.bottom, 9)
                        
                        fullNameField
                        emailField
                        passwordField
                        documentField
                        phoneField
                        birthdayField
                        genderField
                        saveButton
                    }
                    
                    Spacer()
                }.padding(.horizontal, 10)
            }.padding()
            
            if case SignUpUIState.error(let value) = viewModel.uiState {
                Text("")
                    .alert(isPresented: .constant(true)) {
                    Alert(title: Text("Habitus"), message: Text(value), dismissButton:
                    .default(Text("OK")){
                    })
                }
            }
        }
    }
}
extension SignUpView {
    var fullNameField: some View {
        EditTextView(text: $viewModel.fullName,
            placeholder: "Nome Completo*",
            keyboard: .alphabet,
            error: "e-mail invalido",
            failure: viewModel.fullName.count < 3)
    }
}

extension SignUpView {
    var emailField: some View {
        EditTextView(text: $viewModel.email,
            placeholder: "Digite se e-mail*",
            keyboard: .alphabet,
            error: "e-mail invalido",
            failure: !viewModel.email.isEmail())
    }
}

extension SignUpView {
    var passwordField: some View {
        EditTextView(text: $viewModel.password,
            placeholder: "Senha*",
            keyboard: .emailAddress,
            error: "a senha dever ter ao menos 8 caracteres",
            failure: viewModel.password.count < 8,
            isSecure: true)
    }
}
extension SignUpView {
    var documentField: some View {
        EditTextView(text: $viewModel.document,
            placeholder: "Digite seu CPF*",
            keyboard: .numberPad,
            error: "CPF invalido",
            failure: viewModel.document.count != 11 )
        // TODO: mask
        // TODO: isDisabled
    }
}
extension SignUpView {
    var phoneField: some View {
        EditTextView(text: $viewModel.phone,
        placeholder: "Telefone*",
        keyboard: .numberPad,
        error: "Numero invalido",
        failure: viewModel.phone.count < 10 || viewModel.phone.count >= 12)
        // TODO: mask
    }
}
extension SignUpView {
    var birthdayField: some View {
        EditTextView(text: $viewModel.birthday,
                    placeholder: "DD/MM/AAAA*",
                    keyboard: .default,
                    error: "DD/MM/AAAA",
                     failure: viewModel.birthday.count != 10)
        // TODO: mask
    }
}

extension SignUpView {
    var genderField: some View {
        Picker("Gender", selection: $viewModel.gender) {
            ForEach(Gender.allCases, id: \.self) { value in
                Text(value.rawValue)
                    .tag(value)
            }
        }.pickerStyle(SegmentedPickerStyle())
         .padding(.top, 20)
         .padding(.bottom, 60)
    }
}

extension SignUpView {
    var saveButton: some View {
        LoadingButtonView(action: {
            viewModel.signUp()
        },
            text:"Cadastrar",
        showProgress: self.viewModel.uiState == SignUpUIState.loading,
      disabled: !viewModel.email.isEmail() ||
      viewModel.password.count < 8 ||
      viewModel.fullName.count < 3 ||
      viewModel.document.count != 11 ||
      viewModel.phone.count < 10 || viewModel.phone.count >= 12 ||
      viewModel.birthday.count != 10)
}
}
struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            SignUpView(viewModel: SignUpViewModel())
                .previewDevice("iPhone 11")
                .preferredColorScheme($0)
        }
    }
}
