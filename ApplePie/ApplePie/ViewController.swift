//
//  ViewController.swift
//  ApplePie
//
//  Created by Ontic on 09/02/22.
//

import UIKit

class ViewController: UIViewController {

    var numberOfWins = 0
    var numberOfLoss = 0
    var currentGame : Game!
    var wordGuessedSoFar : String!
    
    @IBOutlet var treeImageView: UIImageView!
    
    @IBOutlet var keyBoardButton: [UIButton]!
    
    @IBOutlet var wordGuessLabel: UILabel!
    
    @IBOutlet var resultLabel: UILabel!
    
    @IBAction func keyBoardButtonAction(_ sender: UIButton) {
        if var buttonPressed = sender.titleLabel!.text {
            buttonPressed = buttonPressed.lowercased()
            let characterPressed = Character(buttonPressed)
            check(letterPressed: characterPressed)
        }
        sender.isEnabled = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        newRound()
    }
    
    func newRound() {
        currentGame = Game()
        wordGuessedsoFar()
        wordGuessLabel.text = wordGuessedSoFar
        for button in keyBoardButton{
            button.isEnabled = true
        }
        updateUI()
    }
    
    func wordGuessedsoFar() {
        wordGuessedSoFar = ""
        for _ in 1...currentGame.word.count{
            if wordGuessedSoFar != nil {
                wordGuessedSoFar += "_ "
            }
            else{
                wordGuessedSoFar = "_ "
            }
        }
    }
    
    func check(letterPressed : Character) {
        if currentGame.word.firstIndex(of: letterPressed) != nil {
            var temp = ""
            for (index,ch) in currentGame.word.enumerated(){
                if ch == letterPressed{
                    temp += String(letterPressed) + " "
                }else {
                    let indices = 2*index
                    let indexTemp = wordGuessedSoFar.index(wordGuessedSoFar.startIndex, offsetBy: indices)
                    if wordGuessedSoFar[indexTemp] != "_" {
                        temp.append(contentsOf: String(wordGuessedSoFar[indexTemp]))
                        temp.append(" ")
                    }
                    else{
                        temp += "_ "
                    }
                }
            }
            
            wordGuessedSoFar = temp
            
            if !wordGuessedSoFar.contains("_"){
                updateWin()
            }
        }else {
            if currentGame.numberOfMovesRemaining > 0{
                currentGame.numberOfMovesRemaining -= 1
            }
            else
            {
                updateLoss()
            }
        }
        updateUI()
    }
    
    func updateUI() {
        treeImageView.image = UIImage(named: "Tree \(currentGame.numberOfMovesRemaining)")
        resultLabel.text = "Wins: \(numberOfWins), Losses: \(numberOfLoss)"
        wordGuessLabel.text = wordGuessedSoFar
    }
    
    func updateWin(){
        numberOfWins += 1
        let alertController = UIAlertController(title: "Congratulations", message: "Congrats on successfully winning this round, try and win the next one", preferredStyle:.alert)
        alertController.addAction(UIAlertAction(title: "Continue", style: .default, handler: {_ in self.newRound()}))
        self.present(alertController,animated: true,completion: nil)
    }
    
    func updateLoss(){
        numberOfLoss += 1
        let alertController = UIAlertController(title: "Game Over", message: "Sorry but you lost this game, try again", preferredStyle:.alert)
        alertController.addAction(UIAlertAction(title: "Continue", style: .default, handler: {_ in self.newRound()}))
        self.present(alertController,animated: true,completion: nil)
    }
}

