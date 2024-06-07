// MARK: - Enum
enum RPSGamePlayerCase { case tuna, mandu }
enum RPSGameRockPaperScissorsCase: String {
	case rock
	case paper
	case scissors
	case none
}
enum RPSGameResultCase: String {
	case win = "WIN"
	case lose = "LOSE"
	case draw = "DRAW"
	case none = "NONE"
}

// MARK: - Class
class RPSGameState {
	typealias PlayerCase = RPSGamePlayerCase
	typealias RPSCase = RPSGameRockPaperScissorsCase
	typealias ResultCase = RPSGameResultCase
	
	var player: PlayerCase
	var rps: RPSCase
	var result: ResultCase
	
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
				print("Log ViewModel - \(result)!") // LOG
			case .lose:
				text = "LOSE"
				print("Log ViewModel - \(result)!") // LOG
			case .draw:
				text = "DRAW"
				print("Log ViewModel - \(result)!") // LOG
			case .none:
				text = "NONE"
				print("Log ViewModel - \(result)!") // LOG
		}
		
		return text
	}
	
}
