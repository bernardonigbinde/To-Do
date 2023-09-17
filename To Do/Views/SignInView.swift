//
//  SignInView.swift
//  To Do
//
//  Created by Bernard Onigbinde on 2023/09/17.
//

import SwiftUI

struct SignInView: View {
    var body: some View {
		VStack {
//			Header: Name & Icon
			HeaderView()
			
			Spacer()
			
//			Form
			
//			Forgot Password
			
//			Sign In Button
			
//			Sign Up Button
			
//			Social Buttons
		}
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}

fileprivate struct HeaderView: View {
	var body: some View {
		ZStack {
			RoundedRectangle(cornerRadius: CGFloat(0))
				.foregroundColor(Color.pink)
				.rotationEffect(Angle(degrees: 185))
			
			VStack {
				Image(systemName: "list.bullet.clipboard.fill")
					.renderingMode(.template)
					.resizable()
					.foregroundColor(Color.white)
					.scaledToFit()
					.frame(width: 75)
					.padding(.bottom, 10)
				
				Text("To Do")
					.foregroundColor(Color.white)
					.bold()
					.font(.system(size: 40))
				
				Text("Get things done")
					.foregroundColor(Color.white)
					.fontWeight(Font.Weight.medium)
			}
			.offset(y: 50)
			.padding(.bottom, 50)
		}
		.frame(width: UIScreen.main.bounds.width * 3, height: 400)
		.offset(y: -100)
	}
}
