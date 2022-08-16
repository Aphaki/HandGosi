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
            Text("국  어")
                .font(.largeTitle)
                .padding(30)
                .background(
                    Circle().opacity(0.1)
                )
                .onTapGesture {
                    vm.yearSubjectFilteredExams = vm.yearFilteredExams.filter { exam in
                        return exam.subjectID == "국어"
                    }
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
                    .onTapGesture {
                        vm.yearSubjectFilteredExams = vm.yearFilteredExams.filter { exam in
                            return exam.subjectID == "영어"
                        }
                        showNextView.toggle()
                    }
                Text("한국사")
                    .font(.largeTitle)
                    .padding(30)
                    .background(
                        Circle().opacity(0.1)
                    )
                    .onTapGesture {
                        vm.yearSubjectFilteredExams = vm.yearFilteredExams.filter { exam in
                            return exam.subjectID == "한국사"
                        }
                        showNextView.toggle()
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
