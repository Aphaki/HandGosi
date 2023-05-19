//
//  GuideView.swift
//  HandGosi
//
//  Created by Sy Lee on 2023/05/17.
//

import SwiftUI

struct GuideView: View {
    var body: some View {
        TabView {
            TakeOne()
            TakeTwo()
            TakeThree()
            TakeFour()
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .background(Color.theme.mySecondary.opacity(0.3))
    }
}


struct GuideView_Previews: PreviewProvider {
    static var previews: some View {
        GuideView()
    }
}
