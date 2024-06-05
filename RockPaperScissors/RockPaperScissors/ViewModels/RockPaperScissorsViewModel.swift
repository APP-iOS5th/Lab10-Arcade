class RockPaperScissorsViewModel {
	typealias PlayerCase = RPSGamePlayerCase
	typealias RPSCase = RPSGameRockPaperScissorsCase
	typealias ResultCase = RPSGameResultCase
	
	static let sharedData = RockPaperScissorsViewModel()
	private init () {}
	
	let your = RPSGameState(
		player: PlayerCase.tuna,
		rps: RPSCase.rock,
		result: ResultCase.draw
	)
	
	let com = RPSGameState(
		player: PlayerCase.mandu,
		rps: RPSCase.rock,
		result: ResultCase.draw
	)
}

extension RockPaperScissorsViewModel {
	func selectedPlayer(_ index: Int) {
		switch index {
			case 0:
				your.player = PlayerCase.tuna
				com.player = PlayerCase.mandu
				print("Log ViewModel - index 0 - your : \(your.player )") // LOG
			case 1:
				your.player = PlayerCase.mandu
				com.player = PlayerCase.tuna
				print("Log ViewModel - index 1 - your : \(your.player)") // LOG
			default:
				break
		}
	}
}
