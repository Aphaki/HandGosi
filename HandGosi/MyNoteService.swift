//
//  MyNoteService.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/19.
//

import Foundation

class MyNoteService {
    
    static let shared = MyNoteService()
    
    @Published var myNoteKorean: [MyNoteQuestion] = []
    @Published var myNoteEnglish: [MyNoteQuestion] = []
    @Published var myNoteHistory: [MyNoteQuestion] = []
    
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
}
