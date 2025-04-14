//
//  QuizButton.swift
//  Funkzeugnisse
//
//  Created by Janin Schroth on 19.12.24.
//

import SwiftUI

struct QuizButton: View {
    var text: String = ""
    var background = Color.button
    
    var body: some View {
        Text(text)
            .fixedSize(horizontal: false, vertical: true)
            .font(.system(size: 16))
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .padding()
            .padding(.horizontal)
            .background(background)
            .cornerRadius(10)
            .shadow(radius: 10)
    }
}
