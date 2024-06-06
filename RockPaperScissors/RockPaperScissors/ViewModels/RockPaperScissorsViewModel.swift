class RockPaperScissorsViewModel {
	typealias PlayerCase = RPSGamePlayerCase
	typealias RPSCase = RPSGameRockPaperScissorsCase
	typealias ResultCase = RPSGameResultCase
	
	static let shared = RockPaperScissorsViewModel()
	private init () {}
	
	
	let you = RPSGameState(
		//TODO: 초기값 고민중
		player: PlayerCase.tuna,
		rps: RPSCase.paper,
		result: ResultCase.draw
	)
	
	let com = RPSGameState(
		//TODO: 초기값 고민중
		player: PlayerCase.mandu,
		rps: RPSCase.paper,
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
