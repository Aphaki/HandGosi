//
//  ExamView.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/12.
//

import SwiftUI

struct ExamView: View {
    
    @StateObject var vm: ExamVM
    
    init(exam: ExamModel) {
        _vm = StateObject(wrappedValue: ExamVM(exam: exam))
    }
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(vm.finalExam.questions) { question in
                    if vm.isScored == false {
                    QuestionView(question: question)
                    } else {
                        ScoredQuestionView(question: question)
                    }
                }
                HStack {
                    Spacer()
                    Text("채점하기")
                        .yearText()
                        .onTapGesture {
                            vm.isScored.toggle()
                        }
                }
                
            }
        }.navigationTitle( vm.finalExam.year.description + " " + vm.finalExam.examTypeID + " " + vm.finalExam.subjectID)
        
        
    }
}

struct ExamView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ExamView(exam: dev.examSample)
        }
    }
}
