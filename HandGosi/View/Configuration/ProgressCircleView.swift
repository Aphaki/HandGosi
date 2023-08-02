//
//  ProgressCircleView.swift
//  HandGosi
//
//  Created by Sy Lee on 2023/08/02.
//

import SwiftUI

struct ProgressCircleView: View {
    
    let degree: Double
    
    var body: some View {
        ZStack {
            ProgressCircle(degree: degree)
                .foregroundColor(Color.green)
            Circle()
                .scaleEffect(1.5)
                .foregroundColor(Color.theme.circleCenterColor)
        }
    }
}

struct ProgressCircleView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressCircleView(degree: 105)
    }
}
