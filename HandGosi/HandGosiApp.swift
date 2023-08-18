//
//  HandGosiApp.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/05.
//

import SwiftUI

@main
struct HandGosiApp: App {

    init() {
            UINavigationBar.appearance().largeTitleTextAttributes =
            [.font : UIFont(name: "NotoSansKR-Bold", size: 25) as Any ,
             .foregroundColor : UIColor(Color.theme.myAccentColor)]
            UINavigationBar.appearance().titleTextAttributes =
            [.font : UIFont(name: "NotoSansKR-Bold", size: 25) as Any ,
             .foregroundColor : UIColor(Color.theme.myAccentColor)]
        }
    
    @StateObject private var mainVM = MainVM()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(mainVM)
        }
    }
}
