//
//  BannerAdVC.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/10/13.
//

//import SwiftUI
//import GoogleMobileAds
//
//class BannerAdVC: UIViewController {
//    let adUnitID: String
//    
//    // 변수 이니셜라이져
//    init(adUnitID: String) {
//        self.adUnitID = adUnitID
//        super.init(nibName: nil, bundle: nil)
//    }
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    var bannerView: GADBannerView = GADBannerView()
//    
//    override func viewDidLoad() {
//        bannerView.adUnitID = adUnitID
//        bannerView.rootViewController = self
//        
//        view.addSubview(bannerView)
//    }
//    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        
//        loadBannerAd()
//        
//    }
//    
//    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
//        super.viewWillTransition(to: size, with: coordinator)
//        coordinator.animate { _ in
//            self.bannerView.isHidden = true
//        } completion: { _ in
//            self.bannerView.isHidden = false
//            self.loadBannerAd()
//        }
//    }
//    
//    func loadBannerAd() {
//        let frame = view.frame.inset(by: view.safeAreaInsets)
//        let viewWidth = frame.size.width
//        
//        bannerView.adSize = GADCurrentOrientationAnchoredAdaptiveBannerAdSizeWithWidth(viewWidth)
//        
//        bannerView.load(GADRequest())
//    }
//}
//
//struct BannerAd: UIViewControllerRepresentable {
//    
//    let adUnitId: String
//    
//    init(adUnitId: String) {
//        self.adUnitId = adUnitId
//    }
//    
//    func makeUIViewController(context: Context) -> some UIViewController {
//        return BannerAdVC(adUnitID: adUnitId)
//    }
//    
//    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
//        
//    }
//}
