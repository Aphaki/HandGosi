//
//  NumButtonVM.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/08.
//

import Foundation

class NumButtonVM: ObservableObject {
    @Published var numberContent: NumButtonModel? = nil
    
    
    init(numButtonContent: NumButtonModel) {
        self.numberContent = numButtonContent
    }
}
