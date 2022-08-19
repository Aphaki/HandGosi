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
            .padding(15)
            .background(
                Capsule().opacity(0.3)
                    .shadow(color: .black, radius: 10, x: 0, y: 10)
            )
            
    }
}
extension View {
    func yearText() -> some View{
        modifier(YearTextViewModifier())
    }
}

struct MainView: View {
    
    @StateObject var vm = MainVM()
    
    @State private var isClicked: Bool = false
    @State private var showMyNote: Bool = false
    @State private var goToNextView: Bool = false
    
//    @State var selectedYear: Int?
    
    var body: some View {
        NavigationView {
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
                        Text("2020")
                            .yearText()
                            .onTapGesture {
                                vm.filteredExams = vm.allExams.filter { exam in
                                    return exam.year == 2020
                                }
                                goToNextView.toggle()
                            }
                    }.font(.title)
                    HStack(spacing: 30) {
                        Text("2019")
                            .yearText()
                            .onTapGesture {
                                vm.filteredExams = vm.allExams.filter { exam in
                                    return exam.year == 2019
                                }
                                goToNextView.toggle()
                            }
                        Text("2018")
                            .yearText()
                            .onTapGesture {
                                vm.filteredExams = vm.allExams.filter { exam in
                                    return exam.year == 2018
                                }
                                goToNextView.toggle()
                            }
                    }.font(.title2)
                    HStack(spacing: 30) {
                        Text("2017")
                            .yearText()
                            .onTapGesture {
                                vm.filteredExams = vm.allExams.filter { exam in
                                    return exam.year == 2017
                                }
                                goToNextView.toggle()
                            }
                    }.font(.title3)
                }
                ZStack {
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
                        HStack {
                            Spacer()
                            NavigationLink(isActive: $showMyNote) {
                                MyNoteSubjectSelectView()
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
                    }.font(.title3)
                    HStack(spacing: 30) {
                        Text("2014")
                            .yearText()
                            .onTapGesture {
                                vm.filteredExams = vm.allExams.filter { exam in
                                    return exam.year == 2014
                                }
                                goToNextView.toggle()
                            }
                        Text("2013")
                            .yearText()
                            .onTapGesture {
                                vm.filteredExams = vm.allExams.filter { exam in
                                    return exam.year == 2013
                                }
                                goToNextView.toggle()
                            }
                    }.font(.title2)
                    HStack(spacing: 30) {
                        Text("2012")
                            .yearText()
                            .onTapGesture {
                                vm.filteredExams = vm.allExams.filter { exam in
                                    return exam.year == 2012
                                }
                                goToNextView.toggle()
                            }
                        Text("2011")
                            .yearText()
                            .onTapGesture {
                                vm.filteredExams = vm.allExams.filter { exam in
                                    return exam.year == 2011
                                }
                                goToNextView.toggle()
                            }
                        Text("2010")
                            .yearText()
                            .onTapGesture {
                                vm.filteredExams = vm.allExams.filter { exam in
                                    return exam.year == 2010
                                }
                                goToNextView.toggle()
                            }
                    }.font(.title)
                }
            } // VStack
            .background(
                NavigationLink(isActive: $goToNextView, destination: { SubjectSelectView(exams: vm.filteredExams) },
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
