//
//  ContentView.swift
//  Funkzeugnisse
//
//  Created by Janin Schroth on 08.01.25.
//

import SwiftUI
import Foundation
import CoreData

struct ContentView: View {
    
    @StateObject var quizController = QuizController(name: "data.json")
    var body: some View {
        
        NavigationStack () {
            VStack () {
                Text("Funkscheine")
                Text("Lerne mit dieser App für Deine Funkscheine")
                    .font(.system(size: 18))

                VStack (alignment: .leading, spacing: 40) {
                    VStack (alignment: .leading, spacing: 15) {
                            
                        Text("Wähle, für  welchen Funkschein Du lernen möchtest")
                        
                            NavigationLink{
                                QuizMainView(quizCertificate: "UBI")
                                    .environmentObject(quizController)
                            } label: {
                                QuizButton(text: "UBI")
                            }

                            NavigationLink{
                                QuizMainView(quizCertificate: "SRC")
                                    .environmentObject(quizController)
                            } label: {
                                QuizButton(text: "SRC")
                            }
                        NavigationLink{
                            QuizMainView(quizCertificate: "SRCUBI")
                                .environmentObject(quizController)
                        } label: {
                            QuizButton(text: "SRC auf UBI")
                        }

                        }
                        Spacer()
                        Text("")
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.background)
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                }
            .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.background)
                .navigationTitle("Funkscheine")
                .navigationBarHidden(true)
                .font(.title3)
        }
    }
}


#Preview {
    ContentView()
}
