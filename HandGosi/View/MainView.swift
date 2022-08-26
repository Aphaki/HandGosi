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
    @State private var goToNextView: Bool = false
    @State private var goToMyNote: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.theme.myBackgroundColor.ignoresSafeArea()
                VStack(spacing: 30) {
                    if isClicked {
                        HStack(spacing: 30) {
                            Text("2022")
                                .yearText()
                                .onTapGesture {
                                    vm.filteredExams = vm.allExams.filter { exam in
                                        return exam.year == 2022
                                    }
                                    goToNextView.toggle()
                                }
                            Text("2021")
                                .yearText()
                                .onTapGesture {
                                    vm.filteredExams = vm.allExams.filter { exam in
                                        return exam.year == 2021
                                    }
                                    goToNextView.toggle()
                                }
                            
                        }
                        HStack(spacing: 30) {
                            Text("2020")
                                .yearText()
                                .onTapGesture {
                                    vm.filteredExams = vm.allExams.filter { exam in
                                        return exam.year == 2020
                                    }
                                    goToNextView.toggle()
                                }
                            Text("2019")
                                .yearText()
                                .onTapGesture {
                                    vm.filteredExams = vm.allExams.filter({ exam in
                                        return exam.year == 2019
                                    })
                                    goToNextView.toggle()
                                }
                        }
                        
                    }
                    ZStack {
                        ZStack {
                            Image("HandGosiRed")
                                .resizable()
                            Text("c l i c k".uppercased())
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
                            Text("2018")
                                .yearText()
                                .onTapGesture {
                                    vm.filteredExams = vm.allExams.filter { exam in
                                        return exam.year == 2018
                                    }
                                    goToNextView.toggle()
                                }
                            Text("2017")
                                .yearText()
                                .onTapGesture {
                                    vm.filteredExams = vm.allExams.filter { exam in
                                        return exam.year == 2017
                                    }
                                    goToNextView.toggle()
                                }
                        }
                        HStack(spacing: 30) {
                            Text("2016")
                                .yearText()
                                .onTapGesture {
                                    vm.filteredExams = vm.allExams.filter { exam in
                                        return exam.year == 2016
                                    }
                                    goToNextView.toggle()
                                }
                            Text("2015")
                                .yearText()
                                .onTapGesture {
                                    vm.filteredExams = vm.allExams.filter { exam in
                                        return exam.year == 2015
                                    }
                                    goToNextView.toggle()
                                }
                        }
                    }
                } // VStack
                .background(
                    NavigationLink(isActive: $goToNextView, destination: { SubjectSelectView(exams: vm.filteredExams) },
                                   label: { EmptyView() })
                )
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
