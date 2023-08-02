//
//  SubjectSelectView.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/12.
//

import SwiftUI

struct SubjectSelectView: View {
    
    @StateObject var vm: SubjectSelectVM
    @Binding var navigationBool: Bool
    
    init(exams: [ExamModel], navigationBool: Binding<Bool>) {
        self._vm = StateObject(wrappedValue: SubjectSelectVM(exams: exams))
        self._navigationBool = navigationBool
    }
    
    
    var body: some View {
        ZStack {
            Color.theme.myBackgroundColor.ignoresSafeArea()
            List {
                NavigationLink {
                    ExamSelectView(exams: vm.koreanExams, navigationBool: $navigationBool)
                } label: {
                    Text("국어")
                }
                NavigationLink {
                    ExamSelectView(exams: vm.englishExams, navigationBool: $navigationBool)
                } label: {
                    Text("영어")
                }
                NavigationLink {
                    ExamSelectView(exams: vm.historyExams, navigationBool: $navigationBool)
                } label: {
                    Text("한국사")
                }
            }.navigationTitle(vm.yearFilteredExams.first?.year.description ?? "")
        }
    }
}

struct SubjectSelectMenu_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            SubjectSelectView(exams: dev.exams, navigationBool: .constant(true))
        }
    }
}
