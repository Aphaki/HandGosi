//
//  TakeTwo2.swift
//  HandGosi
//
//  Created by Sy Lee on 2023/05/19.
//

import SwiftUI

struct TakeTwo: View {
    
    @State private var animate: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                Image("2")
                    .resizable()
                    .scaledToFit()
                    .padding(5)
//                    .background(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 5).foregroundColor(Color.theme.chevronColor))
                    .scaleEffect(0.9)
                Text("채점지로 버튼을 누르고 정답을 확인하세요.")
                    .font(.custom("NotoSansKR-Bold", size: 18))
                    .foregroundColor(Color.theme.myWhite)
                Text("빈공간 채워")
                    .foregroundColor(.clear)
                    .frame(width: 270, height: 50)
                    .background( RoundedRectangle(cornerRadius: 5).opacity(0.0).foregroundColor(Color.clear) )
                    .padding(.top, 20)
            }
            HStack {
                Spacer()
                Image(systemName: "hand.tap.fill")
                    .resizable()
                    .frame(width: 30, height: 35)
                    .offset(x: animate ? -50 : 0)
                    .foregroundColor(.black)
                    .opacity(0.2)
            }
        }
        .padding()
        .onAppear(perform: addAnimation)
    }
    
    func addAnimation() {
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                withAnimation(
                    Animation
                        .easeOut(duration: 1.0)
                        .repeatForever()
                ) {
                    animate.toggle()
                }
            }
        }}

struct TakeTwo2_Previews: PreviewProvider {
    static var previews: some View {
        TakeTwo()
    }
}
