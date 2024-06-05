// MARK: - Enum
enum RPSGamePlayerCase { case tuna, mandu }
enum RPSGameRockPaperScissorsCase { case rock, paper, scissors }
enum RPSGameResultCase { case draw, win, lose }

// MARK: - Class
class RPSGameState {
	typealias PlayerCase = RPSGamePlayerCase
	typealias RPSCase = RPSGameRockPaperScissorsCase
	typealias ResultCase = RPSGameResultCase

	var player: PlayerCase
	var rps: RPSCase
	var result: ResultCase
	
	init(player: PlayerCase, rps: RPSCase, result: ResultCase) {
		self.player = player
		self.rps = rps
		self.result = result
	}
}
