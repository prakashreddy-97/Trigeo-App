//
//  QuizModel.swift
//  Trigeo App
//
//  Created by Mahesh on 24/04/19.
//  Copyright © 2019 student. All rights reserved.
//

import Foundation
@objcMembers
class Quiz: NSObject {
    var Answer: String?
    var Level: String?
    var Image: String?
    var Quetion: String?
    var objectId:String?
    var Option1: String?
    var Option2: String?
    var Option3: String?
    var Option4: String?
    //var Options:[Options]?
}

@objcMembers
class Options: NSObject {
    var Option1: String?
    var Option2: String?
    var Option3: String?
    var Option4: String?

    //var Image: Int = 0
}
