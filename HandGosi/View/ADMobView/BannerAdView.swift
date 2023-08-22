//
//  BannerAdView.swift
//  HandGosi
//
//  Created by Sy Lee on 2023/08/21.
//

import SwiftUI
import GoogleMobileAds

struct BannerAdView: View {
    @State var height: CGFloat = 0
    @State var width: CGFloat = 0
//    @State var adPosition: AdPosition
    let adUnitId: String
    
    init(adUnitId: String) {
//        self.adPosition = adPosition
        self.adUnitId = adUnitId
    }
    
    enum AdPosition {
        case top
        case bottom
    }
    var body: some View {
        VStack {
//            if adPosition == .bottom {
//                Spacer()
//                    .foregroundColor(.clear)
//            }
            
            BannerAd(adUnitId: adUnitId)
                .frame(width: width, height: height, alignment: .center)
                .onAppear {
                    setFrame()
                }
                .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                    setFrame()
                }
//            if adPosition == .top {
//                Spacer()
//                    .foregroundColor(.clear)
//            }
        }
    }
    
    func setFrame() {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        let safeAreaInsets = window?.safeAreaInsets ?? .zero
        
        let frame = UIScreen.main.bounds.inset(by: safeAreaInsets)
        
        let adSize = GADCurrentOrientationAnchoredAdaptiveBannerAdSizeWithWidth(frame.width)
        
        self.width = adSize.size.width
        self.height = adSize.size.height
    }
}
