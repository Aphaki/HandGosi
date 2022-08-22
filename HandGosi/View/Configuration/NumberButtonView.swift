//
//  ButtonView.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/05.
//

import SwiftUI

struct NumberButtonView: View {
    
    @Binding var selectedNum: Int
    let number: String
    let numberInt: Int
    let text: AttributedString
    
    
    var body: some View {
        VStack {
            HStack {
                Text(number)
                    .font(.largeTitle)
                    .overlay(Circle().opacity(selectedNum == numberInt ? 1 : 0))
                    .onTapGesture {
                        if selectedNum != numberInt {
                        selectedNum = numberInt
                        } else {
                            selectedNum = 0
                        }
                    }
                Text(text)
                    .font(.custom("NanumMyeongjo-YetHangul", size: 16))
                
            }
        }
    }
}


struct NumberButton_Previews: PreviewProvider {
    static var previews: some View {
        NumberButtonView(selectedNum: .constant(1), number: "①", numberInt: 1, text: "1번입니다.")
        
    }
}
