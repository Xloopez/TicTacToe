//
//  ChosenDifficultyViewController.swift
//  TicTacToe
//
//  Created by Nicole Lopez feliz on 2020-12-17.
//

import UIKit

class ChosenDifficultyViewController: UIViewController {
    
    @IBOutlet weak var btn1: UIButton!
    
    @IBOutlet weak var gameBoardView: UIView!
    
    @IBOutlet weak var playerNameTurnLabel: UILabel!
    
    @IBOutlet weak var playerOneLabel: UILabel!
    
    @IBOutlet weak var PlayerTwoLabel: UILabel!
    
    var listOfPlayers: [Player] = []
    
    var square = Squares()
    
    var counter = 0
    
    var xY = 0
    
    var yX = 0
    
    var chosenDifficulty = ""
    
    var squaresInRow = 3
    
    let gameSettings = GameSettings()
    
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let winningCombosEasy = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    //let squareLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(chosenDifficulty)
        
        whatDificultyToDisplay(playersDificulty: chosenDifficulty)
        
        displayPlayerName()
        
        
    }
    
    func whatDificultyToDisplay (playersDificulty: String) {
        if playersDificulty == "easy" {
            addSquaresToGameBoard(amountOfSqares: 8)
            
        } else if playersDificulty == "medium" {
            square.squareHeight = 90
            square.squareWidth = 90
            squaresInRow = 4
            gameState.append(contentsOf: [0, 0, 0, 0, 0, 0, 0])
            addSquaresToGameBoard(amountOfSqares: 15)
            
        } else if playersDificulty == "hard" {
            square.squareHeight = 70
            square.squareWidth = 70
            squaresInRow = 5
            gameState.append(contentsOf: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
            addSquaresToGameBoard(amountOfSqares: 24)
        }
    }
    
    func displayPlayerName(){
        playerOneLabel.text = String(listOfPlayers[0].name ?? "NONE")
        PlayerTwoLabel.text = String(listOfPlayers[1].name ?? "NONE")
        
        playerNameTurnLabel.text = listOfPlayers[0].name
    }
    
    func addSquaresToGameBoard(amountOfSqares: Int){
        //Creates 9 squares
        for i in 0...amountOfSqares {
            let addedSquareLabel = createSquare(item: square)
            
            //Adds tag to square
            addedSquareLabel.tag = i
            
            //Addes squares vertically
            xY += square.squareWidth + square.squareSpace
            
            gameBoardView.addSubview(addedSquareLabel)
            
            //Addes squares horizontally
            if xY == (square.squareWidth * squaresInRow) + (square.squareSpace * squaresInRow) {
                xY = 0
                yX += square.squareWidth + square.squareSpace
                
            }
            //print(i)
        }

    }
    
    //This function creates the design of the squares inside of our Game Board View in storyboard
    func createSquare (item: UIView) -> UILabel {
        let squareLabel = UILabel()
        
        //Setting board view squares size, colors and other attributes
        squareLabel.frame = CGRect(x: xY, y: yX, width: square.squareWidth, height: square.squareHeight)
        
        squareLabel.text = ""
        squareLabel.textAlignment = .center
        squareLabel.layer.cornerRadius = 5
        squareLabel.layer.borderWidth = 1
        
        //isUserInteractionEnabled is set to true so that you can tap
        squareLabel.isUserInteractionEnabled = true
        squareLabel.layer.borderColor = UIColor.lightGray.cgColor
        
        //To add tap recognizers on our squares in Game Board View 
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(self.handleGesture))
        squareLabel.addGestureRecognizer(labelTap)
        
        return squareLabel
    }
    
    @objc func handleGesture(sender: UITapGestureRecognizer? = nil){
        //Function that handles tap gesture in the created UILables
        
        if sender?.state == .ended {
            
            //if view tag != nil we enable user interaction so that when we press the button we can do things
            guard let viewTag = sender?.view?.tag else {return}
            
            let targetLabel = sender?.view?.viewWithTag(viewTag) as? UILabel
            
            targetLabel?.isUserInteractionEnabled = false
            
            switch counter {
            case 0:
                //When counter is 0 it displays player 1 turn
                
                targetLabel?.text = "X"

                if let labelTag = targetLabel?.tag {
                    //Saves the players chosen tag so that we can determine the winner in func checkWinner
                    //Player X lables is saved as 1 to compare to winning combos
                    gameState[labelTag] = 1
                }
                
                playerNameTurnLabel.text = listOfPlayers[1].name
                
                counter += 1
            
            case 1:
                targetLabel?.text = "O"
                
                if let labelTag = targetLabel?.tag {
                    //Saves the players chosen tag so that we can determine the winner in func checkWinner
                    //Player O lables is saved as 2 to compare to winning combos
                    gameState[labelTag] = 2
                }
                
                playerNameTurnLabel.text = listOfPlayers[0].name
                
                counter = 0
             
            default:
                print("Vi kom hit")
                return
            }
            
            
            let winnerIs = checkWinner(targetLabel: targetLabel!)
            //gameBoardView.isUserInteractionEnabled = true
            
        }
        
        //let winnerIs = checkWinner()
        //print(winnerIs)
        
    }
    
    func checkWinner (targetLabel: UIView) -> String {
        for combinations in winningCombosEasy {
            if gameState[combinations[0]] != 0 && gameState[combinations[0]] == gameState[combinations[1]] && gameState[combinations[1]] == gameState[combinations[2]] {
                
                targetLabel.isUserInteractionEnabled = true
                
                if gameState[combinations[0]] == 1 {
                    //targetLabel.isUserInteractionEnabled = true
                    return "X"
                } else if gameState[combinations[0]] == 2{
                    return "O"
                } else {
                    return "draw"
                }
            }
        }
        
        return ""
    }

}
