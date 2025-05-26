//
//  Quiz.swift
//  Funkzeugnisse
//
//  Created by Janin Schroth on 19.12.24.
//

import Foundation

struct Quiz: Decodable {
    
    var questions: [Question]
    
    struct Question: Decodable  {
        var id: UUID {
            UUID()
        }
        var questionId: Int
        var questionNumber: Int
        var certificate: String
        var categoryId: Int
        var categoryTitle: String
        
        var question: String
        var correctAnswer: String
        var incorrectAnswerOne: String
        var incorrectAnswerTwo: String
        var incorrectAnswerThree: String
        
        var questionnaireAll: [Int]
        var questionnaireSrc: [Int]
        
        var questionStatus: Int
        var questionAnswered: Int
        var questionCorrect: Int
        
        
        var answers: [Answer] {
            
            let correct = [Answer(text: correctAnswer, isCorrect: true, index: 0)]
            
            let incorrectOne = [Answer(text: incorrectAnswerOne, isCorrect: false, index: 1)]
            let incorrectTwo = [Answer(text: incorrectAnswerTwo, isCorrect: false, index: 2)]
            let incorrectThree = [Answer(text: incorrectAnswerThree, isCorrect: false, index: 3)]
            
            // Merging the correct and incorrect arrays together
            let allAnswers = correct + incorrectOne + incorrectTwo + incorrectThree
            // Shuffling the answers so the correct answer isn't always the first answer of the array
            return allAnswers.shuffled()
        }
        
    }
}
