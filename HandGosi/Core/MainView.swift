//
//  MainView.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/12.
//

import SwiftUI

struct YearTextViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(10)
            .background(
                Capsule().opacity(0.1)
            )
    }
}
extension View {
    func yearText() -> some View{
        modifier(YearTextViewModifier())
    }
}

struct MainView: View {
    
    @State private var isClicked: Bool = false
    @State private var goToNextView: Bool = false
    @State var selectedYear: Int?
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                if isClicked {
                    HStack(spacing: 30) {
                        Text("2022")
                            .yearText()
                            .onTapGesture {
                                selectedYear = 2022
                                goToNextView.toggle()
                            }
                        Text("2021")
                            .yearText()
                            .onTapGesture {
                                selectedYear = 2021
                                goToNextView.toggle()
                            }
                        Text("2020")
                            .yearText()
                            .onTapGesture {
                                selectedYear = 2020
                                goToNextView.toggle()
                            }
                    }.font(.title)
                    HStack(spacing: 30) {
                        Text("2019")
                            .yearText()
                            .onTapGesture {
                                selectedYear = 2019
                                goToNextView.toggle()
                            }
                        Text("2018")
                            .yearText()
                    }.font(.title2)
                    HStack(spacing: 30) {
                        Text("2017")
                            .yearText()
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
                            .yearText()
                        Text("2015")
                            .yearText()
                    }.font(.title3)
                    HStack(spacing: 30) {
                        Text("2014")
                            .yearText()
                        Text("2013")
                            .yearText()
                    }.font(.title2)
                    HStack(spacing: 30) {
                        Text("2012")
                            .yearText()
                        Text("2011")
                            .yearText()
                        Text("2010")
                            .yearText()
                    }.font(.title)
                }
            } // VStack
            .background(
                NavigationLink(isActive: $goToNextView, destination: { SubjectSelectView(year: $selectedYear) },
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
