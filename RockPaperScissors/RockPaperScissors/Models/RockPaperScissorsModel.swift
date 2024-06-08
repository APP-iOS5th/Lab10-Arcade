// MARK: - Enum

import UIKit

enum RPSGamePlayerCase {
	case tuna, mandu
	
	func named() -> String {
		switch self {
			case .tuna: return IMAGE_TUNA
			case .mandu: return IMAGE_MANDU
		}
	}
	
	func uiImage() -> UIImage {
		switch self {
			case .tuna: return UIImage(named: IMAGE_TUNA)!
			case .mandu: return UIImage(named: IMAGE_MANDU)!
		}
	}
}
enum RPSGameRockPaperScissorsCase: Int, CaseIterable {
	case rock = 101
	case paper = 102
	case scissors = 103
	case none = 100
}
enum RPSGameResultCase: String {
	case win = "WIN"
	case lose = "LOSE"
	case draw = "DRAW"
	case none = "NONE"
}


struct PlayerModel {
	typealias Player = RPSGamePlayerCase
	
	var you:Player?
	var com:Player?
}

// MARK: - Class
class PlayerState {
	typealias PlayerCase = RPSGamePlayerCase
	typealias RPSCase = RPSGameRockPaperScissorsCase
	typealias ResultCase = RPSGameResultCase
	
	var player: PlayerCase
	var rps: RPSCase
	var result: ResultCase
	var rpsPrevSelected: RPSCase = .none
	
	init(player: PlayerCase, rps: RPSCase, result: ResultCase) {
		self.player = player
		self.rps = rps
		self.result = result
	}
	
	func playerImageName() -> String {
		switch player {
			case PlayerCase.tuna: IMAGE_TUNA
			case PlayerCase.mandu: IMAGE_MANDU
		}
	}
	
	func rpsUpImageName() -> String {
		switch rps {
			case RPSCase.rock: IMAGE_RPS_ROCK_UP
			case RPSCase.paper: IMAGE_RPS_PAPER_UP
			case RPSCase.scissors: IMAGE_RPS_SCISSORS_UP
			case RPSCase.none: ""
		}
	}
	
	func rpsDownImageName() -> String {
		switch rps {
			case RPSCase.rock: IMAGE_RPS_ROCK_DOWN
			case RPSCase.paper: IMAGE_RPS_PAPER_DOWN
			case RPSCase.scissors: IMAGE_RPS_SCISSORS_DOWN
			case RPSCase.none: ""
		}
	}
	
	func resultText() -> String {
		var text = ""
		switch result {
			case .win:
				text = "WIN"
			case .lose:
				text = "LOSE"
			case .draw:
				text = "DRAW"
			case .none:
				text = "NONE"
		}
		
		return text
	}
	
}

class GameState {
	
}
