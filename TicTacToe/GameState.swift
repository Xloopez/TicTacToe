//
//  GameState.swift
//  TicTacToe
//
//  Created by Nicole Lopez feliz on 2021-01-05.
//

import Foundation

class GameState {
    
    var winningCombosEasy = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    
    func whatDificultyToDisplay (playersDificulty: String, square: Squares) -> (Int?, Int?) {
        var squaresInRow = 3
        
        if playersDificulty == "easy" {
            return (8, squaresInRow)
            //addSquaresToGameBoard(amountOfSqares: 8)
            
        } else if playersDificulty == "medium" {
            square.squareHeight = 90
            square.squareWidth = 90
            squaresInRow = 4
            gameState.append(contentsOf: [0, 0, 0, 0, 0, 0, 0])
            
            return (15, squaresInRow)
            
            //addSquaresToGameBoard(amountOfSqares: 15)
            
        } else if playersDificulty == "hard" {
            square.squareHeight = 70
            square.squareWidth = 70
            squaresInRow = 5
            gameState.append(contentsOf: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
            
            
            return (24, squaresInRow)
            
            //addSquaresToGameBoard(amountOfSqares: 24)
        }
        return (0, 0)
    }
    
    func checkWinner () -> String {
        for combinations in winningCombosEasy {
            if gameState[combinations[0]] != 0 && gameState[combinations[0]] == gameState[combinations[1]] && gameState[combinations[1]] == gameState[combinations[2]] {
                
                //targetLabel.isUserInteractionEnabled = true
                
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
