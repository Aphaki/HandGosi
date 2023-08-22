//
//  BannerViewController.swift
//  HandGosi
//
//  Created by Sy Lee on 2023/08/19.
//

//import UIKit
//
//class BannerViewController: UIViewController {
//
//    weak var delegate: BannerViewControllerWidthDelegate?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//    }
//
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//
//        // 델리겟에게 초기 width를 알림
//        delegate?.bannerViewController(self, didUpdate: view.frame.inset(by: view.safeAreaInsets).size.width)
//    }
//
//    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
//        coordinator.animate { _ in
//
//        } completion: { _ in
//            // 델리겟 에게 width 변경사항 알리기
//            self.delegate?.bannerViewController(self, didUpdate: self.view.frame.inset(by: self.view.safeAreaInsets).size.width )
//        }
//
//    }
//
//}
//
//protocol BannerViewControllerWidthDelegate: AnyObject {
//    func bannerViewController(_ bannerViewController: BannerViewController, didUpdate width: CGFloat)
//}
import SwiftUI
import GoogleMobileAds

class BannerAdVC: UIViewController {
    let adUnitID: String
    
    // 변수 이니셜라이져
    init(adUnitID: String) {
        self.adUnitID = adUnitID
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var bannerView: GADBannerView = GADBannerView()
    
    override func viewDidLoad() {
        bannerView.adUnitID = adUnitID
        bannerView.rootViewController = self
        
        view.addSubview(bannerView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        loadBannerAd()
        
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate { _ in
            self.bannerView.isHidden = true
        } completion: { _ in
            self.bannerView.isHidden = false
            self.loadBannerAd()
        }
    }
    
    func loadBannerAd() {
        let frame = view.frame.inset(by: view.safeAreaInsets)
        let viewWidth = frame.size.width
        
        bannerView.adSize = GADCurrentOrientationAnchoredAdaptiveBannerAdSizeWithWidth(viewWidth)
        
        bannerView.load(GADRequest())
    }
}
