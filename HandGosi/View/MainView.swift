//
//  MainView.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/12.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var vm: MainVM
    
    @State private var isloading = true
    @State private var isClicked: Bool = false
//    @State private var goToNextView: Bool = false
    @State private var goToMyNote: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.theme.myBackgroundColor.ignoresSafeArea()
                VStack(spacing: 30) {
                    if isClicked {
                        HStack(spacing: 30) {
                            
                            NavigationLink {
                                SubjectSelectView(exams: vm.exams2022)
                            } label: {
                                ZStack {
//                                    ProgressCircle(degree: vm.progress2022 ?? 0)
//                                        .foregroundColor(.green)
//                                        .frame(width: 45, height: 45)
                                    Text("2022")
                                        .yearText()
                                }
                            }
                            
                            
                            NavigationLink {
                                SubjectSelectView(exams: vm.exams2021)
                            } label: {
                                ZStack {
                                    ProgressCircle(degree: 280)
                                        .foregroundColor(.green)
                                        .frame(width: 45, height: 45)
                                    Text("2021")
                                        .yearText()
                                }
                            }
                            
                        }
                        HStack(spacing: 30) {
                            NavigationLink {
                                SubjectSelectView(exams: vm.exams2020)
                            } label: {
                                ZStack {
                                    ProgressCircle(degree: 280)
                                        .foregroundColor(.green)
                                        .frame(width: 45, height: 45)
                                    Text("2020")
                                        .yearText()
                                }
                            }
                            NavigationLink {
                                SubjectSelectView(exams: vm.exams2019)
                            } label: {
                                Text("2019")
                                    .yearText()
                            }
                        }
                        
                    }
                    
                
                    ZStack {
                        ZStack {
                            Image("HandGosiRed")
                                .resizable()
                            Text("Click")
                                .fontWeight(.bold)
                                .foregroundColor(Color.theme.myAccentColor)
                                .shadow(color: .white, radius: 10, x: 0, y: 5)
                        }
                        .frame(width: 100, height: 180)
                        .shadow(color: .red, radius: 10, x: 0, y: 5)
                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                isClicked.toggle()
                            }
                        }
                        .scaleEffect(isClicked ? 0.2 : 1.0)
                        
                        if isClicked {
                            HStack {
                                Spacer()
                                Button {
                                    vm.filteredNotes = vm.myNotes
                                    goToMyNote.toggle()
                                } label: {
                                    Text("오답노트")
                                        .font(.title3)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .padding(10)
                                        .background(RoundedRectangle(cornerRadius: 20).foregroundColor(.red).shadow(color: .red, radius: 10, x: 0, y: 10))
                                        .padding(.trailing, 15)
                                }
                                
                            }
                            
                            
                        }
                        
                        
                    }
                    if isClicked {
                        HStack(spacing: 30) {
                            NavigationLink {
                                SubjectSelectView(exams: vm.exams2018)
                            } label: {
                                Text("2018")
                                    .yearText()
                            }
                            NavigationLink {
                                SubjectSelectView(exams: vm.exams2017)
                            } label: {
                                Text("2017")
                                    .yearText()
                            }
                        }
                        HStack(spacing: 30) {
                            NavigationLink {
                                SubjectSelectView(exams: vm.exams2016)
                            } label: {
                                Text("2016")
                                    .yearText()
                            }
                            NavigationLink {
                                SubjectSelectView(exams: vm.exams2015)
                            } label: {
                                Text("2015")
                                    .yearText()
                            }
                        }
                    }
                } // VStack
                .background(
                    NavigationLink(isActive: $goToMyNote, destination: { MyNoteSubjectSelectView(myNotes: vm.filteredNotes) }, label: {
                        EmptyView()
                    })
                )
                .navigationBarHidden(true)
                
                if isloading {
                    LoadingView(isLoading: $isloading)
                }
            }
            
            
            
        } // NavigationView
        
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(MainVM())
    }
}
