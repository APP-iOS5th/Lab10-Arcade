// MARK: - Enum
enum RPSGameStateCase {
	case readyToStart, readyToSelect, readyToRestart
}

enum RPSGameCharacterCase: String {
	case tuna, mandu
	
	var imageName: String {
		let prefix = "RPS/image-"
		return prefix + self.rawValue
	}
}

enum RPSGameRPSCase: String, CaseIterable {
	case rock, paper, scissors
	
	private var imageNamePrefix: String {
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
	
	var move: Int {
		switch self {
			case .rock: return 80
			case .paper: return 0
			case .scissors: return -80
		}
	}
}

enum RPSGameOutcomeCase: String {
	case draw, win, lose
	
	var text: String {
		return self.rawValue.uppercased()
	}
	
	var colorName: String {
		let prefix = "RPS/color-"
		return prefix + self.rawValue
	}
}

// MARK: - Model
struct RPSGameStateModel {
	typealias State = RPSGameStateCase
	
	private(set) var state: State

	mutating func updateNext() {
		switch state {
			case .readyToStart: self.state = .readyToSelect
			case .readyToSelect: self.state = .readyToRestart
			case .readyToRestart: self.state = .readyToStart
		}
	}
}

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
