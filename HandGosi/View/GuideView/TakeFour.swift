//
//  TakeFour.swift
//  HandGosi
//
//  Created by Sy Lee on 2023/05/19.
//

import SwiftUI

struct TakeFour: View {
    
    @EnvironmentObject var mainVM: MainVM
    @State private var animate = false
    var toMain: Bool
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    Spacer()
                    Spacer()
                    Text("앱 가이드 (4/4)")
                        .font(.title)
                    Spacer()
                    if toMain {
                        Button {
                            print("가이드 종료 클릭")
                            mainVM.saveFirstLoad(false)
                            mainVM.firstLoad.toggle()
                        } label: {
                            Text("가이드 종료")
                                .foregroundColor(.red)
                                .padding(5)
                                .background( RoundedRectangle(cornerRadius: 5).opacity(0.2).foregroundColor(.red) )
                        }
                    } else {
                        Text("빈공간 채워")
                            .foregroundColor(.clear)
                            .padding(5)
                            .background( RoundedRectangle(cornerRadius: 5).opacity(0.2).foregroundColor(.clear) )
                    }
                    
                }
                Image("Take3")
                    .resizable()
                    .frame(width: 350, height: 500)
                    .opacity(0.5)
                    .padding(5)
                    .background(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 5).foregroundColor(Color.theme.myAccentColor))
                Text("표기답안 저장, 초기화 선택 가능")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(Color.theme.myAccentColor)
            }
            Image(systemName: "hand.point.up")
                .resizable()
                .frame(width: 50, height: 50)
                .scaleEffect(animate ? 1.2 : 0.8)
                .offset(x: -145, y: -190)
                .foregroundColor(.black)
                .opacity(0.5)
        }
        .padding()
        .onAppear(perform: addAnimation)
    }
    
    func addAnimation() {
//            guard !animate else { return }
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                withAnimation(
                    Animation
                        .easeInOut(duration: 1.5)
                        .repeatForever()
                ) {
                    animate.toggle()
                }
            }
        }
}

struct TakeFour_Previews: PreviewProvider {
    static var previews: some View {
        TakeFour(toMain: true)
    }
}
