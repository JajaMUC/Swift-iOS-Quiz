//
//  Quiz.swift
//  Funkzeugnisse
//
//  Created by Janin Schroth on 19.12.24.
//

import Foundation

struct Quiz: Decodable {
    
    var results: [Result]
    
    struct Result: Decodable  {
        var id: UUID {
            UUID()
        }
        var questionid: Int
        var questionnumber: Int
        var certificate: String
        var categoryid: Int
        var categorytitle: String
        
        var question: String
        var correctanswer: String
        var incorrectanswer1: String
        var incorrectanswer2: String
        var incorrectanswer3: String
        
        var questionnaireall: [Int]
        var questionnairesrc: [Int]
        
        var status: Int
        var questionanswered: Int
        var questioncorrect: Int
        
        
        var answers: [Answer] {
            
            let correct = [Answer(text: correctanswer, isCorrect: true, index: 0)]
            
            let incorrect1 = [Answer(text: incorrectanswer1, isCorrect: false, index: 1)]
            let incorrect2 = [Answer(text: incorrectanswer2, isCorrect: false, index: 2)]
            let incorrect3 = [Answer(text: incorrectanswer3, isCorrect: false, index: 3)]
            
            // Merging the correct and incorrect arrays together
            let allAnswers = correct + incorrect1 + incorrect2 + incorrect3
            // Shuffling the answers so the correct answer isn't always the first answer of the array
            return allAnswers.shuffled()
        }
        
    }
}
