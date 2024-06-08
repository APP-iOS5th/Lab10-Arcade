// MARK: - Enum
enum RPSGamePlayerCase {
	case tuna, mandu
	func named() -> String {
		switch self {
			case .tuna: return IMAGE_TUNA
			case .mandu: return IMAGE_MANDU
		}
	}
}

enum RPSGameRPSCase: Int, CaseIterable {
	case rock = 101
	case paper = 102
	case scissors = 103
	
	func tag() -> Int {
		switch self {
			case .rock: return 101
			case .paper: return 102
			case .scissors: return 103
		}
	}
	
	func prefix() -> String {
		switch self {
			case .rock: return IMAGE_RPS_ROCK
			case .paper: return IMAGE_RPS_PAPER
			case .scissors: return IMAGE_RPS_SCISSORS
		}
	}
	
	func upImageName() -> String {
		switch self {
			case .rock: return IMAGE_RPS_ROCK + SUFFIX_UP
			case .paper: return IMAGE_RPS_PAPER + SUFFIX_UP
			case .scissors: return IMAGE_RPS_SCISSORS + SUFFIX_UP
		}
	}
	
	func downImageName() -> String {
		switch self {
			case .rock: return IMAGE_RPS_ROCK + SUFFIX_DOWN
			case .paper: return IMAGE_RPS_PAPER + SUFFIX_DOWN
			case .scissors: return IMAGE_RPS_SCISSORS + SUFFIX_DOWN
		}
	}
}

enum RPSGameOutcomeCase: String {
	case win = "WIN"
	case lose = "LOSE"
	case draw = "DRAW"
	
	func text() -> String {
		return "YOU\n" + self.rawValue
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
}
