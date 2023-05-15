//
//  SettingView.swift
//  HandGosi
//
//  Created by Sy Lee on 2023/04/21.
//

import SwiftUI
import StoreKit

struct SettingView: View {
    
//    @EnvironmentObject var mainVM: MainVM
    
    @EnvironmentObject var purchaseManager: PurchaseManager
    
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
                ForEach(purchaseManager.products) { (product) in
                    if !purchaseManager.purchasedProductIDs.contains(product.id) {
                        Button {
                            Task {
                                do {
                                    try await purchaseManager.purchase(product)
                                } catch {
                                    print(error)
                                }
                            }
                        } label: {
                            Text("\(product.displayName) - \(product.displayPrice)")
                        }
                    }
                }
                Button("구매 복원") {
                    Task {
                        do {
                            try await AppStore.sync()
                        }
                        catch {
                            print(error)
                        }
                        
                    }
                    print("구매 복원 액선")
                }
                
//                Button("products 값") {
//                    print("products 값 : \(self.products)")
//                }
//                Button("productOne 값") {
//                    print("productOne 값 : \(self.productOne)")
//                }
            }
        }
        .navigationTitle("Setting")
        .listStyle(.grouped)
    }
}

//struct SettingView_Previews: PreviewProvider {
//    static var previews: some View {
//        if #available(iOS 16.0, *) {
//            NavigationStack {
//                SettingView(products: <#Binding<[Product]>#>, productOne: <#Binding<Bool>#>)
//                    .navigationTitle("Setting")
//                    .navigationBarTitleDisplayMode(.large)
//            }
//        } else {
//            NavigationView {
//                SettingView()
//                    .navigationTitle("Setting")
//                    .navigationBarTitleDisplayMode(.inline)
//            }
//        }
//    }
//}
