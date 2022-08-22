//
//  MyNoteService.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/19.
//

import Foundation

class MyNoteService {
    
    static let shared = MyNoteService()
    
    @Published var myNoteKorean: [MyNoteQuestion] = [] {
        didSet {
            saveMyNoteKorean()
        }
    }
    @Published var myNoteEnglish: [MyNoteQuestion] = [] {
        didSet {
            saveMyNoteEnglish()
        }
    }
    @Published var myNoteHistory: [MyNoteQuestion] = [] {
        didSet {
            saveMyNoteHistory()
        }
    }
    
    let noteKeyKorean = "Korean"
    let noteKeyEnglish = "English"
    let noteKeyHistory = "History"
    
    init() {
        fetchMyNoteKorean()
        fetchMyNoteEnglish()
        fetchMyNoteHistory()
    }
    
    //MARK: - 오답노트 저장
    func myNoteSave(myNoteQuestion: MyNoteQuestion) -> String {
        if myNoteQuestion.subject == "국어" {
            let idFilteredNote = myNoteKorean.filter({ noteQuestion in
                return noteQuestion.question.id == myNoteQuestion.question.id
            })
            if idFilteredNote.isEmpty {
                myNoteKorean.append(myNoteQuestion)
                return "국어 오답노트에 추가되었습니다."
            } else {
                return "해당 문제가 이미 오답노트에 존재합니다."
            }
        }
        else if myNoteQuestion.subject == "영어" {
            if myNoteEnglish.filter({ noteQuestion in
                return noteQuestion.question.id == myNoteQuestion.question.id
            }).isEmpty {
                myNoteEnglish.append(myNoteQuestion)
                return "영어 오답노트에 추가되었습니다."
            } else {
                return "해당 문제가 이미 오답노트에 존재합니다."
            }
        }
        else {
            if myNoteHistory.filter({ noteQuestion in
                return noteQuestion.question.id == myNoteQuestion.question.id
            }).isEmpty {
                myNoteHistory.append(myNoteQuestion)
                return "한국사 오답노트에 추가되었습니다."
            } else {
                return "해당 문제가 이미 오답노트에 존재합니다."
            }
        }
    }
    
    func deleteMyNote(myNoteQuestion: MyNoteQuestion) {
        if myNoteQuestion.subject == "국어" {
            myNoteKorean.removeAll { aKoreanNote in
                return aKoreanNote.question.id == myNoteQuestion.question.id
            }
        }
        else if myNoteQuestion.subject == "영어" {
            myNoteEnglish.removeAll { aEnglishNote in
                return aEnglishNote.question.id == myNoteQuestion.question.id
            }
        }
        else if myNoteQuestion.subject == "한국사" {
            myNoteHistory.removeAll { aHistoryNote in
                return aHistoryNote.question.id == myNoteQuestion.question.id
            }
        }
    }
    
    //MARK: - UserDefaults Method
    func saveMyNoteKorean() {
        if let encodedData = try? JSONEncoder().encode(myNoteKorean) {
            UserDefaults.standard.set(encodedData, forKey: noteKeyKorean)
        } else {
            print("Encode Error occured")
        }
    }
    func fetchMyNoteKorean() {
        guard
            let data = UserDefaults.standard.data(forKey: noteKeyKorean),
            let savedNotes = try? JSONDecoder().decode([MyNoteQuestion].self, from: data) else {
            print("Decode Error occured")
            return }
        self.myNoteKorean = savedNotes
    }
    
    
    func saveMyNoteEnglish() {
        if let encodedData = try? JSONEncoder().encode(myNoteEnglish) {
            UserDefaults.standard.set(encodedData, forKey: noteKeyEnglish)
        } else {
            print("Encode Error occured")
        }
    }
    func fetchMyNoteEnglish() {
        guard
            let data = UserDefaults.standard.data(forKey: noteKeyEnglish),
            let savedNotes = try? JSONDecoder().decode([MyNoteQuestion].self, from: data) else {
            print("Decode Error occured")
            return }
        self.myNoteEnglish = savedNotes
    }
    
    
    
    func saveMyNoteHistory() {
        if let encodedData = try? JSONEncoder().encode(myNoteHistory) {
            UserDefaults.standard.set(encodedData, forKey: noteKeyHistory)
        } else {
            print("Encode Error occured")
        }
    }
    func fetchMyNoteHistory() {
        guard
            let data = UserDefaults.standard.data(forKey: noteKeyHistory),
            let savedNotes = try? JSONDecoder().decode([MyNoteQuestion].self, from: data) else {
            print("Decode Error occured")
            return }
        self.myNoteHistory = savedNotes
    }
}
