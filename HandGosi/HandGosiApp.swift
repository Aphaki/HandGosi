//
//  HandGosiApp.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/05.
//

import SwiftUI
import AppTrackingTransparency
import GoogleMobileAds

@main
struct HandGosiApp: App {
    
    init() {
        GADMobileAds.sharedInstance().start(completionHandler: nil)
        
//        DispatchQueue.global(qos: .default).asyncAfter(deadline: .now() + 1) {
//            ATTrackingManager.requestTrackingAuthorization { _ in
//
//            }
//        }
    }
    
    @StateObject var mainVM = MainVM()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(MainVM())
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)) { _ in
                    ATTrackingManager.requestTrackingAuthorization { _ in
                    }
                }
        }
    }
}
