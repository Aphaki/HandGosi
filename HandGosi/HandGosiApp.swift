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
            if ATTrackingManager.trackingAuthorizationStatus == .notDetermined {
                //User has not indicated their choice for app tracking
                //You may want to show a pop-up explaining why you are collecting their data
                //Toggle any variables to do this here
            } else {
                ATTrackingManager.requestTrackingAuthorization { status in
                    //Whether or not user has opted in initialize GADMobileAds here it will handle the rest
                                                                
                    GADMobileAds.sharedInstance().start(completionHandler: nil)
                }
            }
        }
//    init() {
//        GADMobileAds.sharedInstance().start(completionHandler: nil)
        
//        DispatchQueue.global(qos: .default).asyncAfter(deadline: .now() + 1) {
//            ATTrackingManager.requestTrackingAuthorization { _ in
//
//            }
//        }
//    }
    
    @StateObject var mainVM = MainVM()
    
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
