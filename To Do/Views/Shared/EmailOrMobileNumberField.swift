//
//  EmailOrMobileNumberField.swift
//  To Do
//
//  Created by Bernard Onigbinde on 2023/09/17.
//

import SwiftUI

struct EmailOrMobileNumberField: View {
	@Binding var isMobile: Bool
	@Binding var username: String
	@State private var textFieldId: String = UUID().uuidString
	
	var body: some View {
		ZStack(alignment: Alignment(horizontal: .trailing, vertical: .center)) {
			TextField(isMobile ? .mobileNumberLabel : .emailLabel, text: $username)
				.keyboardType(isMobile ? .phonePad : .emailAddress)
				.textContentType(isMobile ? .telephoneNumber : .emailAddress)
				.textFieldStyle(RoundedBorderTextFieldStyle())
				.autocapitalization(.none)
				.autocorrectionDisabled()
				.id(textFieldId)
			
			Button {
				_isMobile.wrappedValue.toggle()
				username = ""
				textFieldId = UUID().uuidString
			} label: {
				Image(systemName: isMobile ? "candybarphone" : "envelope.fill")
					.foregroundColor(Color.gray.opacity(0.4))
					.padding(.trailing)
			}
		}
	}
}

struct EmailOrMobileNumberField_Previews: PreviewProvider {
	static var isMobile: Bool = false
	
    static var previews: some View {
		EmailOrMobileNumberField(isMobile: .constant(true), username: .constant(""))
    }
}

fileprivate extension LocalizedStringKey {
	static var emailLabel = LocalizedStringKey("emailormobilenumberfield.email.label")
	static var mobileNumberLabel = LocalizedStringKey("emailormobilenumberfield.mobilenumber.label")
}
