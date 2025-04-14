//
//  Question.swift
//  Funkzeugnisse
//
//  Created by Janin Schroth on 04.04.25.
//

import SwiftData

@Model
class Question {
    var questionid: Int
    var questionstatus: Int
    var questionanswered: Int
    var questioncorrect: Int
    
    init(questionid: Int, questionstatus: Int, questionanswered: Int, questioncorrect: Int) {
        self.questionid = questionid
        self.questionstatus = questionstatus
        self.questionanswered = questionanswered
        self.questioncorrect = questioncorrect
    }
}
