//
//  BannerView.swift
//  HandGosi
//
//  Created by Sy Lee on 2023/08/19.
//

import SwiftUI
import GoogleMobileAds


//struct BannerView: UIViewControllerRepresentable {
//    @State var viewWidth: CGFloat = 0
//    @State var viewHeight: CGFloat = 0
//
//    private let bannerView = GADBannerView()
//    private let adUnitId = "ca-app-pub-3940256099942544/2934735716"
//
//
//    func makeUIViewController(context: Context) -> some UIViewController {
//        let bannerViewController = BannerViewController()
//        bannerView.adUnitID = adUnitId
//        bannerView.rootViewController = bannerViewController
//        bannerViewController.view.addSubview(bannerView)
//        bannerViewController.delegate = context.coordinator
//
//        return bannerViewController
//    }
//
//    func makeCoordinator() -> Coordinator {
//        Coordinator(self)
//    }
//    internal class Coordinator: NSObject, BannerViewControllerWidthDelegate {
//        let patent: BannerView
//        init(_ patent: BannerView) {
//            self.patent = patent
//        }
//        func bannerViewController(_ bannerViewController: BannerViewController, didUpdate width: CGFloat) {
//            patent.viewWidth = width
//        }
//    }
//
//    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
//        guard viewWidth != .zero else { return }
//
//        bannerView.adSize = GADCurrentOrientationAnchoredAdaptiveBannerAdSizeWithWidth(viewWidth)
//        bannerView.load(GADRequest())
//    }
//}
struct BannerAd: UIViewControllerRepresentable {
    
    let adUnitId: String
    
    init(adUnitId: String) {
        self.adUnitId = adUnitId
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        return BannerAdVC(adUnitID: adUnitId)
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

