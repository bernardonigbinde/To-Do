//
//  SignUpView.swift
//  To Do
//
//  Created by Bernard Onigbinde on 2023/09/17.
//

import SwiftUI

struct SignUpView: BaseView {
	@StateObject fileprivate var viewModel = SignUpViewViewModel()
	
    var body: some View {
		VStack {
			HeaderView(
				title: .title,
				subtitle: .subtitle,
				height: 480,
				angle: -9,
				iconName: "person.crop.circle.badge.plus",
				backgroundColor: .yellow
			)
			
			SignUpFormView(viewModel: viewModel)
			
			Spacer()
		}
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

fileprivate struct SignUpFormView: View {
	@ObservedObject var viewModel: SignUpViewViewModel
	
	var body: some View {
		VStack {
			if !viewModel.errorMessage.isEmpty {
				ErrorMessageView(errorMessage: viewModel.errorMessage) {
					viewModel.errorMessage = ""
				}
			}
			TextField(.nameLabel, text: $viewModel.name)
				.textFieldStyle(RoundedBorderTextFieldStyle())
			TextField(.emailLabel, text: $viewModel.email)
				.keyboardType(.emailAddress)
				.textContentType(.emailAddress)
				.textFieldStyle(RoundedBorderTextFieldStyle())
				.autocapitalization(.none)
				.autocorrectionDisabled()
			SecureField(.passwordLabel, text: $viewModel.password)
				.textContentType(.password)
				.textFieldStyle(RoundedBorderTextFieldStyle())
				.autocapitalization(.none)
				.autocorrectionDisabled()
			PrimaryButton(title: .signUpButton) {
				viewModel.signUp()
			}
			.padding(.vertical, 10)
		}
		.padding(20)
		.background(Color.gray.opacity(0.1))
		.cornerRadius(10)
		.offset(y: -180)
		.zIndex(-1)
		.padding(30)
	}
}

fileprivate extension LocalizedStringKey {
	static var title = LocalizedStringKey("signup.header.title");
	static var subtitle = LocalizedStringKey("signup.header.subtitle");
	static var nameLabel = LocalizedStringKey("signup.form.name.label")
	static var emailLabel = LocalizedStringKey("signup.form.email.label")
	static var passwordLabel = LocalizedStringKey("signup.form.password.label")
	static var signUpButton = LocalizedStringKey("signup.form.button");
}

