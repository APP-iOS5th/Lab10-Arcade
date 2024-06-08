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
	
	func named() -> String {
		switch self {
			case .rock: return IMAGE_RPS_ROCK
			case .paper: return IMAGE_RPS_PAPER
			case .scissors: return IMAGE_RPS_SCISSORS
		}
	}
}
enum RPSGameOutcomeCase: String {
	case win = "WIN"
	case lose = "LOSE"
	case draw = "DRAW"
}

// MARK: - Model
struct RPSGamePlayerModel {
	typealias Player = RPSGamePlayerCase
	
	var you:Player?
	var com:Player?
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
