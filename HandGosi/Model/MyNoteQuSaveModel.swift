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
//    let questionID: String
    let questionNum: Int
    var selectedNum: Int
}
