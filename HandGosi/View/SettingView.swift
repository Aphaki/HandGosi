//
//  SettingView.swift
//  HandGosi
//
//  Created by Sy Lee on 2023/04/21.
//

import SwiftUI
import StoreKit

struct SettingView: View {
        
    @EnvironmentObject var purchaseManager: PurchaseManager
    
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
//            Section {
//                ForEach(purchaseManager.products) { (product) in
//                    if !purchaseManager.purchasedProductIDs.contains(product.id) {
//                        Button {
//                            Task {
//                                do {
//                                    try await purchaseManager.purchase(product)
//                                } catch {
//                                    print(error)
//                                }
//                            }
//                        } label: {
//                            Text("\(product.displayName) - \(product.displayPrice)")
//                        }
//                    }
//                }
//                Button("구매 복원") {
//                    Task {
//                        do {
//                            try await AppStore.sync()
////                            await purchaseManager.updatePurchasedProducts()
//                            restoreAlert.toggle()
//                        }
//                        catch {
//                            print(error)
//                            print("구매복원 에러 실패")
//                        }
//                    }
//
//                }
//            }
        }
        .navigationTitle("Setting")
        .listStyle(.grouped)
//        .alert("구매 복원 완료", isPresented: $restoreAlert) {
//
//        }
    }
}
