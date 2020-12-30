//
//  GameSetting.swift
//  TicTacToe
//
//  Created by Nicole Lopez feliz on 2020-12-29.
//

import Foundation

class GameSettings {
    var listOfPlayers: Array<Player> = Array()
    
    func addPlayersToList(name: String){
        listOfPlayers.append(Player(name: name, points: 0))
    }
}
