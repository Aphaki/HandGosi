//
//  String.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/10.
//

import Foundation

extension String {
    var underLined: AttributedString {
        var attributedString = AttributedString(self)
        attributedString.underlineStyle = .single
        return attributedString
    }
}
