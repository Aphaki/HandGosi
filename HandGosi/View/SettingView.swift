//
//  SettingView.swift
//  HandGosi
//
//  Created by Sy Lee on 2023/04/21.
//

import SwiftUI
import StoreKit

struct SettingView: View {
        
    
    @State var goToGuideView: Bool = false
    @State var restoreAlert: Bool = false
    
    var body: some View {
        List {
            Section {
                HStack {
                    Text("앱 가이드")
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(Color.theme.chevronColor)
                        .scaleEffect(0.8)
                }
                .onTapGesture {
                    goToGuideView.toggle()
                }
            }
            .background(
                NavigationLink(destination: GuideView(toMain: false), isActive: $goToGuideView, label: {
                    EmptyView()
                })
            )

        }
        .navigationTitle("설정")
        .listStyle(.grouped)
    }
}
