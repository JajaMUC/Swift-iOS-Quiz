//
//  QuestionView.swift
//  Funkzeugnisse
//
//  Created by Janin Schroth on 19.12.24.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var quizController: QuizController

    var body: some View {
        VStack {
            VStack {
                HStack {
                    Spacer()
                    Text("\(quizController.index + 1) von \(quizController.length)")
                }
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        
                        HStack {
                            Text("# \(quizController.questionnumber)")
                                .bold()
                            Spacer()
                        }
                        
                        Text(quizController.question)
                            .font(.system(size: 14))
                            .lineSpacing(0.4)
                            .fixedSize(horizontal: false, vertical: true)
                            .foregroundColor(Color.black)
                        
                        ForEach(quizController.answerChoices, id: \.id) { answer in
                            AnswerButton(answer: answer)
                                .environmentObject(quizController)
                        }
                        NextButton(background: quizController.answerSelected ? Color.button : .gray, imageName: quizController.answerAnswered ? "chevron.right.2" : "target")
                            .environmentObject(quizController)
                
                        Spacer()
                    }
                    .padding([.top, .bottom, .leading, .trailing], 15)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.white)
                    .cornerRadius(10)
                }
            }
            .padding(.bottom, 10)
        }
        .padding([.bottom, .leading, .trailing], 10)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background)
        .toolbarRole(.navigationStack)
    }
}

#Preview {
    QuestionView()
        .environmentObject(QuizController(name: "data.json"))
}
    
