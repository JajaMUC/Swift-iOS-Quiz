//
//  QuizController.swift
//  Funkzeugnisse
//
//  Created by Janin Schroth on 19.12.24.
//

import Foundation

class QuizController: ObservableObject {
    
    //
    @Published private(set) var name: String
    
    //Quiz
    private(set) var quiz: [Quiz.Question] = []
    @Published private(set) var currentQuiz: [Quiz.Question] = []
    @Published private(set) var length: Int = 0
    @Published private(set) var index: Int = 0
    @Published var reachedEnd: Bool = false
    @Published private(set) var quizCertificate: String = ""
    @Published private(set) var questionnaireId: Int = 0
    @Published private(set) var questionNumber: Int = 0
    
    //Quiz-Controller
    @Published var answerAnswered: Bool = true
    @Published private(set) var answerSelected: Bool = false
    @Published private(set) var answeredCorrectly: Bool = false
    @Published private(set) var answerSelection: [Bool] = [false, false, false, false]
    @Published var test: Int = 0
    
    //Question-Content
    @Published private(set) var question: String = ""
    @Published private(set) var answerChoices: [Answer] = []
    
    //Question-Metadata = Model-Data
    @Published private(set) var questionId: Int = 0
    @Published private(set) var certificate: String = ""
    @Published private(set) var categoryId: Int = 0
    @Published private(set) var questionStatus: Int = 0
    @Published private(set) var questionAnswered: Int = 0
    @Published private(set) var questionCorrect: Int = 0

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
            
            self.quiz = decodedData.questions
            
        } catch {
            print("Error fetching trivia: \(error)")
        }
    }
    
    func setCurrentQuiz(categoryId: Int, quizCertificate: String, modus: String, questionnaireId: Int) {
        reachedEnd = false
        currentQuiz = []
        switch modus {
        //Quiz für den Lernmodus setzen
        case "review":
            if categoryId != 0 {
                if quizCertificate == "SRCUBI" {
                    for i in 0...quiz.count - 1 {
                        if quiz[i].certificate == "UBI" {
                            if quiz[i].categoryId == categoryId && quiz[i].questionnaireSrc[0] != 0 {
                                currentQuiz.append(quiz[i])
                            }
                        }
                    }
                } else {
                    for i in 0...quiz.count-1 {
                        if quiz[i].categoryId == categoryId && quiz[i].certificate == quizCertificate {
                            currentQuiz.append(quiz[i])
                        }
                    }
                }
            } else {
                if certificate == "SRCUBI" {
                    for i in 0...quiz.count - 1 {
                        if quiz[i].certificate == "UBI" && quiz[i].questionnaireSrc[0] != 0 {
                                currentQuiz.append(quiz[i])
                        }
                    }
                } else {
                    for i in 0...quiz.count-1 	{
                        if quiz[i].certificate == quizCertificate {
                            currentQuiz.append(quiz[i])
                        }
                    }
                }
            }
            length = currentQuiz.count
            currentQuiz.shuffle()

            //Quiz für den Prüfungsmodus setzen

        case "questionnaire":
            if quizCertificate == "SRCUBI" {
                for i in 0...quiz.count - 1 {
                    if quiz[i].questionnaireSrc.contains(questionnaireId) {
                        currentQuiz.append(quiz[i])
                    }
                }
            } else {
                for i in 0...quiz.count - 1 {
                    if quiz[i].questionnaireAll.contains(questionnaireId) {
                        currentQuiz.append(quiz[i])
                    }
                }
            }
            length = currentQuiz.count

        default:
            if categoryId != 0 {
                if quizCertificate == "UBI" || quizCertificate == "SRC" {
                    for i in 0...quiz.count - 1 {
                        if quiz[i].categoryId == categoryId {
                            currentQuiz.append(quiz[i])
                        }
                    }
                }
                if quizCertificate == "SRCUBI" {
                    for i in 0...quiz.count - 1 {
                        if quiz[i].categoryId == categoryId && quiz[i].questionnaireSrc[0] != 0 {
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
        //testing parameter
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
        for i in 0...3 {
            answerSelection[i] = false
        }
        if index < length {
            let currentQuizQuestion = currentQuiz[index]
            questionNumber = currentQuizQuestion.questionNumber
            questionId = currentQuizQuestion.questionId
            question = currentQuizQuestion.question
            answerChoices = currentQuizQuestion.answers.shuffled()
        }
        answerSelected = false
        answerAnswered = false
        answeredCorrectly = false
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
    
    func setQuestionStatus(questionStatus: Int) {
        self.questionStatus = questionStatus
    }
    
    func logAnswer() {
        answerAnswered = true
    }
    
    func setModelData(question: Question) {
        self.questionId = question.questionId
        self.certificate = question.certificate
        self.categoryId = question.categoryId
        self.questionStatus = question.questionStatus
        self.questionAnswered = question.questionAnswered
        self.questionCorrect = question.questionCorrect
    }
}
