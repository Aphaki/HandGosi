//
//  SubjectSelectView.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/12.
//

import SwiftUI

struct SubjectSelectView: View {
    
    let year: Int
    @State var showNextView: Bool = false
    @State var selectedSubject: String?
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Spacer()
            Text("국  어")
                .font(.largeTitle)
                .padding(30)
                .background(
                    Circle().opacity(0.1)
                )
                .onTapGesture {
                    selectedSubject = "국어"
                    showNextView.toggle()
                }
            HStack {
                Spacer()
                Text("영  어")
                    .font(.largeTitle)
                    .padding(30)
                    .background(
                        Circle().opacity(0.1)
                    )
                Text("한국사")
                    .font(.largeTitle)
                    .padding(30)
                    .background(
                        Circle().opacity(0.1)
                    )
                Spacer()
            }
            Spacer()
            Spacer()
            Spacer()
        }
        .background(
            NavigationLink(isActive: $showNextView, destination: {  },
                           label: { EmptyView() })
        )
        .navigationTitle(year.description)
    }
}

struct SubjectSelectMenu_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            SubjectSelectView(year: 2022)
        }
    }
}
