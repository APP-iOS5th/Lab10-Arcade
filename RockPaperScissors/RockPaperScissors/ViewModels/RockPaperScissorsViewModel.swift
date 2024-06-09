class RockPaperScissorsViewModel {
	typealias Player = RPSGamePlayerCase
	typealias RPS = RPSGameRPSCase
	typealias Outcome = RPSGameOutcomeCase
	
	typealias PlayerModel = RPSGamePlayerModel
	typealias RPSModel = RPSGameRPSModel
	typealias OutcomeModel = RPSGameOutcomeModel
	
	static let shared = RockPaperScissorsViewModel()
	private init () { print("Init - RockPaperScissorsViewModel") }
	
	var charactersImageDidChange: ((_ you: String, _ com: String) -> Void)?
	var youSelectRPSImageDidChange: ((String) -> Void)?
	var comSelectRPSImageDidChange: ((String) -> Void)?
	var youOldSelectRPSImageAnimation: ((_ old: Int) -> Void)?
	var youSelectRPSImageAnimation: ((_ new: Int) -> Void)?
	var youOutcomeLabelDidChange: ((_ text: String, _ color: String) -> Void)?
	var comOutcomeLabelDidChange: ((_ text: String, _ color: String) -> Void)?

	var player = PlayerModel(you: .mandu, com: .tuna) {
		didSet {
			print("player")
			charactersImageDidChange?(
				player.you.imageName, player.com.imageName)
		}
	}
	
	var rps = RPSModel(you: nil, com: nil) {
		didSet(old) {
			print("rps")
			youOldSelectRPSImageAnimation?(old.you?.tag ?? 0)
			youSelectRPSImageAnimation?(rps.you?.tag ?? 0)
			
			youSelectRPSImageDidChange?(rps.you?.imageNameUp ?? "N/A")
			comSelectRPSImageDidChange?(rps.com?.imageNameDown ?? "N/A")
		}
	}
	
	var outcome = OutcomeModel(you: nil, com: nil) {
		didSet {
			print("outcome")
			youOutcomeLabelDidChange?(
				outcome.you?.rawValue ?? "N/A",
				outcome.you?.colorName ?? "N/A")
			comOutcomeLabelDidChange?(
				outcome.com?.rawValue ?? "N/A",
				outcome.com?.colorName ?? "N/A")
		}
	}
	
}

extension RockPaperScissorsViewModel {
	func initGameData() {
		player.update(you: .tuna, com: .mandu)
		rps.update(you: nil, com: nil)
		outcome.update(you: nil, com: nil)
	}
	
	func selectPlayer(_ index: Int) {
		switch index {
			case 0:
				player.update(you: .tuna, com: .mandu)
			case 1:
				player.update(you: .mandu, com: .tuna)
			default: break
		}
	}
	
	func outcomeRPS() {
		switch (rps.you, rps.com) {
			case (.rock, .rock), (.paper, .paper), (.scissors, .scissors):
				outcome.update(you: .draw, com: .draw)
			case (.rock, .scissors), (.paper, .rock), (.scissors, .paper):
				outcome.update(you: .win, com: .lose)
			case (.rock, .paper), (.paper, .scissors), (.scissors, .rock):
				outcome.update(you: .lose, com: .win)
			default: break
		}
	}
	
}
