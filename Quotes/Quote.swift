//
//  Quote.swift
//  Quotes
//
//  Created by Amir Sediqi on 2021-08-27.
//

import Foundation

struct Quote: Identifiable {
    var id = UUID()
    let quoteText: String
    var liked: Bool = false
}

var testData = [
    Quote(quoteText: "Waste no more time arguing what a good man should be. Be One", liked: true),
Quote(quoteText: "He who fears death will never do anything worth of a man who is alive"),
Quote(quoteText: "Waste no more time arguing what a good man should be. Be One.")
]
