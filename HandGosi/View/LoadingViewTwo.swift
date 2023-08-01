//
//  LoadingViewTwo.swift
//  HandGosi
//
//  Created by Sy Lee on 2023/08/01.
//

import SwiftUI

struct LoadingViewTwo: View {
    
    @Binding var isLoading: Bool
    
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                Image("handgosi_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150, alignment: .center)
                ProgressView()
                    .padding(30)
            }
            .offset(y: -20)
            Spacer()
            Text("공무원 시험 기출문제가 내 손안에")
                .font(.custom("NotoSansKR-Bold", size: 13))
                .padding(.bottom, 2)
            Text("HandGosi")
                .font(.custom("GangwonEduPowerExtraBold", size: 35))
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.myFontColorTwo)
                .padding(.bottom, 50)
        }
    }
}

struct LoadingViewTwo_Previews: PreviewProvider {
    static var previews: some View {
        LoadingViewTwo(isLoading: .constant(true))
    }
}
