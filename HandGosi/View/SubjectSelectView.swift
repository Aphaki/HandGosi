//
//  SubjectSelectView.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/12.
//

import SwiftUI

struct SubjectSelectView: View {
    
    @StateObject var vm: SubjectSelectVM
    
    init(exams: [ExamModel]) {
        _vm = StateObject(wrappedValue: SubjectSelectVM(exams: exams))
    }
    
    
    var body: some View {
        ZStack {
            Color.theme.myBackgroundColor.ignoresSafeArea()
            VStack(spacing: 20) {
                Spacer()
                Spacer()
                NavigationLink {
                    ExamSelectView(exams: vm.koreanExams)
                } label: {
                    Text("국  어")
                        .myNoteButton(color: Color.theme.myAccentColor)
                }

                
                HStack {
                    Spacer()
                    NavigationLink {
                        ExamSelectView(exams: vm.englishExams)
                    } label: {
                        Text("영  어")
                            .myNoteButton(color: Color.theme.myAccentColor)
                    }
                    NavigationLink {
                        ExamSelectView(exams: vm.historyExams)
                    } label: {
                        Text("한국사")
                            .myNoteButton(color: Color.theme.myAccentColor)
                    }
                    Spacer()
                }
                Spacer()
                Spacer()
                Spacer()
            }
            .navigationTitle(vm.yearFilteredExams.first?.year.description ?? "")
        }
        
    }
}

struct SubjectSelectMenu_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            SubjectSelectView(exams: dev.exams)
        }
    }
}
