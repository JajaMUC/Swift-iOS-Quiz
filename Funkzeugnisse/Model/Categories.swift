//
//  Categories.swift
//  Funkzeugnisse
//
//  Created by Janin Schroth on 19.12.24.
//

import Foundation

struct Categories: Codable {
    
    var id = UUID()
    var ubiCategories: [Category] = [
        Category(id: 1, name: "Binnenschifffahrtsfunk"),
        Category(id: 2, name: "Funkeinrichtungen und Schiffsfunkstellen"),
        Category(id: 3, name: "Verkehrskreise"),
        Category(id: 4, name: "Sprechfunk"),
        Category(id: 5, name: "Betriebsverfahren und Rangfolgen")
    ]
    var srcCategories: [Category] = [
        Category(id: 1, name: "Mobiler Seefunkdienst"),
        Category(id: 2, name: "Funkeinrichtungen und Seefunkstellen"),
        Category(id: 3, name: "Digitaler Selektivruf (DSC)"),
        Category(id: 4, name: "UKW(VHF)–Sprechfunk"),
        Category(id: 5, name: "Betriebsverfahren und Rangfolgen"),
        Category(id: 6, name: "Warnnachrichten"),
        Category(id: 7, name: "Seenot")
    ]
}


struct Category: Codable {
    var id: Int
    var name: String
}
