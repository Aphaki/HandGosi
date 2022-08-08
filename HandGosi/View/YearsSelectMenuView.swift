//
//  YearsSelectMenuView.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/08.
//

import SwiftUI

struct YearsSelectMenuView: View {
    
    let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
    
    @State var selectedYear: Int? = nil
    @State var showNextView = false
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(2011..<2023) { num in
                Text("\(num.description)")
                    .onTapGesture {
                        selectedYear = num
                        showNextView.toggle()
                    }
            }
            Spacer()
        }
        .background(
            NavigationLink(isActive: $showNextView, destination: { FinalMenuView(year: selectedYear ?? 0) }, label: {
                EmptyView()
            })
        )
        .navigationTitle("연도를 선택하세요")
        .font(.title)
    }
}

struct YearsSelectMenuView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
        YearsSelectMenuView()
        }
    }
}
