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
	case win = "WIN"
	case lose = "LOSE"
	case draw = "DRAW"
	
	var text: String {
		return self.rawValue
	}
	
	var colorName: String {
		switch self {
			case .win: return "RPS-Color-Win"
			case .lose: return "RPS-Color-Lose"
			case .draw: return "RPS-Color-Draw"
		}
	}
}

// MARK: - Model
struct RPSGamePlayerModel {
	typealias Player = RPSGamePlayerCase
	
	var you: Player?
	var com: Player?
}

struct RPSGameRPSModel {
	typealias RPS = RPSGameRPSCase
	
	var you: RPS?
	var com: RPS?
}

struct RPSGameOutcomeModel {
	typealias Outcome = RPSGameOutcomeCase
	
	var you: Outcome?
	var com: Outcome?
}
