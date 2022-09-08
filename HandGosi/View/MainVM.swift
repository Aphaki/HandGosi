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
//    @Published var filteredExams: [ExamModel] = []
    
    @Published var exams2015: [ExamModel] = []
    @Published var exams2016: [ExamModel] = []
    @Published var exams2017: [ExamModel] = []
    @Published var exams2018: [ExamModel] = []
    @Published var exams2019: [ExamModel] = []
    @Published var exams2020: [ExamModel] = []
    @Published var exams2021: [ExamModel] = []
    @Published var exams2022: [ExamModel] = []
    
    @Published var myNotes: [MyNoteQuestion] = []
    
//    @Published var myNoteSaveData: [MyNoteQuSaveModel] = []
    @Published var filteredNotes: [MyNoteQuestion] = []
    
    let examStoreDataService = ExamStoreDataService()
    let myNoteStoreService = MyNoteService()
    
    private var subscription = Set<AnyCancellable>()
    
    init() {
        subscribeAllExams()
//        subscribeMySaveData()
        subscribeMyNote()
        subscribe2015Exam()
        subscribe2016Exam()
        subscribe2017Exam()
        subscribe2018Exam()
        subscribe2019Exam()
        subscribe2020Exam()
        subscribe2021Exam()
        subscribe2022Exam()
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
    
    private func subscribe2022Exam() {
        $allExams.sink { [weak self] exams in
            guard let self = self else { return }
            self.exams2022 = exams.filter({ exam in
                return exam.year == 2022
            })
        }
        .store(in: &subscription)
    }
    private func subscribe2021Exam() {
        $allExams.sink { [weak self] exams in
            guard let self = self else { return }
            self.exams2021 = exams.filter({ exam in
                return exam.year == 2021
            })
        }
        .store(in: &subscription)
    }
    private func subscribe2020Exam() {
        $allExams.sink { [weak self] exams in
            guard let self = self else { return }
            self.exams2020 = exams.filter({ exam in
                return exam.year == 2020
            })
        }
        .store(in: &subscription)
    }
    private func subscribe2019Exam() {
        $allExams.sink { [weak self] exams in
            guard let self = self else { return }
            self.exams2019 = exams.filter({ exam in
                return exam.year == 2019
            })
        }
        .store(in: &subscription)
    }
    private func subscribe2018Exam() {
        $allExams.sink { [weak self] exams in
            guard let self = self else { return }
            self.exams2018 = exams.filter({ exam in
                return exam.year == 2018
            })
        }
        .store(in: &subscription)
    }
    private func subscribe2017Exam() {
        $allExams.sink { [weak self] exams in
            guard let self = self else { return }
            self.exams2017 = exams.filter({ exam in
                return exam.year == 2017
            })
        }
        .store(in: &subscription)
    }
    private func subscribe2016Exam() {
        $allExams.sink { [weak self] exams in
            guard let self = self else { return }
            self.exams2016 = exams.filter({ exam in
                return exam.year == 2016
            })
        }
        .store(in: &subscription)
    }
    private func subscribe2015Exam() {
        $allExams.sink { [weak self] exams in
            guard let self = self else { return }
            self.exams2015 = exams.filter({ exam in
                return exam.year == 2015
            })
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
}
