//
//  ViewModifiers.swift
//  Onboarding
//
//  Created by Mohammad Yasir on 19/09/21.
//

import SwiftUI

struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 28, weight: .bold, design: .rounded))
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
    }
}

struct CaptionModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 14,weight: .light, design: .serif))
            .foregroundColor(.white.opacity(0.4))
            .frame(width: 270)
            .multilineTextAlignment(.center)
        
    }
}
