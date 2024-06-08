class RockPaperScissorsViewModel {
	typealias Player = RPSGamePlayerCase
	typealias RPSCase = RPSGameRockPaperScissorsCase
	typealias ResultCase = RPSGameResultCase
	
	static let shared = RockPaperScissorsViewModel()
	private init () {}
	
	var playerImageDidChange: ((String, String) -> Void)?
	var player = PlayerModel() {
		didSet {
			playerImageDidChange?(
				player.you?.named() ?? "",
				player.com?.named() ?? ""
			)
		}
	}
	
	let you = PlayerState(
		player: Player.tuna,
		rps: RPSCase.none,
		result: ResultCase.none
	)
	
	let com = PlayerState(
		player: Player.mandu,
		rps: RPSCase.none,
		result: ResultCase.none
	)
	
}



extension RockPaperScissorsViewModel {
	func initPlayerState() {
		player.you = .tuna
		player.com = .mandu
		
		
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
				player.you = .tuna
				player.com = .mandu
//				you.player = Player.tuna
//				com.player = Player.mandu
			case 1:
				player.you = .mandu
				player.com = .tuna
//				you.player = Player.mandu
//				com.player = Player.tuna
			default:
				break
		}
	}
	
	
}
