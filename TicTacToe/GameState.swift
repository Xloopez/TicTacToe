//
//  GameState.swift
//  TicTacToe
//
//  Created by Nicole Lopez feliz on 2021-01-05.
//

import Foundation

class GameState {
 
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    var counter = 0
    
    var theWinningCombo = [[Int]]()
    
    let winningCombosEasy = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    let winningCombosMedium = [[0, 1, 2, 3], [4, 5, 6, 7], [8, 9, 10, 11], [12, 13, 14, 15], [0, 4, 8, 12], [1, 5, 9, 13], [2, 6, 10, 14], [3, 7, 11, 15], [0, 5, 10, 15], [3, 6, 9, 12]]
    
    let winningCombosHard = [[0, 1, 2, 3, 4], [5, 6, 7, 8, 9], [10, 11, 12, 13, 14], [15, 16, 17, 18, 19], [20, 21, 22, 23, 24], [0, 5, 10, 15, 20], [1, 6, 11, 16, 21], [2, 7, 12, 17, 22], [3, 8, 13, 18, 23], [4, 9, 14, 19, 24], [0, 6, 12, 18, 24], [4, 8, 12, 16, 20]]
    
    func whatDificultyToDisplay (playersDificulty: String, square: Squares) -> (Int?, Int?) {
        var squaresInRow = 3
        
        if playersDificulty == "easy" {
            return (8, squaresInRow)
            
        } else if playersDificulty == "medium" {
            square.squareHeight = 90
            square.squareWidth = 90
            squaresInRow = 4
            gameState.append(contentsOf: [0, 0, 0, 0, 0, 0, 0])
            
            return (15, squaresInRow)
            
        } else if playersDificulty == "hard" {
            square.squareHeight = 70
            square.squareWidth = 70
            squaresInRow = 5
            gameState.append(contentsOf: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
            
            
            return (24, squaresInRow)
        }
        return (0, 0)
    }
    
 func checkWinnerEasy() -> String {
     for combinations in winningCombosEasy {
         if gameState[combinations[0]] != 0 &&
            gameState[combinations[0]] == gameState[combinations[1]] &&
            gameState[combinations[1]] == gameState[combinations[2]] {
             
             if gameState[combinations[0]] == 1 {
                
                theWinningCombo.append(combinations)

                 return "X"
             } else if gameState[combinations[0]] == 2 {
                
                 return "O"
             }
         }
        
     }
    
    counter += 1
    
    if counter == gameState.count {
        counter = 0
        return "draw"
    }
     
     return ""
 }

 func checkWinnerMedium() -> String {
     for combinations in winningCombosMedium {
         if gameState[combinations[0]] != 0 &&
             gameState[combinations[0]] == gameState[combinations[1]] &&
             gameState[combinations[1]] == gameState[combinations[2]] &&
             gameState[combinations[2]] == gameState[combinations[3]] {
            
             if gameState[combinations[0]] == 1 {
                 return "X"
             } else if gameState[combinations[0]] == 2{
                 return "O"
             } else {
                 return "draw"
             }
         }
     }
    
    counter += 1
    
    if counter == gameState.count {
        counter = 0
        return "draw"
    }
     
     return ""
 }

 func checkWinnerHard() -> String {
     for combinations in winningCombosHard {
         if gameState[combinations[0]] != 0 &&
             gameState[combinations[0]] == gameState[combinations[1]] &&
             gameState[combinations[1]] == gameState[combinations[2]] &&
             gameState[combinations[2]] == gameState[combinations[3]] &&
             gameState[combinations[3]] == gameState[combinations[4]] {
             
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
    
    counter += 1
    
    if counter == gameState.count {
        counter = 0
        return "draw"
    }
     
     return ""
 }
 
}
