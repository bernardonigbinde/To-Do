//
//  PasswordField.swift
//  To Do
//
//  Created by Bernard Onigbinde on 2023/09/17.
//

import SwiftUI

struct PasswordField: View {
	var label: LocalizedStringKey
	@Binding var password: String
	
	var body: some View {
		SecureField(label, text: $password)
			.textContentType(.password)
			.textFieldStyle(RoundedBorderTextFieldStyle())
			.autocapitalization(.none)
			.autocorrectionDisabled()
	}
}

struct PasswordField_Previews: PreviewProvider {
    static var previews: some View {
		PasswordField(label: "Password", password: .constant(""))
    }
}
