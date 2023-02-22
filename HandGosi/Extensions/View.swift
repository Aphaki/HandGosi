//
//  View.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/24.
//
import SwiftUI

extension View {
    func yearText() -> some View{
        modifier(YearTextViewModifier())
    }
    
    func myNoteButton(color: Color) -> some View {
        modifier(MyNoteButtonViewModifier(color: color))
    }
    
}

struct YearTextViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(Color.theme.myBackgroundColor)
            .frame(width: 75, height: 75)
            .background(
                Circle()
                    .foregroundColor(Color.theme.myAccentColor)
                    
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
struct ProgressCircle: Shape {
    let degree: Double
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.midY))
            path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.height, startAngle: Angle(degrees: 270), endAngle: Angle(degrees: degree + 270), clockwise: false)
        }
    }

}
