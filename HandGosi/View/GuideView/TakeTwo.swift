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
                Text("앱 가이드 (2/4)")
                    .font(.title)
                Image("Take1")
                    .resizable()
                    .frame(width: 350, height: 400)
                    .opacity(0.8)
                    .padding(5)
                    .background(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 5).foregroundColor(Color.theme.myAccentColor))
                Text("채점지로 가서 정답확인")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(Color.theme.myAccentColor)
            }
            Image(systemName: "hand.point.up")
                .resizable()
                .frame(width: 50, height: 50)
//                .scaleEffect(animate ? 1.2 : 0.8)
                .offset(x: 120, y: -130)
                .foregroundColor(.black)
                .opacity(0.5)
            HStack {
                Spacer()
                Image(systemName: "hand.tap.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .offset(x: animate ? -30 : 0)
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
