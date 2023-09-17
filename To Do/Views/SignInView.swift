//
//  SignInView.swift
//  To Do
//
//  Created by Bernard Onigbinde on 2023/09/17.
//

import SwiftUI

struct SignInView: BaseView {
	@StateObject fileprivate var viewModel = SignInViewViewModel()
	
	var body: some View {
		NavigationView {
			VStack {
				HeaderView(
					title: .appName,
					subtitle: .appSlogan,
					height: 430,
					angle: 9,
					iconName: "list.bullet.clipboard.fill",
					backgroundColor: .pink
				)
				
				SignInFormView(viewModel: viewModel)
				
				Spacer()
				
				//			Social Buttons
				
				Spacer()
				
				//			Sign Up Button
				VStack {
					Text(.signUpLabel)
					NavigationLink(.signUpButton, destination: SignUpView())
				}
			}
		}
	}
}

struct SignInView_Previews: PreviewProvider {
	static var previews: some View {
		SignInView()
	}
}

fileprivate struct SignInFormView: View {
	@ObservedObject var viewModel: SignInViewViewModel
	
	var body: some View {
		VStack {
			if !viewModel.errorMessage.isEmpty {
				ErrorMessageView(errorMessage: viewModel.errorMessage) {
					viewModel.errorMessage = ""
				}
			}
			
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
			PrimaryButton(title: .signInButton) {
				viewModel.signIn()
			}
			.padding(.vertical, 10)
			
			HStack {
				Spacer()
				NavigationLink(.forgotPasswordButton, destination: ForgotPasswordView())
					.font(.system(.subheadline))
			}
		}
		.padding(20)
		.background(Color.gray.opacity(0.1))
		.cornerRadius(10)
		.offset(y: -140)
		.zIndex(-1)
		.padding(30)
	}
}

fileprivate extension LocalizedStringKey {
	static var emailLabel = LocalizedStringKey("signin.form.email.label")
	static var passwordLabel = LocalizedStringKey("signin.form.password.label")
	static var signInButton = LocalizedStringKey("signin.form.signin.button");
	static var signUpLabel = LocalizedStringKey("signin.signup.label");
	static var signUpButton = LocalizedStringKey("signin.signup.button");
	static var forgotPasswordButton = LocalizedStringKey("signin.forgotpassword.button");
}
