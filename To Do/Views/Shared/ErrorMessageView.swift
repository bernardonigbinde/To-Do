//
//  ErrorMessageView.swift
//  To Do
//
//  Created by Bernard Onigbinde on 2023/09/17.
//

import SwiftUI

struct ErrorMessageView: View {
	var errorMessage: String
	var cancelButtonAction: (() -> Void)? = nil
	
    var body: some View {
		HStack {
			Text(errorMessage)
				.frame(maxWidth: .greatestFiniteMagnitude, alignment: .leading)
				.foregroundColor(.red)
				.padding(.vertical)
			
			Spacer()
			
			Button {
				cancelButtonAction?()
			} label: {
				Image(systemName: "xmark.circle")
			}

		}
		.padding(.horizontal)
    }
}

struct ErrorMessageView_Previews: PreviewProvider {
    static var previews: some View {
		ErrorMessageView(errorMessage: "Error occured")
    }
}
