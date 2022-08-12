//
//  SubjectSelectView.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/12.
//

import SwiftUI

struct SubjectSelectView: View {
    
    @Binding var year: Int?
    @State var showNextView: Bool = false
    @State var selectedSubject: String?
    @StateObject var vm = SubjectSelectVM()
    
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
                    selectedSubject = "국어"
                    vm.fetchExamStoreData(year: year!, subjectID: selectedSubject!)
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
                        selectedSubject = "영어"
                        vm.fetchExamStoreData(year: year!, subjectID: selectedSubject!)
                        showNextView.toggle()
                    }
                Text("한국사")
                    .font(.largeTitle)
                    .padding(30)
                    .background(
                        Circle().opacity(0.1)
                    )
                    .onTapGesture {
                        selectedSubject = "한국사"
                        vm.fetchExamStoreData(year: year!, subjectID: selectedSubject!)
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
                           destination: { ExamSelectView(exams: vm.exams, subjectID: $selectedSubject) },
                           label: { EmptyView() })
        )
        .navigationTitle(year?.description ?? "")
    }
}

struct SubjectSelectMenu_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            SubjectSelectView(year: .constant(2022))
        }
    }
}
