//
//  Exntesion+UIScreens.swift
//  Onboarding
//
//  Created by Mohammad Yasir on 19/09/21.
//

import SwiftUI

extension UIScreen {
    static var iPhoneViewWidth: CGFloat {
        (UIScreen.main.bounds.width - 100)
    }
}

extension UIScreen {
    static var iPhoneViewHeight: CGFloat {
        (UIScreen.main.bounds.height / 2)
    }
}
