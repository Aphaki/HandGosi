//
//  MyNoteService.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/19.
//

import Foundation

class MyNoteService {
    

    @Published var myNotes: [MyNoteQuestion] = []
    
    //MARK: - 오답노트 저장
    func myNoteSave(myNoteQuestion: MyNoteQuestion) -> String {
        if myNoteQuestion.subject == "국어" {
            let idFilteredNote = myNotes.filter({ noteQuestion in
                return noteQuestion.question.id == myNoteQuestion.question.id
            })
            if idFilteredNote.isEmpty {
                myNotes.append(myNoteQuestion)
                return "국어 오답노트에 추가되었습니다."
            } else {
                return "해당 문제가 이미 오답노트에 존재합니다."
            }
        }
        else if myNoteQuestion.subject == "영어" {
            if myNotes.filter({ noteQuestion in
                return noteQuestion.question.id == myNoteQuestion.question.id
            }).isEmpty {
                myNotes.append(myNoteQuestion)
                return "영어 오답노트에 추가되었습니다."
            } else {
                return "해당 문제가 이미 오답노트에 존재합니다."
            }
        }
        else {
            if myNotes.filter({ noteQuestion in
                return noteQuestion.question.id == myNoteQuestion.question.id
            }).isEmpty {
                myNotes.append(myNoteQuestion)
                return "한국사 오답노트에 추가되었습니다."
            } else {
                return "해당 문제가 이미 오답노트에 존재합니다."
            }
        }
    }
    
    func deleteMyNote(myNoteQuestion: MyNoteQuestion) {
        myNotes.removeAll { aNote in
            return aNote.question.id == myNoteQuestion.id
        }
    }
}
