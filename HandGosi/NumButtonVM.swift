//
//  NumButtonVM.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/08.
//

import Foundation

class NumButtonVM: ObservableObject {

    @Published var button: NumButtonModel
    
    init(button: NumButtonModel) {
        self.button = button
    }
}
