//
//  SignInView.swift
//  To Do
//
//  Created by Bernard Onigbinde on 2023/09/17.
//

import SwiftUI

struct SignInView: BaseView {
	@StateObject var viewModel = SignInViewModel()
	
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
				
				LoginFormView(viewModel: viewModel)
				
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

fileprivate struct LoginFormView: View {
	@ObservedObject var viewModel: SignInViewModel
	
	var body: some View {
		VStack {
			TextField(.emailLabel, text: $viewModel.email)
				.textFieldStyle(RoundedBorderTextFieldStyle())
			SecureField(.passwordLabel, text: $viewModel.password)
				.textFieldStyle(RoundedBorderTextFieldStyle())
			Button {
				
			} label: {
				ZStack {
					RoundedRectangle(cornerRadius: 6)
						.foregroundColor(Color.blue)
					
					Text(.signInButton)
						.foregroundColor(Color.white)
						.bold()
				}
			}
			.frame(height: 40)
			.padding(.top, 10)
			.padding(.bottom, 10)
			
			NavigationLink(.forgotPasswordButton, destination: ForgotPasswordView())
				.font(.system(.subheadline))
		}
		.padding(20)
		.background(Color.gray.opacity(0.1))
		.cornerRadius(10)
		.offset(y: -170)
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
