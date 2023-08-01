//
//  LoadingView.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/24.
//

import SwiftUI

struct LoadingView: View {
    @Binding var isLoading: Bool
    @State var loadingText = "...".uppercased().map { one in
        return String(one)
    }
    @State var count = 0
    @State var loop = 0
    
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    var body: some View {
        ZStack {
            //배경
            Color.theme.myBackgroundColor.ignoresSafeArea()
            
            //아이콘
            VStack {
                Spacer()
                ZStack {
                    Image("handgosi_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 115, height: 115, alignment: .center)
                    // ...
                    HStack(spacing: 0){
                        ForEach(loadingText.indices, id: \.self) { index in
                            Text(loadingText[index])
                                .font(.custom("NotoSansKR-Bold", size: 50))
                                .foregroundColor(Color.theme.myGray)
                                .offset(y: index == count ? -6 : 0)
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
                Spacer()
                Text("공무원 시험 기출문제가 내 손안에")
                    .font(.custom("NotoSansKR-Bold", size: 13))
                    .padding(.bottom, 2)
                Text("HandGosi")
                    .font(.custom("GangwonEduPowerExtraBold", size: 35))
                    .foregroundColor(Color.theme.myFontColorTwo)
                    .padding(.bottom, 90)
            }
            
            
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(isLoading: .constant(true))
    }
}
