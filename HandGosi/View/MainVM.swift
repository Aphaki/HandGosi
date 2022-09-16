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
    @Published var currentExams: [ExamModel] = []
    @Published var filteredExams: [ExamModel] = []
    
    @Published var myNotes: [MyNoteQuestion] = []
    @Published var filteredNotes: [MyNoteQuestion] = []
    
    let examStoreDataService = ExamStoreDataService()
    let myNoteStoreService = MyNoteService()
    let savingExamService = SavingExamService()
    
    private var subscription = Set<AnyCancellable>()
    
    init() {
        subscribeAllExams()
        subscribeMyNote()
        subscribeSavingExams()
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
    
    private func subscribeSavingExams() {
        savingExamService.$savingExams.combineLatest($allExams)
            .map { (savingExams, exams) -> [ExamModel] in
                if !savingExams.isEmpty {
                    savingExams.forEach({ aSavingModel in
                       let indices =
                        exams.indices.filter({
//                            exams[$0].year == aSavingModel.year && exams[$0].examTypeID == aSavingModel.examTypeID && exams[$0].subjectID == aSavingModel.subjectID
                            exams[$0].id == aSavingModel.id
                        })
                        if let index = indices.first {
                            for i in 0...19 {
                                exams[index].questions[i].selectedNum = aSavingModel.questions[i].selectedNum
                            }
                        }
                    })
                    return exams
                } else {
                    return exams
                }
            }
            .sink { [weak self] returnedExams in
                guard let self = self else { return }
                self.currentExams = returnedExams
            }
            .store(in: &subscription)
    }
    
    func saveCurrentExam(exam: ExamModel) {
        savingExamService.saveCurrentExam(exam: exam)
    }
    
    func saveMyNoteAndReturnMessage(myNoteQuestion: MyNoteQuestion) -> String {
        return myNoteStoreService.myNoteSave(myNoteQuestion: myNoteQuestion)
    }
    func deleteNoteQuestion(myNoteQuestion: MyNoteQuestion) {
        myNoteStoreService.deleteMyNote(myNoteQuestion: myNoteQuestion)
    }
}
