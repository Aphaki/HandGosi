//
//  TakeThree.swift
//  HandGosi
//
//  Created by Sy Lee on 2023/05/19.
//

import SwiftUI

struct TakeThree: View {
    
    @State private var animate = false
    
    var body: some View {
        ZStack {
            VStack {
                Image("Take3")
                    .resizable()
                    .frame(width: 350, height: 500)
                    .padding(5)
                    .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color.theme.myAccentColor))
                Text("오답노트 추가 가능")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(Color.theme.myAccentColor)
            }
            Image(systemName: "hand.point.up")
                .resizable()
                .frame(width: 50, height: 50)
                .scaleEffect(animate ? 1.2 : 0.6)
                .offset(x: 120, y: -170)
                .foregroundColor(.black)
                .opacity(0.5)
        }
        .padding()
        .onAppear(perform: addAnimation)
    }
    
    func addAnimation() {
            guard !animate else { return }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation(
                    Animation
                        .easeInOut(duration: 2.0)
                        .repeatForever()
                ) {
                    animate.toggle()
                }
            }
        }
}

struct TakeThree_Previews: PreviewProvider {
    static var previews: some View {
        TakeThree()
    }
}
