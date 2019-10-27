//
//  Question.swift
//  Single View App
//
//  Created by Apple Device 7 on 10/19/19.
//  Copyright © 2019 PersonalityQuiz-ECC. All rights reserved.
//

import Foundation

enum ResponseType {
    case single
    case multiple
    case ranged
}

struct Question {
    var text: String
    var type: ResponseType
    var answer: Array<Answer>
    
    init(text: String, type: ResponseType, answer: Array<Answer>) {
        self.text = text
        self.type = type
        self.answer = answer
    }
}
