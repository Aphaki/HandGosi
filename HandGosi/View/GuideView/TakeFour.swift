//
//  TakeFour.swift
//  HandGosi
//
//  Created by Sy Lee on 2023/05/19.
//

import SwiftUI

struct TakeFour: View {
    
    @EnvironmentObject var mainVM: MainVM
    var toMain: Bool
    
    var body: some View {
        ZStack {
            VStack {
                Image("4")
                    .resizable()
                    .scaledToFit()
                    .padding(5)
//                    .background(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 5).foregroundColor(Color.theme.chevronColor))
                    .scaleEffect(0.9)
                Text("오답노트에서 다시 풀어볼 수 있습니다.")
                    .font(.custom("NotoSansKR-Boldr", size: 18))
                    .foregroundColor(Color.theme.myWhite)
                HStack {
                    if toMain {
                        Button {
                            print("가이드 종료 클릭")
                            mainVM.saveFirstLoad(false)
                            mainVM.firstLoad.toggle()
                        } label: {
                            Text("핸드고시 시작하기")
                                .font(.custom("NotoSansKR-Bold", size: 20))
                                .foregroundColor(.white)
                                .frame(width: 270, height: 50)
                                .background( RoundedRectangle(cornerRadius: 5).opacity(1).foregroundColor(Color.theme.myFontColorTwo) )
                        }
                        .padding(.top, 20)
                        .padding(.bottom, 20)
                    } else {
                        Text("빈공간 채워")
                            .foregroundColor(.clear)
                            .frame(width: 270, height: 50)
                            .background( RoundedRectangle(cornerRadius: 5).opacity(0.0).foregroundColor(Color.clear) )
                            .padding(.top, 20)
                    }
                    
                }
            }
        }
        .padding()
    }
    
    
}

struct TakeFour_Previews: PreviewProvider {
    static var previews: some View {
        TakeFour(toMain: true)
    }
}
