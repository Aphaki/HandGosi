//
//  TakeTwo.swift
//  HandGosi
//
//  Created by Sy Lee on 2023/05/19.
//

import SwiftUI

struct TakeOne: View {
    
    @State private var animate = false
    
    var body: some View {
        ZStack {
            VStack {
                Text("앱 가이드 (1/4)")
                    .font(.title)
                Image("Take1")
                    .resizable()
                    .frame(width: 350, height: 400)
                    .opacity(0.5)
                    .padding(5)
                    .background(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 5).foregroundColor(Color.theme.myAccentColor))
                Text("번호를 탭하여 답안 체크")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(Color.theme.myAccentColor)
            }
            Image(systemName: "hand.point.left")
                .resizable()
                .frame(width: 50, height: 50)
                .scaleEffect(animate ? 1.2 : 0.6)
                .offset(x: -110, y: 65)
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
                        .easeInOut(duration: 2.0)
                        .repeatForever()
                ) {
                    animate.toggle()
                }
            }
        }
}

struct TakeTwo_Previews: PreviewProvider {
    static var previews: some View {
        TakeOne()
    }
}


