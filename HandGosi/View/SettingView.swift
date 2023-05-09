//
//  SettingView.swift
//  HandGosi
//
//  Created by Sy Lee on 2023/04/21.
//

import SwiftUI

struct SettingView: View {
    @EnvironmentObject var mainVM: MainVM
    
    @Binding var purchasedIds: [String]
    
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
                if purchasedIds.isEmpty {
                    Button("광고 제거 \(mainVM.products.first!.displayPrice)") {
                        mainVM.purchase()
                    }
                    Button("구매 복원") {
                        print("\(purchasedIds)")
                        mainVM.fetchProducts()
                    }
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
                SettingView(purchasedIds: .constant([]))
                    .navigationTitle("Setting")
                    .navigationBarTitleDisplayMode(.large)
            }
        } else {
            NavigationView {
                SettingView(purchasedIds: .constant([]))
                    .navigationTitle("Setting")
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}
