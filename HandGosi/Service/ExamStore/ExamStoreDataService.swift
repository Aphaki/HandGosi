//
//  ExamStore.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/11.
//

import Foundation

class ExamStoreDataService {
    
    @Published var allExams: [ExamModel] = []
    
    var examStore2023 = ExamStore2023()
    var examStore2022 = ExamStore2022()
    var examStore2021 = ExamStore2021()
    var examStore2020 = ExamStore2020()
    var examStore2019 = ExamStore2019()
    var examStore2018 = ExamStore2018()
    var examStore2017 = ExamStore2017()
    var examStore2016 = ExamStore2016()
    var examStore2015 = ExamStore2015()
    
    init() {
        saveAllExam()
    }
    
    //MARK: - 시험지 저장
    func saveAllExam() {
        saveExam2015()
        saveExam2016()
        saveExam2017()
        saveExam2018()
        saveExam2019()
        saveExam2020()
        saveExam2021()
        saveExam2022()
        saveExam2023()
    }
    
    func saveExam2023() {
       let exams2023 = examStore2023.exams2023
        allExams.append(contentsOf: exams2023)
    }
    func saveExam2022() {
       let exams2022 = examStore2022.exams2022
        allExams.append(contentsOf: exams2022)
    }
    func saveExam2021() {
        let exams2021 = examStore2021.exams2021
        allExams.append(contentsOf: exams2021)
    }
    func saveExam2020() {
        let exams2020 = examStore2020.exams2020
        allExams.append(contentsOf: exams2020)
    }
    func saveExam2019() {
        let exams2019 = examStore2019.exam2019
        allExams.append(contentsOf: exams2019)
    }
    func saveExam2018() {
        let exam2018 = examStore2018.exam2018
        allExams.append(contentsOf: exam2018)
    }
    func saveExam2017() {
        let exam2017 = examStore2017.exam2017
        allExams.append(contentsOf: exam2017)
    }
    func saveExam2016() {
        let exam2016 = examStore2016.exam2016
        allExams.append(contentsOf: exam2016)
    }
    func saveExam2015() {
        let exam2015 = examStore2015.exam2015
        allExams.append(contentsOf: exam2015)
    }
    
}
    
