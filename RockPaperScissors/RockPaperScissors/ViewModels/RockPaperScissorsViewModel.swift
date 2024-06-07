class RockPaperScissorsViewModel {
	typealias PlayerCase = RPSGamePlayerCase
	typealias RPSCase = RPSGameRockPaperScissorsCase
	typealias ResultCase = RPSGameResultCase
	
	static let shared = RockPaperScissorsViewModel()
	private init () {}
	
	let you = PlayerState(
		player: PlayerCase.tuna,
		rps: RPSCase.none,
		result: ResultCase.none
	)
	
	let com = PlayerState(
		player: PlayerCase.mandu,
		rps: RPSCase.none,
		result: ResultCase.none
	)
	
}

extension RockPaperScissorsViewModel {
	func initPlayterState() {
		you.player = .tuna
		you.rps = .none
		you.result = .none
		you.rpsPrevSelected = .none
		
		com.player = .mandu
		com.rps = .none
		com.result = .none
		com.rpsPrevSelected = .none
	}
	
	func selectedPlayer(_ index: Int) {
		switch index {
			case 0:
				you.player = PlayerCase.tuna
				com.player = PlayerCase.mandu
			case 1:
				you.player = PlayerCase.mandu
				com.player = PlayerCase.tuna
			default:
				break
		}
	}
	
	
}
