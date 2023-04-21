//
//  SettingView.swift
//  HandGosi
//
//  Created by Sy Lee on 2023/04/21.
//

import SwiftUI

struct SettingView: View {
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
                SettingView()
                    .navigationTitle("Setting")
                    .navigationBarTitleDisplayMode(.large)
            }
        } else {
            NavigationView {
                SettingView()
                    .navigationTitle("Setting")
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}
