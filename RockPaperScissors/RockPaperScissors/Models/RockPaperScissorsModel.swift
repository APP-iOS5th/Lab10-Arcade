// MARK: - Enum
enum RPSGamePlayerCase {
	case tuna, mandu
	var imageName: String {
		switch self {
			case .tuna: return IMAGE_TUNA
			case .mandu: return IMAGE_MANDU
		}
	}
}

enum RPSGameRPSCase: CaseIterable {
	case rock, paper, scissors
	var tag: Int {
		switch self {
			case .rock: return 101
			case .paper: return 102
			case .scissors: return 103
		}
	}
	
	var imageNamePrefix: String {
		switch self {
			case .rock: return "RPS-Rock"
			case .paper: return "RPS-Paper"
			case .scissors: return "RPS-Scissors"
		}
	}
	
	var imageNameUp: String {
		return self.imageNamePrefix + "-Up"
	}
	var imageNameDown: String {
		return self.imageNamePrefix + "-Down"
	}
}

enum RPSGameOutcomeCase: String {
	case draw = "DRAW"
	case win = "WIN"
	case lose = "LOSE"
	
	
	var colorName: String {
		switch self {
			case .draw: return "RPS/RPS-Color-Draw"
			case .win: return "RPS/RPS-Color-Win"
			case .lose: return "RPS/RPS-Color-Lose"
		}
	}
}

// MARK: - Model
struct RPSGamePlayerModel {
	typealias Player = RPSGamePlayerCase
	
	private(set) var you: Player
	private(set) var com: Player
	
	mutating func update(you: Player, com: Player) {
		self.you = you
		self.com = com
	}
}

struct RPSGameRPSModel {
	typealias RPS = RPSGameRPSCase
	
	private(set) var you: RPS?
	private(set) var com: RPS?
	
	mutating func update(you: RPS?, com: RPS?) {
		self.you = you
		self.com = com
	}
}

struct RPSGameOutcomeModel {
	typealias Outcome = RPSGameOutcomeCase
	
	private(set) var you: Outcome?
	private(set) var com: Outcome?
	
	mutating func update(you: Outcome?, com: Outcome?) {
		self.you = you
		self.com = com
	}
}
