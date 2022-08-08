//
//  ContentView.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/05.
//

import SwiftUI

struct ContentView: View {
    
    @State var isClicked = false
    @State var showYearSection = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                Spacer()
                HStack {
                    Spacer()
                    yearSection
                        .onTapGesture {
                            showYearSection.toggle()
                        }
                    Spacer()
                    typeSection
                    Spacer()
                }
                .opacity(isClicked ? 1.0 : 0)
                ZStack {
                    Image("HandGosiRed")
                        .resizable()
                        .frame(width: 130, height: 200)
                        .shadow(color: .secondary, radius: 5, x: 0, y: 10)
                        .scaleEffect(isClicked ? 0.3 : 1.0)
                        .onTapGesture { withAnimation(.easeInOut) { isClicked.toggle() } }
                }
                HStack {
                    Spacer()
                    subjectSection
                    Spacer()
                    Text("오답노트")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.pink)
                        .shadow(color: .secondary, radius: 5, x: 0, y: 5)
                    
                    Spacer()
                }
                .opacity(isClicked ? 1.0 : 0)
                
                Spacer()
            }
            .navigationBarHidden(true)
            .background(
                NavigationLink(isActive: $showYearSection, destination: { YearsSelectMenuView() }, label: { EmptyView() } )
            )
        }
    }
}
extension ContentView {
    private var yearSection: some View {
        VStack {
            Text("연도별")
                .font(.title)
                .fontWeight(.bold)
                .padding()
                .foregroundColor(Color("CustomFontColor"))
            Text("2011\n2012\n2013...")
                .padding()
        }
        .background( RoundedRectangle(cornerRadius: 10).foregroundColor(.white).shadow(color: .black, radius: 5, x: 0, y: 5) )
        
    }
    private var typeSection: some View {
        VStack {
            Text("종류별")
                .font(.title)
                .fontWeight(.bold)
                .padding()
                .foregroundColor(Color("CustomFontColor"))
            Text("국가직\n지방직\n서울시")
                .padding()
        }
        .background( RoundedRectangle(cornerRadius: 10).foregroundColor(.white).shadow(color: .black, radius: 5, x: 0, y: 5) )
    }
    private var subjectSection: some View {
        VStack {
            Text("과목별")
                .font(.title)
                .fontWeight(.bold)
                .padding()
                .foregroundColor(Color("CustomFontColor"))
            Text("국어\n영어\n한국사\n")
                .padding()
        }
        .background( RoundedRectangle(cornerRadius: 10).foregroundColor(.white).shadow(color: .black, radius: 5, x: 0, y: 5) )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
