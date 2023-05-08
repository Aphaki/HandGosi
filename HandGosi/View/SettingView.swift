//
//  SettingView.swift
//  HandGosi
//
//  Created by Sy Lee on 2023/04/21.
//

import SwiftUI

struct SettingView: View {
    @EnvironmentObject var mainVM: MainVM
    
    @Binding var isPurchased: Bool
    
    var body: some View {
        List {
            Section {
                HStack {
                    Text("앱 가이드")
                    Spacer()
                    Image(systemName: "chevron.right")
                }
                .onTapGesture {
                    print("Go to next view")
                }
            }
            Section {
                if !isPurchased {
                    Button("광고 제거(0.99$)") {
                        mainVM.purchase()
                    }
                }
                Button("구매 복원") {
                    print("구매 복원 액선")
                }
            }
        }
        .navigationTitle("Setting")
        .listStyle(.grouped)
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 16.0, *) {
            NavigationStack {
                SettingView(isPurchased: .constant(false))
                    .navigationTitle("Setting")
                    .navigationBarTitleDisplayMode(.large)
            }
        } else {
            NavigationView {
                SettingView(isPurchased: .constant(false))
                    .navigationTitle("Setting")
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}
