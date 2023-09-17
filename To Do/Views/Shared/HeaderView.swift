//
//  HeaderView.swift
//  To Do
//
//  Created by Bernard Onigbinde on 2023/09/17.
//

import SwiftUI

struct HeaderView: View {
	var title: LocalizedStringKey
	var subtitle: LocalizedStringKey
	var height: Double
	var angle: Double
	var iconName: String
	var backgroundColor: Color
	
	var body: some View {
		ZStack {
			RoundedRectangle(cornerRadius: CGFloat(0))
				.foregroundColor(backgroundColor)
				.rotationEffect(Angle(degrees: angle))
			
			VStack {
				Image(systemName: iconName)
					.renderingMode(.template)
					.resizable()
					.foregroundColor(Color.white)
					.scaledToFit()
					.frame(width: 75)
					.padding(.bottom, 10)
				
				Text(title)
					.foregroundColor(Color.white)
					.bold()
					.font(.system(size: 40))
				
				Text(subtitle)
					.foregroundColor(Color.white)
					.fontWeight(Font.Weight.medium)
			}
			.offset(y: height / 5)
			.padding(.bottom, 50)
		}
		.frame(width: UIScreen.main.bounds.width * 3, height: height)
		.offset(y: -(height / 2.5))
	}
}

struct HeaderView_Previews: PreviewProvider {
	static var previews: some View {
		HeaderView(
			title: "Welcome",
			subtitle: "Do something",
			height: 480,
			angle: 18,
			iconName: "check.fill",
			backgroundColor: Color.red
		)
	}
}
