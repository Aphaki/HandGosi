//
//  MainVM.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/17.
//

import Foundation
import Combine

class MainVM: ObservableObject {
    @Published var allExams: [ExamModel] = []
    @Published var filteredExams: [ExamModel] = []
    
    @Published var myNotes: [MyNoteQuestion] = []
    @Published var filteredNotes: [MyNoteQuestion] = []
    
    let examStoreDataService = ExamStoreDataService()
    let myNoteStoreService = MyNoteService()
    let progressModelService = ProgressModelService()
    
    private var subscription = Set<AnyCancellable>()
    
    init() {
        subscribeAllExams()
        subscribeMyNote()
    }
    
    
    private func subscribeAllExams() {
        examStoreDataService.$allExams
            .receive(on: DispatchQueue.main)
            .sink { [weak self] exams in
                guard let self = self else { return }
                self.allExams = exams
            }
            .store(in: &subscription)
    }
    
    private func subscribeMyNote() {
        $allExams.combineLatest(myNoteStoreService.$myNoteSaveData)
            .map { (exams, allSaveData) -> [MyNoteQuestion] in
                var myNoteQuestions: [MyNoteQuestion] = []
                // 각각의 saveData -> MyNoteQuestion
               myNoteQuestions = allSaveData.map { aSaveData in
                   if let filteredExam = exams.filter({ aExam in
                       return aExam.year == aSaveData.year &&
                       aExam.subjectID == aSaveData.subject &&
                       aExam.examTypeID == aSaveData.type
                   }).first {
                     let filteredYear = filteredExam.year
                      let filteredSubject = filteredExam.subjectID
                      let filteredType = filteredExam.examTypeID
                      let filteredQuestion = filteredExam.questions.filter { $0.num == aSaveData.questionNum }.first!
                      
                      return MyNoteQuestion(year: filteredYear, type: filteredType, subject: filteredSubject, question: filteredQuestion)
                  } else {
                      return MyNoteQuestion(year: 0, type: "", subject: "", question: QuestionModel(num: 0, questionText: "", num1Text: "", num2Text: "", num3Text: "", num4Text: "", answer: 0))
                  }
                }
                return myNoteQuestions
            }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] returnedMyNoteQuestions in
                guard let self = self else { return }
                self.myNotes = returnedMyNoteQuestions
            }
            .store(in: &subscription)
    }
    
    func saveMyNoteAndReturnMessage(myNoteQuestion: MyNoteQuestion) -> String {
        return myNoteStoreService.myNoteSave(myNoteQuestion: myNoteQuestion)
    }
    func deleteNoteQuestion(myNoteQuestion: MyNoteQuestion) {
        myNoteStoreService.deleteMyNote(myNoteQuestion: myNoteQuestion)
    }
    func saveExamProgressModel(saveModel: ExamProgressModel) {
        progressModelService.saveProgressModel(saveModel: saveModel)
    }
}
