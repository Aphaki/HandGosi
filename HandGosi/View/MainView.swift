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
                        Text("2020")
                            .yearText()
                            .onTapGesture {
                                vm.filteredExams = vm.allExams.filter { exam in
                                    return exam.year == 2020
                                }
                                goToNextView.toggle()
                            }
                    }
                    ZStack {
                        Image("HandGosiRed")
                            .resizable()
                            .frame(width: 100, height: 180)
                            .scaleEffect(isClicked ? 0.2 : 1.0)
                            .onTapGesture {
                                withAnimation(.easeInOut) {
                                    isClicked.toggle()
                                }
                            }
                        if isClicked {
                            HStack {
                                Spacer()
                                Button {
                                    vm.myNotes = vm.changedMyNotes
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
                        Text("2019")
                            .yearText()
                            .onTapGesture {
                                vm.filteredExams = vm.allExams.filter { exam in
                                    return exam.year == 2019
                                }
                                goToNextView.toggle()
                            }
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
                    }
                } // VStack
                .background(
                    NavigationLink(isActive: $goToNextView, destination: { SubjectSelectView(exams: vm.filteredExams) },
                                   label: { EmptyView() })
                )
                .background(
                    NavigationLink(isActive: $goToMyNote, destination: { MyNoteSubjectSelectView(myNotes: vm.myNotes) }, label: {
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
