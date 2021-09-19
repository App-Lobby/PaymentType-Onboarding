//
//  ContentView.swift
//  PaymentType-Onboarding
//
//  Created by Mohammad Yasir on 19/09/21.
//

import SwiftUI

struct OnboardingView: View {
    
    @State var onboardings: [OnboardingState] = [.onFirst, .onSecond, .onThird, .onFourth]
    @State var currentOnboarding = 0
    @State var onboardingState: OnboardingState = .onFirst
    
    @State var qrData: Data?
    
    @State var onFirst_CardOffsetY: CGFloat = 50
    @State var onFirst_CardOpacity: Double = 0
    
    @State var onSecond_TopBoxOffsetY: CGFloat = 50
    @State var onSecond_TopBoxOpacity: Double = 0
    @State var onSecond_BottomSmallBoxOffsetY: CGFloat = -50
    @State var onSecond_BottomSmallBoxOpacity: Double = 0
    @State var onSecond_BottomLargeBoxOffsetY: CGFloat = 50
    @State var onSecond_BottomLargeBoxOpacity: Double = 0
    
    @State var onThird_qrOverlayScale: CGFloat = 100
    @State var onThird_qrOverlayOffsetY: CGFloat = 0
    
    @State var onFourth_BadgeViewOffsetY: CGFloat = 50
    @State var onFourth_BadgeViewOpacity: Double = 0
    @State var onFourth_NotificationOffsetY: CGFloat = -50
    @State var onFourth_NotificationOpacity: Double = 0
    
    var body: some View {
        VStack {
            Spacer()
            skipView()
            Spacer()
            VStack {
                if onboardingState == .onSecond {
                    BoxView(cornerRadius: 4, color: Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)), frame: CGSize(width: UIScreen.iPhoneViewWidth - 100, height: 16))
                        .opacity(onSecond_TopBoxOpacity)
                        .offset(y: onSecond_TopBoxOffsetY)
                        .onAppear {
                            withAnimation(Animation.easeOut(duration: 0.7)) {
                                onSecond_TopBoxOffsetY = 0
                                onSecond_TopBoxOpacity = 1
                            }
                        }
                        .padding(.bottom, 10)
                }
                
                if onboardingState == .onFourth {
                    VStack(alignment: .leading, spacing: 4) {
                        HStack {
                            BoxView(cornerRadius: 1, color: Color(#colorLiteral(red: 0.9267984629, green: 0.2572380602, blue: 0.5417157412, alpha: 1)), frame: CGSize(width: 12, height: 12))
                            BoxView(cornerRadius: 1, color: Color(#colorLiteral(red: 0.4071337879, green: 0.4043343663, blue: 0.4075930715, alpha: 1)), frame: CGSize(width: 70, height: 7))
                            Spacer()
                            BoxView(cornerRadius: 1, color: Color(#colorLiteral(red: 0.4071337879, green: 0.4043343663, blue: 0.4075930715, alpha: 1)), frame: CGSize(width: 40, height: 4))
                        }
                        
                        BoxView(cornerRadius: 1, color: Color(#colorLiteral(red: 0.4071337879, green: 0.4043343663, blue: 0.4075930715, alpha: 1)), frame: CGSize(width: 70, height: 6))
                        BoxView(cornerRadius: 1, color: Color(#colorLiteral(red: 0.2209679782, green: 0.2092144191, blue: 0.2191263735, alpha: 1)), frame: CGSize(width: 90, height: 7))
                        BoxView(cornerRadius: 1, color: Color(#colorLiteral(red: 0.2209679782, green: 0.2092144191, blue: 0.2191263735, alpha: 1)), frame: CGSize(width: 240, height: 7))
                    }
                    .padding(6)
                    .background(Color(#colorLiteral(red: 0.0862745098, green: 0.08764776483, blue: 0.1331157684, alpha: 1)).opacity(0.7))
                    .cornerRadius(4)
                    .opacity(onFourth_NotificationOpacity)
                    .offset(y: onFourth_NotificationOffsetY)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                            withAnimation(Animation.easeOut(duration: 0.5)) {
                                onFourth_NotificationOffsetY = 0
                                onFourth_NotificationOpacity = 1
                            }
                        }
                    }
                }
                
                if onboardingState == .onFirst || onboardingState == .onSecond {
                    ZStack {
                        if onboardingState == .onFirst {
                            onFirst_Card(color: Color(#colorLiteral(red: 0.3492952287, green: 0.3477921784, blue: 0.424975723, alpha: 1)), width: UIScreen.iPhoneViewWidth - 100, isInnerBoxes: false)
                                .offset(y: -60)
                            onFirst_Card(color: Color(#colorLiteral(red: 0.8275518417, green: 0.8563697934, blue: 0.8934897184, alpha: 1)), width: UIScreen.iPhoneViewWidth - 80, isInnerBoxes: false)
                                .offset(y: -40)
                            onFirst_Card(color: Color(#colorLiteral(red: 0.9050437808, green: 0.6554631591, blue: 0.243729353, alpha: 1)), width: UIScreen.iPhoneViewWidth - 60, isInnerBoxes: false)
                                .offset(y: -20)
                        }
                        
                        onFirst_Card(color: Color(#colorLiteral(red: 0.9341682792, green: 0.3832183778, blue: 0.4675764441, alpha: 1)), width: UIScreen.iPhoneViewWidth - 40, isInnerBoxes: true)
                        
                    }
                    .frame(maxHeight: 200)
                }
                
                if onboardingState == .onThird {
                    qrView
                }
                
                if onboardingState == .onSecond {
                    onSecond_BoxesView
                        .padding(.vertical, 10)
                }
                
                if onboardingState == .onFourth {
                    onFourth_BadgeView
                }
                
            }
            .padding(.horizontal, 40)
            .padding(.top, 30)
            .frame(width: UIScreen.iPhoneViewWidth, height: UIScreen.iPhoneViewHeight)
            .overlay(
                RoundedRectangle(cornerRadius: 38)
                    .stroke(LinearGradient.iPhoneStrokeGradient, lineWidth: 6)
            )
            .overlay(
                CustomRoundedConrnerView(color: Color(#colorLiteral(red: 0.2339423895, green: 0.2282523513, blue: 0.2348703146, alpha: 1)), tl: 0, tr: 0, bl: 14, br: 14)
                    .frame(width: UIScreen.main.bounds.width / 2.5, height: 24),
                alignment: .top)
            
            Spacer()
            
            VStack(spacing: 16) {
                
                barStatusView()
                
                ForEach(OnboardingState.allCases) { screen in
                    if screen == onboardingState {
                        Text(screen.title)
                            .modifier(TitleModifier())
                        Text(screen.caption)
                            .modifier(CaptionModifier())
                    }
                }
                
                Button {
                    withAnimation(Animation.easeOut(duration: 0.5)) {
                        if currentOnboarding < 3 {
                            currentOnboarding += 1
                            onboardingState = onboardings[currentOnboarding]
                        }
                    }
                } label: {
                    Text(currentOnboarding == 2 ? "Finish" : "Next")
                        .foregroundColor(Color(#colorLiteral(red: 0.690109551, green: 0.2436177433, blue: 0.3018383384, alpha: 1)))
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .background(Color(#colorLiteral(red: 0.2347359657, green: 0.1548905075, blue: 0.163808167, alpha: 1)))
                        .cornerRadius(4)
                        .padding(.top, 10)
                }
                
            }
            .padding(.vertical, 16)
            
        }
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(#colorLiteral(red: 0.1326514781, green: 0.1298131347, blue: 0.1331157684, alpha: 1)).edgesIgnoringSafeArea(.all))
        .onAppear {
            getQRCodeDate(text: "Data inside the QR code is here. You can put anything you wish !")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
