//
//  HandGosiApp.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/05.
//

import SwiftUI
import GoogleMobileAds
import AppTrackingTransparency

@main
struct HandGosiApp: App {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes =
        [.font : UIFont(name: "NotoSansKR-Bold", size: 25) as Any ,
         .foregroundColor : UIColor(Color.theme.myAccentColor)]
        UINavigationBar.appearance().titleTextAttributes =
        [.font : UIFont(name: "NotoSansKR-Bold", size: 25) as Any ,
         .foregroundColor : UIColor(Color.theme.myAccentColor)]
        
        if ATTrackingManager.trackingAuthorizationStatus == .notDetermined {
            
        } else {
            ATTrackingManager.requestTrackingAuthorization { status in
                GADMobileAds.sharedInstance().start()
            }
        }
    }
    
    @StateObject private var mainVM = MainVM()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(mainVM)
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)) { _ in
                    ATTrackingManager.requestTrackingAuthorization { _ in
                        
                    }
                }
        }
    }
}
