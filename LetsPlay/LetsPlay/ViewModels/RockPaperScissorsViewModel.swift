import Foundation

class RockPaperScissorsViewModel {
	typealias GameModel = RPSGameStateModel
	typealias PlayerModel = RPSGamePlayerModel
	typealias RPSModel = RPSGameRPSModel
	typealias OutcomeModel = RPSGameOutcomeModel

	typealias RPS = RPSGameRPSCase
	
	init() {
		NSLog("=== init - RockPaperScissorsViewModel ===")
	}
	
	// MARK: Binding Closure
	var readyToConfirmAction: (() -> Void)?
	var readyToRestartAction: (() -> Void)?
	var readyToStartAction: (() -> Void)?
	var charactersImageDidChange: ((_ you: String, _ com: String) -> Void)?
	var gameBoardDescriptionHiddenAnimation: ((Bool) -> Void)?
	var youSelectRPSImageDidChange: ((String) -> Void)?
	var comSelectRPSImageDidChange: ((String) -> Void)?
	var youOldSelectRPSImageAnimation: ((_ old: Int) -> Void)?
	var youNewSelectRPSImageAnimation: ((_ new: Int) -> Void)?
	var youOutcomeLabelDidChange: ((_ text: String, _ color: String) -> Void)?
	var comOutcomeLabelDidChange: ((_ text: String, _ color: String) -> Void)?
	
	// MARK: Property
	private(set) var game = GameModel(state: .readyToStart) {
		didSet { 
			NSLog("= game - didSet - state : \(game.state) =")
			switch game.state {
				case .readyToConfirm: readyToConfirmAction?()
				case .readyToRestart: readyToRestartAction?()
				case .readyToStart: readyToStartAction?()
			}
		}
	}
	private(set) var player = PlayerModel(you: .mandu, com: .tuna) {
		didSet {
			NSLog("player - didSet - you : \(player.you)")
			
			let youImageName = player.you.imageName
			let comImageName = player.com.imageName
			charactersImageDidChange?(youImageName, comImageName)
		}
	}
	private(set) var rps = RPSModel(you: nil, com: nil) {
		didSet(old) {
			NSLog("rps - didSet - you : \(rps.you?.rawValue ?? "")")
			
			let isReadyToConfirm: Bool = (game.state == .readyToConfirm)
			gameBoardDescriptionHiddenAnimation?(isReadyToConfirm)
			
			let oldTag = old.you?.tag ?? 0
			let newTag = rps.you?.tag ?? 0
			youOldSelectRPSImageAnimation?(oldTag)
			youNewSelectRPSImageAnimation?(newTag)

			let comImageName = rps.com?.imageNameDown ?? "N/A"
			comSelectRPSImageDidChange?(comImageName)
		}
	}
	private(set) var outcome = OutcomeModel(you: nil, com: nil) {
		didSet {
			NSLog("outcome - didSet - you : \(outcome.you?.rawValue ?? "")")
			
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
		NSLog("== initGameData() - Start ==")
		outcome.update(you: nil, com: nil)
		rps.update(you: nil, com: nil)
		player.update(you: .tuna, com: .mandu)
		NSLog("== initGameData() - End ==")
	}
	
	func updatePlayer(_ index: Int) {
		switch index {
			case 0: player.update(you: .tuna, com: .mandu)
			case 1: player.update(you: .mandu, com: .tuna)
			default: break
		}
	}
	
	func updateSelectRPS(_ tag: Int) {
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
	
	func updateGameStateNext() {
		game.updateNext()
	}
	
}
