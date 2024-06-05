class RockPaperScissorsViewModel {
	typealias PlayerCase = RPSGamePlayerCase
	typealias RPSCase = RPSGameRockPaperScissorsCase
	typealias ResultCase = RPSGameResultCase
	
	static let shared = RockPaperScissorsViewModel()
	private init () {}
	
	let you = RPSGameState(
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
				you.player = PlayerCase.tuna
				com.player = PlayerCase.mandu
				print("Log ViewModel - index 0 - you : \(you.player )") // LOG
			case 1:
				you.player = PlayerCase.mandu
				com.player = PlayerCase.tuna
				print("Log ViewModel - index 1 - you : \(you.player)") // LOG
			default:
				break
		}
	}
}
