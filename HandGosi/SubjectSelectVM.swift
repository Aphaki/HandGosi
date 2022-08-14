//
//  SubjectSelectVM.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/08.
//

import Foundation
import Combine

class SubjectSelectVM: ObservableObject {
    
    @Published var exams: [ExamModel] = []
    
    let examStoreDataService = ExamStoreDataService()
    
    var subscription = Set<AnyCancellable>()
    
    init() {
        subscribeExamStoreExams()
    }
    
    private func subscribeExamStoreExams() {
        examStoreDataService.$allExams
            .sink { [weak self] allExams in
                guard let self = self else { return }
                self.exams = allExams
            }
            .store(in: &subscription)
    }
    func fetchExamStoreData(year: Int, subjectID: String) {
        if year == 2022 && subjectID == "국어" {
            examStoreDataService.saveExam2022Korean()
        } else if year == 2022 && subjectID == "영어" {
            examStoreDataService.saveExam2022English()
        } else if year == 2022 && subjectID == "한국사" {
            examStoreDataService.saveExam2022History()
        } else if year == 2021 && subjectID == "국어" {
            examStoreDataService.saveExam2021Korean()
        } else if year == 2021 && subjectID == "영어" {
            examStoreDataService.saveExam2021English()
        } else if year == 2021 && subjectID == "한국사" {
            examStoreDataService.saveExam2021History()
        } else if year == 2020 && subjectID == "국어" {
            examStoreDataService.saveExam2020Korean()
        } else if year == 2020 && subjectID == "영어" {
            examStoreDataService.saveExam2020English()
        } else if year == 2020 && subjectID == "한국사" {
            examStoreDataService.saveExam2020History()
        }
    }
}
