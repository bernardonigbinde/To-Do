//
//  SignUpView.swift
//  To Do
//
//  Created by Bernard Onigbinde on 2023/09/17.
//

import SwiftUI

struct SignUpView: BaseView {
	@StateObject private var viewModel = SignUpViewViewModel()
	
	var body: some View {
		VStack {
			HeaderView(
				title: .title,
				subtitle: .subtitle,
				height: 480,
				angle: -9,
				iconName: "person.crop.circle.badge.plus",
				backgroundColor: .orange
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
	@StateObject var viewModel: SignUpViewViewModel
	
	var body: some View {
		VStack {
			if !viewModel.errorMessage.isEmpty {
				ErrorMessageView(errorMessage: viewModel.errorMessage) {
					viewModel.errorMessage = ""
				}
			}
			TextField(.nameLabel, text: $viewModel.name)
				.textContentType(.name)
				.textFieldStyle(RoundedBorderTextFieldStyle())
			EmailOrMobileNumberField(
				isMobile: $viewModel.isMobile,
				username: $viewModel.username
			)
			PasswordField(label: .passwordLabel, password: $viewModel.password)
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
	static var mobileNumberLabel = LocalizedStringKey("signup.form.mobilenumber.label")
	static var passwordLabel = LocalizedStringKey("signup.form.password.label")
	static var signUpButton = LocalizedStringKey("signup.form.button");
}

