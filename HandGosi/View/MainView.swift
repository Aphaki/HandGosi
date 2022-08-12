//
//  MainView.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/12.
//

import SwiftUI

struct MainView: View {
    
    @State var isClicked: Bool = false
    @State var goToNextView: Bool = false
    @State var selectedYear: Int?
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                if isClicked {
                    HStack(spacing: 30) {
                        Text("2022")
                            .onTapGesture {
                                selectedYear = 2022
                                goToNextView.toggle()
                            }
                        Text("2021")
                        Text("2020")
                    }.font(.title)
                    HStack(spacing: 30) {
                        Text("2019")
                        Text("2018")
                    }.font(.title2)
                    HStack(spacing: 30) {
                        Text("2017")
                    }.font(.title3)
                }
                Image("HandGosiRed")
                    .resizable()
                    .frame(width: 60, height: 100)
                    .scaleEffect(isClicked ? 0.3 : 1.5)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            isClicked.toggle()
                        }
                    }
                if isClicked {
                    HStack(spacing: 30) {
                        Text("2016")
                        Text("2015")
                    }.font(.title3)
                    HStack(spacing: 30) {
                        Text("2014")
                        Text("2013")
                    }.font(.title2)
                    HStack(spacing: 30) {
                        Text("2012")
                        Text("2011")
                        Text("2010")
                    }.font(.title)
                }
            } // VStack
            .background(
                NavigationLink(isActive: $goToNextView, destination: { SubjectSelectView(year: selectedYear ?? 0) },
                               label: { EmptyView() })
            )
            .navigationBarHidden(true)
        } // NavigationView
        
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
