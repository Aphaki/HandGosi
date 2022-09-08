//
//  MyNoteQuSaveModel.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/09/06.
//

import Foundation

struct MyNoteQuSaveModel: Codable {
    let year: Int
    let type: String
    let subject: String
    let questionNum: Int
}

struct ExamProgressModel {
    let year: Int
    let type: String
    let subject: String
    let selectedNumArray: [Int]
    var progressCount: Int {
        return selectedNumArray.filter{ $0 != 0 }.count
    }
    let totalCount: Int = 20
}
