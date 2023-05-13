//
//  SettingView.swift
//  HandGosi
//
//  Created by Sy Lee on 2023/04/21.
//

import SwiftUI
import StoreKit

struct SettingView: View {
    
    @EnvironmentObject var mainVM: MainVM
    
    @Binding var products: [Product]
    @Binding var productOne: Bool
    
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
                if !productOne {
                    Button {
                        if let product = self.products.first {
                            mainVM.purchaseProduct(product: product)
                        }
                    } label: {
                        Text("광고 제거 (\(products.first?.displayPrice ?? "none"))")
                    }
                }
                if !productOne{
                    Button("구매 복원") {
                        if let product = self.products.first {
                            mainVM.checkProduct(product: product)
                        }
                        print("구매 복원 액선")
                    }
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
        .onAppear {
            print("settingView appear and productOne: \(mainVM.productOne)")
            
        }
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
