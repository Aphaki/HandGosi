//
//  ProgressCircle.swift
//  HandGosi
//
//  Created by Sy Lee on 2023/05/17.
//

import SwiftUI

struct ProgressCircle: Shape {
    let degree: Double
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.midY))
            path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.height, startAngle: Angle(degrees: 270), endAngle: Angle(degrees: degree + 270), clockwise: false)
        }
    }

}
