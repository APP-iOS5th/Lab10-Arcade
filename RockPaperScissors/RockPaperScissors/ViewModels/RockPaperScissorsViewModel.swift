class RockPaperScissorsViewModel {
	static let sharedData = RockPaperScissorsViewModel()
	
	var yourPlayer: Player
	var comPlayer: Player
	var yourRockPaperScissors: RockPaperScissors
	var comRockPaperScissors: RockPaperScissors
	var yourGameResult: GameResult
	var comGameResult: GameResult
	
	private init() {
		yourPlayer = Player.tuna
		comPlayer = Player.mandu
		yourRockPaperScissors = RockPaperScissors.rock
		comRockPaperScissors = RockPaperScissors.scissors
		yourGameResult = GameResult.lose
		comGameResult = GameResult.win
	}
	
}

extension RockPaperScissorsViewModel {
	func selectedPlayer(_ index: Int) {
		switch index {
			case 0:
				yourPlayer = .tuna
				comPlayer = .mandu
				print("Log ViewModel - index 0 \(yourPlayer)") // LOG
			case 1:
				yourPlayer = .mandu
				comPlayer = .tuna
				print("Log ViewModel - index 1 \(yourPlayer)") // LOG
			default:
				break
		}
	}
}
