//
//  Question.swift
//  Funkzeugnisse
//
//  Created by Janin Schroth on 04.04.25.
//

import SwiftData

@Model
final class Question {
    @Attribute(.unique) var questionId: Int
    var certificate: String
    var categoryId: Int
    var questionStatus: Int
    var questionAnswered: Int
    var questionCorrect: Int
    
    init(questionId: Int, certificate: String, categoryId: Int, questionStatus: Int, questionAnswered: Int, questionCorrect: Int) {
        self.questionId = questionId
        self.certificate = certificate
        self.categoryId = categoryId
        self.questionStatus = questionStatus
        self.questionAnswered = questionAnswered
        self.questionCorrect = questionCorrect
    }
}
