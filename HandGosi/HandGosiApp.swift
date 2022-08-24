//
//  HandGosiApp.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/05.
//

import SwiftUI

@main
struct HandGosiApp: App {
    
    @StateObject var mainVM = MainVM()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(MainVM())
        }
    }
}
