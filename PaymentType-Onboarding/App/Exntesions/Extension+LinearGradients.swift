//
//  Extension+LinearGradients.swift
//  Onboarding
//
//  Created by Mohammad Yasir on 19/09/21.
//

import SwiftUI

extension LinearGradient {
    static var iPhoneStrokeGradient: LinearGradient {
        LinearGradient(gradient:
                        Gradient(
                            colors: [
                                Color(#colorLiteral(red: 0.2346009612, green: 0.2317774892, blue: 0.2350641489, alpha: 1)),
                                Color(#colorLiteral(red: 0.1326514781, green: 0.1298131347, blue: 0.1331157684, alpha: 1))]),
                       startPoint: .top,
                       endPoint: .bottom)
    }
}
