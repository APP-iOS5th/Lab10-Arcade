class RockPaperScissorsViewModel {
	typealias PlayerModel = RPSGamePlayerModel
	typealias RPSModel = RPSGameRPSModel
	typealias OutcomeModel = RPSGameOutcomeModel
	
	typealias RPS = RPSGameRPSCase
	
	init() {
		print("init - RockPaperScissorsViewModel")
	}
	
	// MARK: Binding Clousre
	var charactersImageDidChange: ((_ you: String, _ com: String) -> Void)?
	var youSelectRPSImageDidChange: ((String) -> Void)?
	var comSelectRPSImageDidChange: ((String) -> Void)?
	var youOldSelectRPSImageAnimation: ((_ old: Int) -> Void)?
	var youNewSelectRPSImageAnimation: ((_ new: Int) -> Void)?
	var youOutcomeLabelDidChange: ((_ text: String, _ color: String) -> Void)?
	var comOutcomeLabelDidChange: ((_ text: String, _ color: String) -> Void)?
	var gameBoardDescriptionHiddenAnimation: (() -> Void)?
	
	// MARK: Property
	private(set) var player = PlayerModel(you: .mandu, com: .tuna) {
		didSet {
			print("player")
			charactersImageDidChange?(
				player.you.imageName, player.com.imageName)
		}
	}
	private(set) var rps = RPSModel(you: nil, com: nil) {
		didSet(old) {
			print("rps")
			if(rps.you != nil) {
				gameBoardDescriptionHiddenAnimation?()
			}
			
			youOldSelectRPSImageAnimation?(old.you?.tag ?? 0)
			youNewSelectRPSImageAnimation?(rps.you?.tag ?? 0)

			youSelectRPSImageDidChange?(rps.you?.imageNameUp ?? "N/A")
			comSelectRPSImageDidChange?(rps.com?.imageNameDown ?? "N/A")
		}
	}
	private(set) var outcome = OutcomeModel(you: nil, com: nil) {
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

// MARK: - func
extension RockPaperScissorsViewModel {
	func initGameData() {
		player.update(you: .tuna, com: .mandu)
		rps.update(you: nil, com: nil)
		outcome.update(you: nil, com: nil)
	}
	
	func selectPlayer(_ index: Int) {
		switch index {
			case 0: player.update(you: .tuna, com: .mandu)
			case 1: player.update(you: .mandu, com: .tuna)
			default: break
		}
	}
	
	func updateRPS(_ value: RPS) {
		rps.update(you: value, com: RPS.allCases.randomElement())
	}
	
	func updateOutcome() {
		switch (rps.you, rps.com) {
			case (.rock, .rock), (.paper, .paper), (.scissors, .scissors):
				outcome.update(you: .draw, com: .draw)
			case (.rock, .scissors), (.paper, .rock), (.scissors, .paper):
				outcome.update(you: .win, com: .lose)
			case (.rock, .paper), (.paper, .scissors), (.scissors, .rock):
				outcome.update(you: .lose, com: .win)
			default: outcome.update(you: nil, com: nil)
		}
	}
	
}
