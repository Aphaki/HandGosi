//
//  progressModelService.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/09/10.
//

import Foundation
import Combine

class ProgressModelService {
    @Published var progressModels: [ExamProgressModel] = []
    
    func saveProgressModel(saveModel: ExamProgressModel) {
        
        // 기존 데이터가 없을 때 세이브하기
        if progressModels.filter({ progressModel in
            return progressModel.year == saveModel.year  &&
            progressModel.type == saveModel.type &&
            progressModel.subject == saveModel.subject
        }).isEmpty {
            progressModels.append(saveModel)
        } else {
            // 기존 데이터가 있을 때 삭제하고 추가하기
            progressModels.removeAll { progressModel in
                return progressModel.year == saveModel.year  &&
                progressModel.type == saveModel.type &&
                progressModel.subject == saveModel.subject
            }
            progressModels.append(saveModel)
        }
    }
}
