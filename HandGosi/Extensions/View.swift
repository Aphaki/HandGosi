//
//  View.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/24.
//
import SwiftUI

struct YearTextViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(15)
            .background(
                Capsule().opacity(0.3)
                    .shadow(color: .black, radius: 10, x: 0, y: 10)
            )
        
    }
}
struct MyNoteButtonViewModifier: ViewModifier {
    
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding(30)
            .background(
                Circle().opacity(0.8)
                    .foregroundColor(color)
                    .shadow(color: color, radius: 10, x: 0, y: 5)
            )
    }
}

extension View {
    func yearText() -> some View{
        modifier(YearTextViewModifier())
    }
    
    func myNoteButton(color: Color) -> some View {
        modifier(MyNoteButtonViewModifier(color: color))
    }
    
}

