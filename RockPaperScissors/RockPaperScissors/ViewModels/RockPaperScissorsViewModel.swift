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
	var oldSelectRPSImageAnimation: ((_ old: Int) -> Void)?
	var youSelectRPSImageAnimation: ((_ new: Int) -> Void)?
	var youOutcomeLabelDidChange: ((_ text: String, _ color: String) -> Void)?
	var comOutcomeLabelDidChange: ((_ text: String, _ color: String) -> Void)?

	var player = PlayerModel() {
		didSet {
			charactersImageDidChange?(
				player.you?.imageName ?? "",
				player.com?.imageName ?? "")
		}
	}
	
	var rps = RPSModel() {
		didSet(old) {
			oldSelectRPSImageAnimation?(old.you?.tag ?? 0)
			youSelectRPSImageAnimation?(rps.you?.tag ?? 0)
			youSelectRPSImageDidChange?(rps.you?.imageNameUp ?? "N/A")
			
			rps.com = RPS.allCases.randomElement()
			comSelectRPSImageDidChange?(rps.com?.imageNameDown ?? "N/A")
			
			outcomeRPS()
		}
	}
	
	var outcome = OutcomeModel() {
		didSet {
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
		player.you = .tuna
		player.com = .mandu
		rps.you = nil
		rps.com = nil
		outcome.you = nil
		outcome.com = nil
	}
	
	func selectPlayer(_ index: Int) {
		switch index {
			case 0:
				player.you = .tuna
				player.com = .mandu
			case 1:
				player.you = .mandu
				player.com = .tuna
			default: break
		}
	}
	
	func outcomeRPS() {
		switch (rps.you, rps.com) {
			case (.rock, .rock), (.paper, .paper), (.scissors, .scissors):
				outcome.you = .draw
				outcome.com = .draw
			case (.rock, .scissors), (.paper, .rock), (.scissors, .paper):
				outcome.you = .win
				outcome.com = .lose
			case (.rock, .paper), (.paper, .scissors), (.scissors, .rock):
				outcome.you = .lose
				outcome.com = .win
			default: break
		}
	}
	
}
