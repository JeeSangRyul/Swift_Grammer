//
//  Question .swift
//  Quizzler-iOS13
//
//  Created by 지상률 on 2022/09/13.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text : String
    let answer : String
    
    init(q: String, a: String){
        text = q
        answer = a
    }
}
