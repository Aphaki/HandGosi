//
//  SubjectSelectView.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/12.
//

import SwiftUI

struct SubjectSelectView: View {
    
    @State var showNextView: Bool = false
    @StateObject var vm: SubjectSelectVM
    
    init(exams: [ExamModel]) {
        _vm = StateObject(wrappedValue: SubjectSelectVM(exams: exams))
    }
    
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Spacer()
            Button {
                vm.yearSubjectFilteredExams = vm.yearFilteredExams.filter { exam in
                    return exam.subjectID == "국어"
                }
                showNextView.toggle()
            } label: {
                Text("국  어")
                    .myNoteButton(color: Color.theme.myAccentColor)
            }
            HStack {
                Spacer()
                Button {
                    vm.yearSubjectFilteredExams = vm.yearFilteredExams.filter { exam in
                        return exam.subjectID == "영어"
                    }
                    showNextView.toggle()
                } label: {
                    Text("영  어")
                        .myNoteButton(color: Color.theme.myAccentColor)
                }
                Button {
                    vm.yearSubjectFilteredExams = vm.yearFilteredExams.filter { exam in
                        return exam.subjectID == "한국사"
                    }
                    showNextView.toggle()
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
        .background(
            NavigationLink(isActive: $showNextView,
                           destination: { ExamSelectView(exams: vm.yearSubjectFilteredExams)},
                           label: { EmptyView() })
        )
        .navigationTitle(vm.yearFilteredExams.first?.year.description ?? "")
    }
}

struct SubjectSelectMenu_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            SubjectSelectView(exams: dev.exams)
        }
    }
}
