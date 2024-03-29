//
//  MainVM.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/17.
//

import Foundation
import Combine
import StoreKit

class MainVM: ObservableObject {
    @Published var firstLoad: Bool = true
    
    @Published var allExams: [ExamModel] = []
    @Published var currentExams: [ExamModel] = []
    @Published var filteredExams: [ExamModel] = []
    
    @Published var percentage2023: Double = 0
    @Published var percentage2022: Double = 0
    @Published var percentage2021: Double = 0
    @Published var percentage2020: Double = 0
    @Published var percentage2019: Double = 0
    @Published var percentage2018: Double = 0
    @Published var percentage2017: Double = 0
    @Published var percentage2016: Double = 0
    @Published var percentage2015: Double = 0
    
    @Published var myNotes: [MyNoteQuestion] = []
    @Published var filteredNotes: [MyNoteQuestion] = []
    
    let examStoreDataService = ExamStoreDataService()
    let myNoteStoreService = MyNoteService()
    let savingExamService = SavingExamService()
    
    private var subscription = Set<AnyCancellable>()
    //MARK: - init()
    init() {
        subscribeAllExams()
        subscribeMyNote()
        subscribeSavingExams()
        subscribeProgressModel()
        subsccribeFirstBool()
    }
    
    // MARK: - 서비스 데이터와 연결 (모든 시험, 오답 노트, 시험 진행사항)
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
    //MARK: - 진행 정도 관련
    private func subscribeProgressModel2023() {
        $currentExams.map { exams -> Double in
            let examsFiltering =
            exams.filter({ $0.year == 2023 })
            let examTotalCount =
            examsFiltering.map { aExam -> Int in
               return aExam.totalCount
            }.reduce(0, +)
            let examProgressCount =
            examsFiltering.map { aExam -> Int in
                return aExam.progressCount
            }.reduce(0, +)
            return Double(examProgressCount) / Double(examTotalCount) * 100
        }
        .receive(on: DispatchQueue.main)
        .sink { [weak self] percentage in
            guard let self = self else { return }
            self.percentage2023 = percentage
        }
        .store(in: &subscription)
    }
    
    private func subscribeProgressModel2022() {
        $currentExams.map { exams -> Double in
            let examsFiltering =
            exams.filter({ $0.year == 2022 })
            let examTotalCount =
            examsFiltering.map { aExam -> Int in
               return aExam.totalCount
            }.reduce(0, +)
            let examProgressCount =
            examsFiltering.map { aExam -> Int in
                return aExam.progressCount
            }.reduce(0, +)
            return Double(examProgressCount) / Double(examTotalCount) * 100
        }
        .receive(on: DispatchQueue.main)
        .sink { [weak self] percentage in
            guard let self = self else { return }
            self.percentage2022 = percentage
        }
        .store(in: &subscription)
    }
    private func subscribeProgressModel2021() {
        $currentExams.map { exams -> Double in
            let examsFiltering =
            exams.filter({ $0.year == 2021 })
            let examTotalCount =
            examsFiltering.map { aExam -> Int in
               return aExam.totalCount
            }.reduce(0, +)
            let examProgressCount =
            examsFiltering.map { aExam -> Int in
                return aExam.progressCount
            }.reduce(0, +)
            return Double(examProgressCount) / Double(examTotalCount) * 100
        }
        .receive(on: DispatchQueue.main)
        .sink { [weak self] percentage in
            guard let self = self else { return }
            self.percentage2021 = percentage
        }
        .store(in: &subscription)
    }
    private func subscribeProgressModel2020() {
        $currentExams.map { exams -> Double in
            let examsFiltering =
            exams.filter({ $0.year == 2020 })
            let examTotalCount =
            examsFiltering.map { aExam -> Int in
               return aExam.totalCount
            }.reduce(0, +)
            let examProgressCount =
            examsFiltering.map { aExam -> Int in
                return aExam.progressCount
            }.reduce(0, +)
            return Double(examProgressCount) / Double(examTotalCount) * 100
        }
        .receive(on: DispatchQueue.main)
        .sink { [weak self] percentage in
            guard let self = self else { return }
            self.percentage2020 = percentage
        }
        .store(in: &subscription)
    }
    private func subscribeProgressModel2019() {
        $currentExams.map { exams -> Double in
            let examsFiltering =
            exams.filter({ $0.year == 2019 })
            let examTotalCount =
            examsFiltering.map { aExam -> Int in
               return aExam.totalCount
            }.reduce(0, +)
            let examProgressCount =
            examsFiltering.map { aExam -> Int in
                return aExam.progressCount
            }.reduce(0, +)
            return Double(examProgressCount) / Double(examTotalCount) * 100
        }
        .receive(on: DispatchQueue.main)
        .sink { [weak self] percentage in
            guard let self = self else { return }
            self.percentage2019 = percentage
        }
        .store(in: &subscription)
    }
    private func subscribeProgressModel2018() {
        $currentExams.map { exams -> Double in
            let examsFiltering =
            exams.filter({ $0.year == 2018 })
            let examTotalCount =
            examsFiltering.map { aExam -> Int in
               return aExam.totalCount
            }.reduce(0, +)
            let examProgressCount =
            examsFiltering.map { aExam -> Int in
                return aExam.progressCount
            }.reduce(0, +)
            return Double(examProgressCount) / Double(examTotalCount) * 100
        }
        .receive(on: DispatchQueue.main)
        .sink { [weak self] percentage in
            guard let self = self else { return }
            self.percentage2018 = percentage
        }
        .store(in: &subscription)
    }
    private func subscribeProgressModel2017() {
        $currentExams.map { exams -> Double in
            let examsFiltering =
            exams.filter({ $0.year == 2017 })
            let examTotalCount =
            examsFiltering.map { aExam -> Int in
               return aExam.totalCount
            }.reduce(0, +)
            let examProgressCount =
            examsFiltering.map { aExam -> Int in
                return aExam.progressCount
            }.reduce(0, +)
            return Double(examProgressCount) / Double(examTotalCount) * 100
        }
        .receive(on: DispatchQueue.main)
        .sink { [weak self] percentage in
            guard let self = self else { return }
            self.percentage2017 = percentage
        }
        .store(in: &subscription)
    }
    private func subscribeProgressModel2016() {
        $currentExams.map { exams -> Double in
            let examsFiltering =
            exams.filter({ $0.year == 2016 })
            let examTotalCount =
            examsFiltering.map { aExam -> Int in
               return aExam.totalCount
            }.reduce(0, +)
            let examProgressCount =
            examsFiltering.map { aExam -> Int in
                return aExam.progressCount
            }.reduce(0, +)
            return Double(examProgressCount) / Double(examTotalCount) * 100
        }
        .receive(on: DispatchQueue.main)
        .sink { [weak self] percentage in
            guard let self = self else { return }
            self.percentage2016 = percentage
        }
        .store(in: &subscription)
    }
    private func subscribeProgressModel2015() {
        $currentExams.map { exams -> Double in
            let examsFiltering =
            exams.filter({ $0.year == 2015 })
            let examTotalCount =
            examsFiltering.map { aExam -> Int in
               return aExam.totalCount
            }.reduce(0, +)
            let examProgressCount =
            examsFiltering.map { aExam -> Int in
                return aExam.progressCount
            }.reduce(0, +)
            return Double(examProgressCount) / Double(examTotalCount) * 100
        }
        .receive(on: DispatchQueue.main)
        .sink { [weak self] percentage in
            guard let self = self else { return }
            self.percentage2015 = percentage
        }
        .store(in: &subscription)
    }
    
    private func subscribeProgressModel() {
        subscribeProgressModel2015()
        subscribeProgressModel2016()
        subscribeProgressModel2017()
        subscribeProgressModel2018()
        subscribeProgressModel2019()
        subscribeProgressModel2020()
        subscribeProgressModel2021()
        subscribeProgressModel2022()
        subscribeProgressModel2023()
    }
    
    //MARK: - 저장 관련 (현재 시험 진행사항, 오답노트 저장, 오답노트 제거)
    func saveCurrentExam(exam: ExamModel) {
        savingExamService.saveCurrentExam(exam: exam)
    }
    
    func saveMyNoteAndReturnMessage(myNoteQuestion: MyNoteQuestion) -> String {
        return myNoteStoreService.myNoteSave(myNoteQuestion: myNoteQuestion)
    }
    
    func deleteNoteQuestion(myNoteQuestion: MyNoteQuestion) {
        myNoteStoreService.deleteMyNote(myNoteQuestion: myNoteQuestion)
    }
    
    //MARK: - First Load Bool Save
    func saveFirstLoad(_ firstLoadBool: Bool) {
        myNoteStoreService.saveFirstLoad(firstLoadBool)
    }
    func subsccribeFirstBool() {
        myNoteStoreService.$firstLoad
            .receive(on: DispatchQueue.main)
            .sink { bool in
                self.firstLoad = bool
            }
            .store(in: &subscription)
    }
}
