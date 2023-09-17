//
//  SignUpView.swift
//  To Do
//
//  Created by Bernard Onigbinde on 2023/09/17.
//

import SwiftUI

struct SignUpView: BaseView {
    var body: some View {
		VStack {
			HeaderView(
				title: .title,
				subtitle: .subtitle,
				height: 340,
				angle: -9,
				iconName: "person.crop.circle.badge.plus",
				backgroundColor: .yellow
			)
			
			Spacer()
		}
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

fileprivate extension LocalizedStringKey {
	static var title = LocalizedStringKey("signup.header.title");
	static var subtitle = LocalizedStringKey("signup.header.subtitle");
	static var emailLabel = LocalizedStringKey("signup.form.email.label")
	static var passwordLabel = LocalizedStringKey("signup.form.password.label")
	static var signUpButton = LocalizedStringKey("signup.form.button");
}

