//
//  SignInView.swift
//  To Do
//
//  Created by Bernard Onigbinde on 2023/09/17.
//

import SwiftUI

struct SignInView: BaseView {
	@StateObject private var viewModel = SignInViewViewModel()
	
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
				
				HStack(spacing: 50) {
					SocialLoginLogo(imageName: "apple-logo") {
						viewModel.signInWithApple()
					}
					SocialLoginLogo(imageName: "google-logo") {
						viewModel.signInWithGoogle()
					}
					SocialLoginLogo(imageName: "facebook-logo", tintColor: Color(red: 24/255, green: 119/255, blue: 242/255)) {
						viewModel.signInWithFacebook()
					}
				}
				.padding(.bottom, 10)
				
				Divider()
					.frame(width: UIScreen.main.bounds.width * 0.8)
				
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

fileprivate struct SocialLoginLogo: View {
	let imageName: String
	var tintColor: Color? = nil
	let action: () -> Void
	
	var body: some View {
		Button(action: action) {
			Image(uiImage: UIImage(named: imageName) ?? UIImage())
				.renderingMode(tintColor == nil ? .original : .template)
				.resizable()
				.foregroundColor(tintColor)
				.scaledToFit()
				.frame(width: 40)
		}

	}
}

fileprivate struct SignInFormView: View {
	@StateObject var viewModel: SignInViewViewModel
	@State private var textFieldId: String = UUID().uuidString
	
	var body: some View {
		VStack {
			if !viewModel.errorMessage.isEmpty {
				ErrorMessageView(errorMessage: viewModel.errorMessage) {
					viewModel.errorMessage = ""
				}
			}
			
			EmailOrMobileNumberField(
				isMobile: $viewModel.isMobile,
				username: $viewModel.username
			)
			PasswordField(label: .passwordLabel, password: $viewModel.password)
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
		.padding(.horizontal, 30)
	}
}

fileprivate extension LocalizedStringKey {
	static var passwordLabel = LocalizedStringKey("signin.form.password.label")
	static var signInButton = LocalizedStringKey("signin.form.signin.button");
	static var signUpLabel = LocalizedStringKey("signin.signup.label");
	static var signUpButton = LocalizedStringKey("signin.signup.button");
	static var forgotPasswordButton = LocalizedStringKey("signin.forgotpassword.button");
}
