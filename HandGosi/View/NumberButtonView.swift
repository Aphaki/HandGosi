//
//  ButtonView.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/05.
//

import SwiftUI

struct NumberButtonView: View {
    
    @Binding var isSelected: Bool
    let number: String
    let text: AttributedString
    
    
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


struct NumberButton_Previews: PreviewProvider {
    static var previews: some View {
        NumberButtonView(isSelected: .constant(false), number: "①", text: "1번입니다.")
        
    }
}
