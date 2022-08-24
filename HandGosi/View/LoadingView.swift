//
//  LoadingView.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/24.
//

import SwiftUI

struct LoadingView: View {
    @Binding var isLoading: Bool
    @State var loadingText = "now loading...".uppercased().map { one in
        return String(one)
    }
    @State var count = 0
    @State var loop = 0
    
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    var body: some View {
        ZStack {
            Image("HandGosiRed")
                .resizable()
                .frame(width: 100, height: 180)
            HStack(spacing: 0){
                ForEach(loadingText.indices, id: \.self) { index in
                    Text(loadingText[index])
                        .font(.headline)
                        .foregroundColor(Color.theme.myAccentColor)
                        .offset(y: index == count ? -5 : 0)
                }
            }.onReceive(timer) { _ in
                withAnimation {
                    let lastIndex = loadingText.count - 1
                    if count == lastIndex {
                        count = 0
                        loop += 1
                        if loop >= 2 {
                            isLoading = false
                        }
                    } else {
                        count += 1
                    }
                }
            }
        }
        
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(isLoading: .constant(true))
    }
}
