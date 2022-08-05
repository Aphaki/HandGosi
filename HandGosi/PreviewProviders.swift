//
//  PreviewProviders.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/05.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    static var dev: DevPreview {
       return DevPreview.shared
    }
}
class DevPreview {
    static let shared = DevPreview()
    
    let questionSample =
    QuestionModel(num: 1,
                  questionText: "다음 글에 대한 이해로 적절하지 않은 것은?",
                  reference: "승상이 말을 마치기도 전에 구름이 걷히더니 노승은 간 곳이 없고 좌우를 돌아보니 팔낭자도 간 곳이 없었다. 승상이 놀라 어찌할 바를 모르는 중에 높은 대와 많은 집들이 한순간에 사라지고 자기의 몸은 작은 암자의 포단 위에 앉아 있었는데, 향로의 불은 이미 꺼져 있었고 지는 달이 창가에 비치고 있었다.\n 자신의 몸을 보니 백팔염주가 걸려 있고 머리를 손으로 만져보니 갓 깎은 머리털이 까칠까칠하더라. 완연한 소화상의 몸이요, 전혀 대승상의 위의가 아니었으니, 이에 제 몸이 인간 세상의 승상 양소유가 아니라 연화도량의 행자 성진임을 비로소 깨달았다.\n 그리고 생각하기를, ‘처음에 스승에게 책망을 듣고 풍도옥으로 가서 인간 세상에 환도하여 양가의 아들이 되었지. 그리고 장원급제를 하여 한림학사가 된 후 출장입상하고 공명신퇴하여 두 공주와 여섯 낭자로 더불어 즐기던 것이 다 하룻밤 꿈이었구나. 이는 필시 사부가 나의 생각이 그릇됨을 알고 나로 하여금 이런 꿈을 꾸게 하시어 인간 부귀와 남녀 정욕이 다 허무한 일임을 알게 하신 것이로다.’\n 김만중, 구운몽 에서",
                  num1Text: "‘양소유’는 장원급제를 하여 한림학사가 되었다." ,
                  num2Text: "‘양소유’는 인간 세상에 환멸을 느껴 스스로 ‘성진’의 모습으로 되돌아왔다.",
                  num3Text: "‘성진’이 있는 곳은 인간 세상이 아니다.",
                  num4Text: "‘성진’은 자신의 외양을 통해 꿈에서 돌아왔음을 인식한다.")
}
