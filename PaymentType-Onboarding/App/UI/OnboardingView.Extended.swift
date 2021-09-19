//
//  ViewExntensions.swift
//  Onboarding
//
//  Created by Mohammad Yasir on 12/09/21.
//

import SwiftUI

extension OnboardingView {
    // Data
    
    enum OnboardingState: Int, Hashable, Identifiable, CaseIterable {
        
        var id: Int {
            rawValue
        }
        
        case onFirst
        case onSecond
        case onThird
        case onFourth
        
        var title: String {
            switch self {
            case .onFirst:
                return "No more plastic cards"
            case .onSecond:
                return "Bounses are waiting for you"
            case .onThird:
                return "It's that simple"
            case .onFourth:
                return "Always up to date"
            }
        }
        
        var caption: String {
            switch self {
            case .onFirst:
                return "The phone is always with you which means your 'touch card' too"
            case .onSecond:
                return "Shop at your favorate places, get bounses and use them in the future"
            case .onThird:
                return "Get discounts or bounses simply by showing cashier your unique buyer's QR code"
            case .onFourth:
                return "Easily and simply view the lavel of loyality in establishment and the latest news from them"
            }
        }
    }
    
    // Views
    
    func onFirst_Card(color: Color, width: CGFloat, isInnerBoxes: Bool) -> some View {
        VStack(alignment: .leading) {
            if isInnerBoxes {
                HStack {
                    Spacer()
                    RoundedRectangle(cornerRadius: 4)
                        .frame(width: 80, height: 30)
                        .foregroundColor(Color(#colorLiteral(red: 0.9624456763, green: 0.7305566669, blue: 0.7643006444, alpha: 1)))
                }
                Spacer()
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: 100 , height: 14)
                    .foregroundColor(Color(#colorLiteral(red: 0.9624456763, green: 0.7305566669, blue: 0.7643006444, alpha: 1)))
                
                RoundedRectangle(cornerRadius: 2)
                    .frame(width: 150 , height: 8)
                    .foregroundColor(Color(#colorLiteral(red: 0.9624456763, green: 0.7305566669, blue: 0.7643006444, alpha: 1)))
            }
        }
        .padding()
        .frame(width: width, height: width - 100)
        .background(color)
        .cornerRadius(10)
        .opacity(onFirst_CardOpacity)
        .offset(y: onFirst_CardOffsetY)
        .onAppear{
            withAnimation(Animation.easeOut(duration: 0.7)) {
                onFirst_CardOffsetY = 0
                onFirst_CardOpacity = 1
            }
        }
    }
    
    var qrView: some View {
        VStack {
            
        }
        .frame(width: 200, height: 200)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color(#colorLiteral(red: 0.9215686275, green: 0.3294117647, blue: 0.3921568627, alpha: 1)), lineWidth: 4)
        )
        .overlay(
            BoxView(cornerRadius: 4, color: Color(#colorLiteral(red: 0.1326514781, green: 0.1298131347, blue: 0.1331157684, alpha: 1)), frame: CGSize(width:100, height: 220))
        )
        .overlay(
            BoxView(cornerRadius: 4, color: Color(#colorLiteral(red: 0.1326514781, green: 0.1298131347, blue: 0.1331157684, alpha: 1)), frame: CGSize(width:220, height: 100))
        )
        .overlay(
            Image(uiImage: UIImage(data: qrData!)!)
                .resizable()
                .frame(width: 170, height: 170)
        )
        .overlay(
            BoxView(cornerRadius: 2, color: Color(#colorLiteral(red: 0.9215686275, green: 0.3294117647, blue: 0.3921568627, alpha: 1)), frame: CGSize(width: 220, height: 2))
                .scaleEffect(y: onThird_qrOverlayScale)
                .shadow(color: .pink, radius: 12, x: 0, y: 0)
                .offset(y: onThird_qrOverlayOffsetY)
                .onAppear {
                    withAnimation(Animation.easeOut(duration: 0.5)) {
                        onThird_qrOverlayScale = 1
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                        withAnimation(Animation.easeOut(duration: 0.5)) {
                            onThird_qrOverlayOffsetY = 80
                        }
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                        withAnimation(Animation.easeOut(duration: 0.5)) {
                            onThird_qrOverlayOffsetY = -80
                        }
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.7) {
                        withAnimation(Animation.easeOut(duration: 0.5)) {
                            onThird_qrOverlayOffsetY = 0
                        }
                    }
                    
                }
            ,alignment: .center
        )
    }
    
    var onSecond_BoxesView: some View {
        VStack(spacing: 16) {
            HStack {
                Spacer()
                ForEach(0..<2) { i in
                    Spacer()
                    
                    VStack {
                        BoxView(cornerRadius: 2, color: Color(#colorLiteral(red: 0.6031950116, green: 0.6004226804, blue: 0.603649199, alpha: 1)), frame: CGSize(width: 40, height: 18))
                        BoxView(cornerRadius: 2, color: Color(#colorLiteral(red: 0.2306797802, green: 0.227855742, blue: 0.2311429977, alpha: 1)), frame: CGSize(width: 70, height: 12))
                    }
                    Spacer()
                    
                    if i != 1 {
                        Spacer()
                        Capsule()
                            .frame(width: 1)
                            .foregroundColor(.white.opacity(0.1))
                        Spacer()
                    }
                }
                
                Spacer()
            }
            .frame(maxHeight: 50)
            .opacity(onSecond_BottomSmallBoxOpacity)
            .offset(y: onSecond_BottomSmallBoxOffsetY)
            .onAppear {
                withAnimation(Animation.easeOut(duration: 0.7)) {
                    onSecond_BottomSmallBoxOffsetY = 0
                    onSecond_BottomSmallBoxOpacity = 1
                }
            }
            
            HStack {
                ForEach(0..<3) { i in
                    Spacer()
                    VStack {
                        BoxView(cornerRadius: 2, color: Color(#colorLiteral(red: 0.3044490814, green: 0.2990812659, blue: 0.3090505004, alpha: 1)), frame: CGSize(width: 14, height: 12))
                        BoxView(cornerRadius: 2, color: Color(#colorLiteral(red: 0.2378633916, green: 0.2321739495, blue: 0.2387913465, alpha: 1)), frame: CGSize(width: 60, height: 6))
                    }
                    
                    if i != 2 {
                        Spacer()
                        Capsule()
                            .frame(width: 1)
                            .foregroundColor(.white.opacity(0.1))
                        Spacer()
                    }
                    
                    Spacer()
                }
                
            }
            .frame(maxHeight: 50)
            .background(Color(#colorLiteral(red: 0.1679413915, green: 0.1651082933, blue: 0.1684054434, alpha: 1)))
            .cornerRadius(2)
            .opacity(onSecond_BottomLargeBoxOpacity)
            .offset(y: onSecond_BottomLargeBoxOffsetY)
            .onAppear {
                withAnimation(Animation.easeOut(duration: 0.7)) {
                    onSecond_BottomLargeBoxOffsetY = 0
                    onSecond_BottomLargeBoxOpacity = 1
                }
            }
        }
    }
    
    var onFourth_BadgeView: some View {
        VStack(spacing: 16) {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.648101449, green: 0.1894790828, blue: 0.4354349825, alpha: 1)), Color(#colorLiteral(red: 0.7875758843, green: 0.1211073788, blue: 0.3265729547, alpha: 1))]), startPoint: .topTrailing, endPoint: .bottomLeading)
                    .frame(width: 120, height: 120)
                    .mask(
                        Image(systemName: "hexagon.fill")
                            .foregroundColor(.pink)
                            .font(.system(size: 100))
                    )
                
                HStack(spacing: -20) {
                    Image(systemName: "star.fill")
                        .foregroundColor(.white.opacity(0.6))
                        .font(.system(size: 20))
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 34))
                        .offset(y: -6)
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(.white.opacity(0.6))
                        .font(.system(size: 20))
                }
            }
            .padding(.top, 20)
            
            VStack(spacing: 8) {
                BoxView(cornerRadius: 2, color: .white, frame: CGSize(width: 180, height: 18))
                BoxView(cornerRadius: 1, color: Color(#colorLiteral(red: 0.4294080734, green: 0.4205729365, blue: 0.4271319509, alpha: 1)), frame: CGSize(width: 220, height: 6))
                BoxView(cornerRadius: 1, color: Color(#colorLiteral(red: 0.4294080734, green: 0.4205729365, blue: 0.4271319509, alpha: 1)), frame: CGSize(width: 200, height: 6))
            }
            
            Spacer()
        }
        .padding(.top, 20)
        .offset(y: onFourth_BadgeViewOffsetY)
        .opacity(onFourth_BadgeViewOpacity)
        .onAppear {
            withAnimation(Animation.easeOut(duration: 0.7)) {
                onFourth_BadgeViewOffsetY = 0
                onFourth_BadgeViewOpacity = 1
            }
        }
    }
    
    func getQRCodeDate(text: String) {
        guard let filter = CIFilter(name: "CIQRCodeGenerator") else { fatalError() }
        let data = text.data(using: .ascii, allowLossyConversion: false)
        filter.setValue(data, forKey: "inputMessage")
        guard let ciimage = filter.outputImage else { fatalError() }
        let transform = CGAffineTransform(scaleX: 10, y: 10)
        let scaledCIImage = ciimage.transformed(by: transform)
        let finalImage = scaledCIImage.transparent!
        let uiimage = UIImage(ciImage: finalImage)
        qrData = uiimage.pngData()
    }
    
    func barStatusView() -> some View {
        return HStack {
            ForEach(0..<onboardings.count) { index in
                Capsule()
                    .frame(width: currentOnboarding == index ? 16 : 4, height: 4)
                    .foregroundColor(currentOnboarding == index ? Color(.label) : Color(.separator))
            }
        }
    }
    
    func skipView() -> some View {
        HStack {
            Spacer()
            Text("Skip")
                .foregroundColor(.gray)
                .font(.system(size: 14))
        }
    }
    
}
