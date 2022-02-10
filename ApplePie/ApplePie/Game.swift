//
//  Game.swift
//  ApplePie
//
//  Created by Ontic on 09/02/22.
//

import Foundation

struct Game {
    private(set) var word : String
    var numberOfMovesRemaining : Int
    
    init(){
        let list = listOfWords.self()
        word = list.wordList()
        numberOfMovesRemaining = 7
    }
    
}
