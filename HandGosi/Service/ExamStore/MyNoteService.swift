//
//  MyNoteService.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/19.
//

import Foundation

class MyNoteService {
    
    @Published var myNoteSaveData: [MyNoteQuSaveModel] = [] {
        didSet {
            saveData()
            print("오답노트 갯수: " + myNoteSaveData.count.description)
        }
    }
    @Published var firstLoad: Bool = true
    let saveDataKey = "save_key"
    let saveFirstLoadKey = "first_load_key"
    init() {
        fetchData()
        fetchFirstLoad()
    }
    
    //MARK: - 오답노트 저장
    func myNoteSave(myNoteQuestion: MyNoteQuestion) -> String {
        if myNoteQuestion.subject == "국어" {
            if myNoteSaveData.filter({ aSaveData in
                return aSaveData.year == myNoteQuestion.year && aSaveData.type == myNoteQuestion.type && aSaveData.subject == myNoteQuestion.subject && aSaveData.questionNum == myNoteQuestion.question.num
                
            }).isEmpty {
                let saveData = MyNoteQuSaveModel(year: myNoteQuestion.year, type: myNoteQuestion.type, subject: myNoteQuestion.subject, questionNum: myNoteQuestion.question.num)
                myNoteSaveData.append(saveData)
                return "국어 오답노트에 추가되었습니다."
            } else {
                return "해당 문제가 이미 오답노트에 존재합니다."
            }
        } else if myNoteQuestion.subject == "영어" {
            if myNoteSaveData.filter({ aSaveData in
                return aSaveData.year == myNoteQuestion.year && aSaveData.type == myNoteQuestion.type && aSaveData.subject == myNoteQuestion.subject && aSaveData.questionNum == myNoteQuestion.question.num
                
            }).isEmpty {
                let saveData = MyNoteQuSaveModel(year: myNoteQuestion.year, type: myNoteQuestion.type, subject: myNoteQuestion.subject, questionNum: myNoteQuestion.question.num)
                myNoteSaveData.append(saveData)
                return "영어 오답노트에 추가되었습니다."
            } else {
                return "해당 문제가 이미 오답노트에 존재합니다."
            }
        } else {
            if myNoteSaveData.filter({ aSaveData in
                return aSaveData.year == myNoteQuestion.year && aSaveData.type == myNoteQuestion.type && aSaveData.subject == myNoteQuestion.subject && aSaveData.questionNum == myNoteQuestion.question.num
                
            }).isEmpty {
                let saveData = MyNoteQuSaveModel(year: myNoteQuestion.year, type: myNoteQuestion.type, subject: myNoteQuestion.subject, questionNum: myNoteQuestion.question.num)
                myNoteSaveData.append(saveData)
                return "한국사 오답노트에 추가되었습니다."
            } else {
                return "해당 문제가 이미 오답노트에 존재합니다."
            }
        }
    }
    
    func deleteMyNote(myNoteQuestion: MyNoteQuestion) {
        myNoteSaveData.removeAll { aSaveData in
            return aSaveData.year == myNoteQuestion.year && aSaveData.type == myNoteQuestion.type && aSaveData.subject == myNoteQuestion.subject && aSaveData.questionNum == myNoteQuestion.question.num
        }
    }
    //MARK: - UserDefault 세이브
    private func saveData() {
        if let encodedData = try? JSONEncoder().encode(myNoteSaveData) {
            UserDefaults.standard.set(encodedData, forKey: saveDataKey)
        } else {
            print("데이터 세이브중 인코딩 실패")
        }
    }
    private func fetchData() {
        guard
            let data = UserDefaults.standard.data(forKey: saveDataKey),
            let savedData = try? JSONDecoder().decode([MyNoteQuSaveModel].self, from: data) else {
            print("데이터 가져오기중 디코딩 실패")
            return
        }
        self.myNoteSaveData = savedData
    }
    
    //MARK: - UserDefault 세이브 - First Load Bool
    func saveFirstLoad(_ firstLoadBool: Bool) {
        UserDefaults.standard.setValue(firstLoadBool, forKey: saveFirstLoadKey)
    }
    private func fetchFirstLoad() {
        guard
            let value = UserDefaults.standard.value(forKey: saveFirstLoadKey) as? Bool else {
                print("MyNoteService - fetchFirstLoad() 에러")
            return
        }
        self.firstLoad = value
    }
}
