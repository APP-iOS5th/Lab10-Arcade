// MARK: - Enum
enum RPSGamePlayerCase { case tuna, mandu }
enum RPSGameRockPaperScissorsCase { case rock, paper, scissors, none }
enum RPSGameResultCase { case win, lose, draw, none }

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
			case RPSCase.rock: IMAGE_RPS_UP_ROCK
			case RPSCase.paper: IMAGE_RPS_UP_PAPER
			case RPSCase.scissors: IMAGE_RPS_UP_SCISSORS
			case RPSCase.none: ""
		}
	}
	
	func rpsDownImageName() -> String {
		switch rps {
			case RPSCase.rock: IMAGE_RPS_DOWN_ROCK
			case RPSCase.paper: IMAGE_RPS_DOWN_PAPER
			case RPSCase.scissors: IMAGE_RPS_DOWN_SCISSORS
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
