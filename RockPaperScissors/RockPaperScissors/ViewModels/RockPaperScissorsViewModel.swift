class RockPaperScissorsViewModel {
	typealias Player = RPSGamePlayerCase
	typealias RPS = RPSGameRPSCase
	typealias ResultCase = RPSGameOutcomeCase
	
	typealias PlayerModel = RPSGamePlayerModel
	typealias RPSModel = RPSGameRPSModel
	typealias ResultModel = RPSGameOutcomeModel
	
	static let shared = RockPaperScissorsViewModel()
	private init () { print("Init - RockPaperScissorsViewModel") }
	
	var charactersImageDidChange: ((_ you: String, _ com: String) -> Void)?
	var youSelectRPSImageDidChange: ((_ you: String) -> Void)?
	var comSelectRPSImageDidChange: ((_ com: String) -> Void)?
	var oldSelectRPSImageAnimation: ((_ old: Int) -> Void)?
	var youSelectRPSImageAnimation: ((_ new: Int) -> Void)?
	var youResultLabelDidChange: (() -> Void)?
	
	var player = PlayerModel() {
		didSet {
			charactersImageDidChange?(
				player.you?.named() ?? "",
				player.com?.named() ?? "")
		}
	}
	
	var rps = RPSModel() {
		didSet(old) {
			oldSelectRPSImageAnimation?(old.you?.rawValue ?? 0)
			youSelectRPSImageAnimation?(rps.you?.rawValue ?? 0)
			youSelectRPSImageDidChange?(
				(rps.you?.named() ?? "") + SUFFIX_UP)
			
			rps.com = RPS.allCases.randomElement()
			comSelectRPSImageDidChange?(
				(rps.com?.named() ?? "") + SUFFIX_DOWN)
		}
	}
	
	var result = ResultModel() {
		didSet { 
			youResultLabelDidChange?()
		}
	}
	
}

extension RockPaperScissorsViewModel {
	func initPlayerState() {
		player.you = .tuna
		player.com = .mandu
		rps.you = nil
		rps.com = nil
		result.you = nil
	}
	
	func selectedPlayer(_ index: Int) {
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
	
	func compareRPS() {
		switch (rps.you, rps.you) {
			case (.rock, .rock), (.paper, .paper), (.scissors, .scissors):
				result.you = .draw
			case (.rock, .scissors), (.paper, .rock), (.scissors, .paper):
				result.you = .win
			case (.rock, .paper), (.paper, .scissors), (.scissors, .rock):
				result.you = .lose
			default: break
		}
	}
	
}
