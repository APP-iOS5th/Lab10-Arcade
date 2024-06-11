//
//  MatchImageGame.swift
//  MatchImage
//
//  Created by Jungjin Park on 2024-06-11.
//

import UIKit

struct MatchImageGame {
    
    var matrix: [Int]
    var playedTime: String
    
    init(matrix: [Int], playedTime: String) {
        self.matrix = matrix
        self.playedTime = playedTime
    }
}
