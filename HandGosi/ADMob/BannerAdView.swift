//
//  BannerAdView.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/10/13.
//

//import SwiftUI
//import GoogleMobileAds
//
//struct BannerAdView: View {
//    @State var height: CGFloat = 0
//    @State var width: CGFloat = 0
//
//    let adUnitId: String
//    
//    init(adUnitId: String) {
//
//        self.adUnitId = adUnitId
//    }
//    
//
//    var body: some View {
//        VStack {
//            BannerAd(adUnitId: adUnitId)
//                .frame(width: width, height: height, alignment: .center)
//                .onAppear {
//                    setFrame()
//                }
//                .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
//                    setFrame()
//                }
//        }
//    }
//    
//    func setFrame() {
//        let scenes = UIApplication.shared.connectedScenes
//        let windowScene = scenes.first as? UIWindowScene
//        let window = windowScene?.windows.first
//        let safeAreaInsets = window?.safeAreaInsets ?? .zero
//        
//        let frame = UIScreen.main.bounds.inset(by: safeAreaInsets)
//        
//        let adSize = GADCurrentOrientationAnchoredAdaptiveBannerAdSizeWithWidth(frame.width)
//        
//        self.width = adSize.size.width
//        self.height = adSize.size.height
//    }
//}
