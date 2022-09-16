//
//  SavingExamService.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/09/10.
//
import Foundation
import Combine

class SavingExamService {
    @Published var savingExams: [ExamModel] = [] {
        didSet {
            saveExamData()
            print("진행중인 시험 갯수: " + savingExams.count.description)
        }
    }
    private let saveDataKey = "exam_save_key"
    
    init() {
        fetchData()
    }
    
    func saveCurrentExam(exam: ExamModel) {
        if savingExams.filter({ $0.id == exam.id }).isEmpty {
            savingExams.append(exam)
        } else {
           let currentIndices =
            savingExams.indices.filter {
//                savingExams[$0].year == exam.year && savingExams[$0].examTypeID == exam.examTypeID && savingExams[$0].subjectID == exam.subjectID
                (savingExams[$0].id == exam.id)
            }
            if let currentIndex = currentIndices.first {
                savingExams[currentIndex] = exam
            }
        }
    }
    
    private func saveExamData() {
        if let encodedData = try? JSONEncoder().encode(savingExams) {
            UserDefaults.standard.set(encodedData, forKey: saveDataKey)
        } else {
            print("Exam Data 세이브중 인코딩 실패")
        }
    }
    private func fetchData() {
        guard
            let data = UserDefaults.standard.data(forKey: saveDataKey),
            let savedData = try? JSONDecoder().decode([ExamModel].self, from: data) else {
            print("Exam Data 가져오기중 디코딩 실패")
            return
        }
        self.savingExams = savedData
    }
}
