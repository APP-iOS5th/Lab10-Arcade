class RockPaperScissorsViewModel {
	typealias Player = RPSGamePlayerCase
	typealias RPS = RPSGameRockPaperScissorsCase
	typealias ResultCase = RPSGameResultCase
	
	static let shared = RockPaperScissorsViewModel()
	private init () { print("Init - RockPaperScissorsViewModel") }
	
	var charactersImageDidChange: ((_ youImageName: String, _ comImageName: String) -> Void)?
	var youSelectRPSImageDidChange: ((_ imageName: String) -> Void)?
	var comSelectRPSImageDidChange: ((_ imageName: String) -> Void)?
	var oldSelectRPSImageAnimation: ((_ oldTag: Int) -> Void)?
	var youSelectRPSImageAnimation: ((_ newTag: Int) -> Void)?
	
	var player = PlayerModel() {
		didSet {
			charactersImageDidChange?(
				player.you?.named() ?? "",
				player.com?.named() ?? "")
		}
	}
	
	var youRPS = RPSModel() {
		didSet(oldRPS) {
			oldSelectRPSImageAnimation?(oldRPS.select?.rawValue ?? 0)
			youSelectRPSImageAnimation?(youRPS.select?.rawValue ?? 0)
			
			youSelectRPSImageDidChange?(
				(youRPS.select?.named() ?? "") + SUFFIX_UP)
			comRPS.select = RPS.allCases.randomElement()
		}
	}
	
	var comRPS = RPSModel() {
		didSet {
			comSelectRPSImageDidChange?(
				(comRPS.select?.named() ?? "") + SUFFIX_DOWN)
		}
	}
	
}

extension RockPaperScissorsViewModel {
	func initPlayerState() {
		player.you = .tuna
		player.com = .mandu
		youRPS.select = nil
		comRPS.select = nil
	}
	
	func selectedPlayer(_ index: Int) {
		switch index {
			case 0:
				player.you = .tuna
				player.com = .mandu
			case 1:
				player.you = .mandu
				player.com = .tuna
			default:
				break
		}
	}
	
}
