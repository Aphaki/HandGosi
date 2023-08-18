//
//  SubjectSelectVM.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/08.
//

import Foundation
import Combine

class SubjectSelectVM: ObservableObject {
    
    @Published var yearFilteredExams: [ExamModel]
    
    @Published var koreanExams: [ExamModel] = []
    @Published var englishExams: [ExamModel] = []
    @Published var historyExams: [ExamModel] = []
    
    private var subscription = Set<AnyCancellable>()
    
    init(exams: [ExamModel]) {
        self.yearFilteredExams = exams
        subscribeKorean()
        subscribeEnglish()
        subscribeHistory()
    }
    
    private func subscribeKorean() {
        $yearFilteredExams.sink { exams in
            self.koreanExams = exams.filter({ exam in
                return exam.subjectID == "국어"
            })
        }
        .store(in: &subscription)
    }
    private func subscribeEnglish() {
        $yearFilteredExams.sink { exams in
            self.englishExams = exams.filter({ exam in
                return exam.subjectID == "영어"
            })
        }
        .store(in: &subscription)
    }
    private func subscribeHistory() {
        $yearFilteredExams.sink { exams in
            self.historyExams = exams.filter({ exam in
                return exam.subjectID == "한국사"
            })
        }
        .store(in: &subscription)
    }
}

