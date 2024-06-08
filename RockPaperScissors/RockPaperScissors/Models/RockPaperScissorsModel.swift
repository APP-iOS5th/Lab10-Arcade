// MARK: - Enum
enum RPSGamePlayerCase {
	case tuna, mandu
	func named() -> String {
		switch self {
			case .tuna: return IMAGE_TUNA
			case .mandu: return IMAGE_MANDU
		}
	}
}

enum RPSGameRockPaperScissorsCase: Int, CaseIterable {
	case rock = 101
	case paper = 102
	case scissors = 103
	
	func named() -> String {
		switch self {
			case .rock: return IMAGE_RPS_ROCK
			case .paper: return IMAGE_RPS_PAPER
			case .scissors: return IMAGE_RPS_SCISSORS
		}
	}
}
enum RPSGameResultCase: String {
	case win = "WIN"
	case lose = "LOSE"
	case draw = "DRAW"
	case none = "NONE"
}

// MARK: - Model
struct PlayerModel {
	typealias Player = RPSGamePlayerCase
	
	var you:Player?
	var com:Player?
}

struct RPSModel {
	typealias RPS = RPSGameRockPaperScissorsCase
	
	var select: RPS?
}

// MARK: - Class
class PlayerState {
	typealias PlayerCase = RPSGamePlayerCase
	typealias RPSCase = RPSGameRockPaperScissorsCase
	typealias ResultCase = RPSGameResultCase
	
	var player: PlayerCase
	var rps: RPSCase
	var result: ResultCase
	var rpsPrevSelected: RPSCase?
	
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
		}
	}
	
	func rpsDownImageName() -> String {
		switch rps {
			case RPSCase.rock: IMAGE_RPS_ROCK_DOWN
			case RPSCase.paper: IMAGE_RPS_PAPER_DOWN
			case RPSCase.scissors: IMAGE_RPS_SCISSORS_DOWN
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
