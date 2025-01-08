//
//  Answer.swift
//  Funkzeugnisse
//
//  Created by Janin Schroth on 19.12.24.
//

import Foundation

struct  Answer: Identifiable, Decodable, Hashable {
    var id = UUID()
    var text: String
    var isCorrect: Bool
    var index: Int
}
