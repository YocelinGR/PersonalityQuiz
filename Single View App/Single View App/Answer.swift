//
//  Answer.swift
//  Single View App
//
//  Created by Apple Device 7 on 10/19/19.
//  Copyright © 2019 PersonalityQuiz-ECC. All rights reserved.
//

import Foundation


enum Type {
    case Bella, Ariel, Mulan, Tiana
    
    func definition()-> String{
        print("Is princess")
        return "Is princess"
    }
}


struct Answer {
    var text: String
    var type: Type
    
    init(text: String, type: Type) {
        self.text = text
        self.type = type
    }
}
