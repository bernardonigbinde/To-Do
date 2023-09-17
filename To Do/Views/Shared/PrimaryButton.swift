//
//  PrimaryButton.swift
//  To Do
//
//  Created by Bernard Onigbinde on 2023/09/17.
//

import SwiftUI

struct PrimaryButton: View {
	let title: LocalizedStringKey
	let action: () -> Void
	
    var body: some View {
		Button {
			action()
		} label: {
			ZStack {
				RoundedRectangle(cornerRadius: 6)
					.foregroundColor(Color.blue)
				
				Text(title)
					.foregroundColor(Color.white)
					.bold()
			}
			.frame(height: 40)
		}
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
		PrimaryButton(title: "Do Something") {
			
		}
    }
}
