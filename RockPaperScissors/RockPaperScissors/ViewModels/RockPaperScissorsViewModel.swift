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
	var gameBoardDescriptionHiddenAnimation: (() -> Void)?
	var youOldSelectRPSImageAnimation: ((_ old: Int) -> Void)?
	var youNewSelectRPSImageAnimation: ((_ new: Int) -> Void)?
	var youOutcomeLabelDidChange: ((_ text: String, _ color: String) -> Void)?
	var comOutcomeLabelDidChange: ((_ text: String, _ color: String) -> Void)?
	
	// MARK: Property
	private(set) var player = PlayerModel(you: .mandu, com: .tuna) {
		didSet {
			print("player - didSet")
			let you = player.you.imageName
			let com = player.com.imageName
			charactersImageDidChange?(you, com)
		}
	}
	private(set) var rps = RPSModel(you: nil, com: nil) {
		didSet(old) {
			print("rps - didSet")
			if(rps.you != nil) {
				gameBoardDescriptionHiddenAnimation?()
			}
			
			let oldTag = old.you?.tag ?? 0
			let newTag = rps.you?.tag ?? 0
			youOldSelectRPSImageAnimation?(oldTag)
			youNewSelectRPSImageAnimation?(newTag)

			let youImageName = rps.you?.imageNameUp ?? "N/A"
			let comImageName = rps.com?.imageNameDown ?? "N/A"
			print("you select image - \(youImageName)")
			print("com select image - \(comImageName)")
			youSelectRPSImageDidChange?(youImageName)
			comSelectRPSImageDidChange?(comImageName)
		}
	}
	private(set) var outcome = OutcomeModel(you: nil, com: nil) {
		didSet {
			print("outcome - didSet")
			let youText = outcome.you?.text ?? "N/A"
			let youColorName = outcome.you?.colorName ?? "N/A"
			youOutcomeLabelDidChange?(youText, youColorName)
			
			let comText = outcome.com?.text ?? "N/A"
			let comColorName = outcome.com?.colorName ?? "N/A"
			comOutcomeLabelDidChange?(comText, comColorName)
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
	
	func selectRPS(_ tag: Int) {
		switch tag {
			case RPS.rock.tag: rps.update(
				you: RPS.rock, com: RPS.allCases.randomElement())
			case RPS.paper.tag: rps.update(
				you: RPS.paper, com: RPS.allCases.randomElement())
			case RPS.scissors.tag: rps.update(
				you: RPS.scissors, com: RPS.allCases.randomElement())
			default: break
		}
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
