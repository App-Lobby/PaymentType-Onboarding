//
//  BoxView.swift
//  Onboarding
//
//  Created by Mohammad Yasir on 19/09/21.
//

import SwiftUI

struct BoxView: View {
    var cornerRadius: CGFloat
    var color: Color
    var frame: CGSize
    
    var body: some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .frame(width: frame.width, height: frame.height)
            .foregroundColor(color)
    }
}
