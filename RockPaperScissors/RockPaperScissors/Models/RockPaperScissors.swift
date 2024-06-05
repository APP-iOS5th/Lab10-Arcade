// gameState 클래스로 com, your 하나씩 객체 생성하는게 나을지도?

// MARK: - Player
enum RPSGamePlayerCase { case tuna, mandu }
class RPSGamePlayer {
	typealias PlayerCase = RPSGamePlayerCase
	
	var your: PlayerCase = PlayerCase.tuna
	var com: PlayerCase = PlayerCase.mandu
}

// MARK: - RockPaperScissors
enum RPSGameRockPaperScissorsCase { case rock, paper, scissors }
class RPSGameRockPaperScissors {
	typealias RPSCase = RPSGameRockPaperScissorsCase
	
	var your: RPSCase = RPSCase.rock
	var com: RPSCase = RPSCase.scissors
}

// MARK: - GameResult
enum RPSGameResultCase { case win, lose }
class RPSGameResult {
	typealias ResultCase = RPSGameResultCase
	
	var your: ResultCase = ResultCase.lose
	var com: ResultCase = ResultCase.win
}
