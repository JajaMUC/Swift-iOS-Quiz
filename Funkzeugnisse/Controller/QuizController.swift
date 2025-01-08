//
//  QuizController.swift
//  Funkzeugnisse
//
//  Created by Janin Schroth on 19.12.24.
//

import Foundation

class QuizController: ObservableObject {
    
    @Published private(set) var name: String
    private(set) var quiz: [Quiz.Result] = []
    @Published private(set) var length = 0
    @Published private(set) var index = 0
    @Published var reachedEnd = false
    @Published private(set) var answerSelected = false
    @Published private(set) var answeredCorrectly = false
    @Published private(set) var answerSelection = [false, false, false, false]
    @Published private(set) var answerAnswered = false
    @Published private(set) var question: String = ""
    @Published private(set) var questionnumber: Int16 = 0
    @Published private(set) var questionid: UUID = UUID()
    @Published private(set) var answerChoices: [Answer] = []
    @Published private(set) var currentQuiz: [Quiz.Result] = []
    @Published private(set) var questionnaireid = 0
    
    init(name: String) {
        self.name = name
        fetchQuiz(name)
    }
    
    func fetchQuiz(_ filename: String) {
        let data: Data
        
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
        }
        
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }
        do {
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedData = try decoder.decode(Quiz.self, from: data)
            
            self.quiz = decodedData.results
            
        } catch {
            print("Error fetching trivia: \(error)")
        }
    }
    
    func setCurrentQuiz(categoryid: Int, certificate: String, modus: String, questionnaireid: Int) {
        reachedEnd = false
        currentQuiz = []
        switch modus {
        //Quiz für den Lernmodus setzen
        case "review":
            if categoryid != 0 {
                if certificate == "SRCUBI" {
                    for i in 0...quiz.count - 1 {
                        if quiz[i].certificate == "UBI" {
                            if quiz[i].categoryid == categoryid && quiz[i].questionnairesrc[0] != 0 {
                                currentQuiz.append(quiz[i])
                            }
                        }
                    }
                } else {
                    for i in 0...quiz.count-1 {
                        if quiz[i].categoryid == categoryid && quiz[i].certificate == certificate {
                            currentQuiz.append(quiz[i])
                        }
                    }
                }
            } else {
                if certificate == "SRCUBI" {
                    for i in 0...quiz.count - 1 {
                        if quiz[i].certificate == "UBI" && quiz[i].questionnairesrc[0] != 0 {
                                currentQuiz.append(quiz[i])
                        }
                    }
                } else {
                    for i in 0...quiz.count-1 	{
                        if quiz[i].certificate == certificate {
                            currentQuiz.append(quiz[i])
                        }
                    }
                }
            }
            length = currentQuiz.count
            currentQuiz.shuffle()

            //Quiz für den Prüfungsmodus setzen

        case "questionnaire":
            if certificate == "SRCUBI" {
                for i in 0...quiz.count - 1 {
                    if quiz[i].questionnairesrc.contains(questionnaireid) {
                        currentQuiz.append(quiz[i])
                    }
                }
            } else {
                for i in 0...quiz.count - 1 {
                    if quiz[i].questionnaireall.contains(questionnaireid) {
                        currentQuiz.append(quiz[i])
                    }
                }
            }
            length = currentQuiz.count

        default:
            if categoryid != 0 {
                if certificate == "UBI" || certificate == "SRC" {
                    for i in 0...quiz.count - 1 {
                        if quiz[i].categoryid == categoryid {
                            currentQuiz.append(quiz[i])
                        }
                    }
                }
                if certificate == "SRCUBI" {
                    for i in 0...quiz.count - 1 {
                        if quiz[i].categoryid == categoryid && quiz[i].questionnairesrc[0] != 0 {
                            currentQuiz.append(quiz[i])
                        }
                    }
                }
            }
        }
    }
    
    
    func resetQuiz() {
        currentQuiz = []
        length = 0
        index = 0
    }
        
    func goToNextQuestion() {
        if index + 1 < length {
            index += 1
            setQuestion()
        } else {
            index = 0
            setQuestion()
        }
    }
        
    func setQuestion() {
        answerSelected = false
        answerAnswered = false
        answeredCorrectly = false
        for i in 0...3 {
            answerSelection[i] = false
        }
        if index < length {
            let currentQuizQuestion = currentQuiz[index]
            questionnumber = currentQuizQuestion.questionnumber
            questionid = currentQuizQuestion.id
            question = currentQuizQuestion.question
            answerChoices = currentQuizQuestion.answers.shuffled()
        }
    }
    
    func selectAnswer(answer: Answer) {
        answerSelected = true
        answerAnswered = false
        for i in 0...3 {
            answerSelection[i] = false
        }
        answerSelection[answer.index] = true
        if answer.isCorrect {
            answeredCorrectly = true
        } else {
            answeredCorrectly = false
        }
    }
    
    func logAnswer() {
        answerAnswered = true
    }
}
