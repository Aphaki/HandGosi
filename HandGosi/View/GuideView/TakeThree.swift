//
//  TakeThree.swift
//  HandGosi
//
//  Created by Sy Lee on 2023/05/19.
//

import SwiftUI

struct TakeThree: View {
    
    @State private var animate: CGFloat = 0

    var body: some View {
        ZStack {
            VStack {
                Text("앱 가이드 (3/4)")
                    .font(.title)
                Image("Take3")
                    .resizable()
                    .frame(width: 350, height: 500)
                    .opacity(0.8)
                    .padding(5)
                    .background(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 5).foregroundColor(Color.theme.myAccentColor))
                Text("오답노트 추가 가능")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(Color.theme.myAccentColor)
            }
            Image(systemName: "hand.point.up")
                .resizable()
                .frame(width: 50, height: 50)
//                .scaleEffect(animate ? 1.2 : 0.8)
                .offset(x: 120, y: -150)
                .foregroundColor(.black)
                .opacity(0.5)
            HStack {
                Spacer()
                Image(systemName: "hand.tap.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .offset(x: -animate)
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
                    if animate > 100 {
                        animate = 0
                    } else {
                        animate += 30
                    }
                }
            }
        }
}

struct TakeThree_Previews: PreviewProvider {
    static var previews: some View {
        TakeThree()
    }
}
