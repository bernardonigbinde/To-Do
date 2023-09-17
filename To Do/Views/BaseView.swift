//
//  BaseView.swift
//  To Do
//
//  Created by Bernard Onigbinde on 2023/09/17.
//

import SwiftUI

protocol BaseView: View {
}

extension LocalizedStringKey {
	static var appName = LocalizedStringKey("app.name")
	static var appSlogan = LocalizedStringKey("app.slogan")
}
