//
//  ButtonView.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/05.
//

import SwiftUI

struct NumberButton: View {
    
    @State var isSelected: Bool = false
    let number: String
    let numberInt: Int
    let text: String
    
    init(isSelected: Bool = false, number: String, numberInt: Int,text: String) {
        self.isSelected = isSelected
        self.number = number
        self.numberInt = numberInt
        self.text = text
    }
    
    
    var body: some View {
        VStack {
            HStack {
                Text(number)
                    .font(.largeTitle)
                    .overlay(Circle().opacity(isSelected ? 1 : 0))
                    .onTapGesture {
                        isSelected.toggle()
                    }
                Text(text)
                    .font(.headline)
                
            }
        }
    }
}


struct ButtonView: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            NumberButton(number: "①", numberInt: 1, text: "‘양소유’는 장원급제를 하여 한림학사가 되었다.")
            NumberButton(number: "②", numberInt: 2, text: "‘양소유’는 인간 세상에 환멸을 느껴 스스로 ‘성진’의 모습으로 되돌아왔다.")
            NumberButton(number: "③", numberInt: 3, text: "‘성진’이 있는 곳은 인간 세상이 아니다.")
            NumberButton(number: "④", numberInt: 4, text: "‘성진’은 자신의 외양을 통해 꿈에서 돌아왔음을 인식한다.")
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
