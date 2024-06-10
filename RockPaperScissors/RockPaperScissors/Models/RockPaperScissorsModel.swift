// MARK: - Enum
enum RPSGameCharacterCase: String {
	case tuna, mandu
	
	var imageName: String {
		let prefix = "RPS/image-"
		return prefix + self.rawValue
	}
}

enum RPSGameRPSCase: String, CaseIterable {
	case rock, paper, scissors
	
	var imageNamePrefix: String {
		let prefix = "RPS/image-"
		switch self {
			case .rock: return prefix + self.rawValue
			case .paper: return prefix + self.rawValue
			case .scissors: return prefix + self.rawValue
		}
	}
	var imageNameUp: String {
		let suffix = "-up"
		return self.imageNamePrefix + suffix
	}
	var imageNameDown: String {
		let suffix = "-down"
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
		self.rawValue.uppercased()
	}
	
	var colorName: String {
		let prefix = "RPS/color-"
		return prefix + self.rawValue
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
