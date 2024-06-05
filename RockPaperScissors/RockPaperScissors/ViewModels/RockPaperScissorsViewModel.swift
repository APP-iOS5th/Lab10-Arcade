class RockPaperScissorsViewModel {
	typealias PlayerCase = RPSGamePlayerCase
	typealias RPSCase = RPSGameRockPaperScissorsCase
	typealias ResultCase = RPSGameResultCase
	
	static let sharedData = RockPaperScissorsViewModel()
	private init () {}
	
	let gamePlayer = RPSGamePlayer()
	let gameRockPaperScissors = RPSGameRockPaperScissors()
	let gameResult = RPSGameResult()
}

extension RockPaperScissorsViewModel {
	func selectedPlayer(_ index: Int) {
		switch index {
			case 0:
				gamePlayer.your = PlayerCase.tuna
				gamePlayer.com = PlayerCase.mandu
				print("Log ViewModel - index 0 \(gamePlayer.your)") // LOG
			case 1:
				gamePlayer.your = PlayerCase.mandu
				gamePlayer.com = PlayerCase.tuna
				print("Log ViewModel - index 1 \(gamePlayer.your)") // LOG
			default:
				break
		}
	}
}
