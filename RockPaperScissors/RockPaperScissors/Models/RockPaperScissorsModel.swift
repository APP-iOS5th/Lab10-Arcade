// MARK: - Enum
enum RPSGameCharacterCase {
	case tuna, mandu
	var imageName: String {
		switch self {
			case .tuna: return IMAGE_TUNA
			case .mandu: return IMAGE_MANDU
		}
	}
}

enum RPSGameRPSCase: String, CaseIterable {
	case rock = "Rock"
	case paper = "Paper"
	case scissors = "Scissors"
	
	var imageNamePrefix: String {
		let prefix = "RPS/RPS-"
		switch self {
			case .rock: return prefix + self.rawValue
			case .paper: return prefix + self.rawValue
			case .scissors: return prefix + self.rawValue
		}
	}
	
	var imageNameUp: String {
		let suffix = "-Up"
		return self.imageNamePrefix + suffix
	}
	var imageNameDown: String {
		let suffix = "-Down"
		return self.imageNamePrefix + suffix
	}
	
	var tag: Int {
		switch self {
			case .rock: return 101
			case .paper: return 102
			case .scissors: return 103
		}
	}
}

enum RPSGameOutcomeCase: String {
	case draw, win, lose
	
	var text: String {
		switch self {
			case .draw: return "DRAW"
			case .win: return "WIN"
			case .lose: return "LOSE"
		}
	}
	
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
	typealias Character = RPSGameCharacterCase
	
	private(set) var you: Character
	private(set) var com: Character
	
	mutating func update(you: Character, com: Character) {
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
