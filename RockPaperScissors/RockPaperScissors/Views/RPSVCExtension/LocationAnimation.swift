import UIKit

// MARK: - func - view location
extension RockPaperScissorsViewController {
	func viewLocationLeft(_ target: UIView) {
		let move: CGFloat = -(view.bounds.width)
		
		let t2 = CGAffineTransform(translationX: move, y: 0)
		let tConcat = target.transform.concatenating(t2)
		target.transform = tConcat
	}
	
	func viewLocationRightEnd(_ target: UIView) {
		let move: CGFloat = (view.bounds.width) * 3
		
		let t2 = CGAffineTransform(translationX: move, y: 0)
		let tConcat = target.transform.concatenating(t2)
		target.transform = tConcat
	}
	
	func rpsImageLocationUp(_ target: UIImageView?) {
		let move: CGFloat = -30
		
		let t2 = CGAffineTransform(translationX: 0, y: move)
		let tConcat = target?.transform.concatenating(t2)
		target?.transform = tConcat!
	}
	
	func rpsImageLocationDown(_ target: UIImageView?) {
		let move: CGFloat = 30
		
		let t2 = CGAffineTransform(translationX: 0, y: move)
		let tConcat = target?.transform.concatenating(t2)
		target?.transform = tConcat!
	}
	
	func rpsImageLocationLeft(_ target: UIImageView?) {
		let move: CGFloat = -80
		
		let t2 = CGAffineTransform(translationX: move, y: 0)
		let tConcat = target?.transform.concatenating(t2)
		target?.transform = tConcat!
	}
	
	func rpsImageLocationRight(_ target: UIImageView?) {
		let move: CGFloat = 80
		
		let t2 = CGAffineTransform(translationX: move, y: 0)
		let tConcat = target?.transform.concatenating(t2)
		target?.transform = tConcat!
	}
	
	func rpsImageLocationX(_ target: UIImageView?, move: CGFloat) {
		let t2 = CGAffineTransform(translationX: move, y: 0)
		let tConcat = target?.transform.concatenating(t2)
		target?.transform = tConcat!
	}
}

// MARK: - SetupLocation Function
extension RockPaperScissorsViewController {
	func locationLeftGroup1() {
		// viewGroup1
		self.viewLocationLeft(self.startButton)
		self.viewLocationLeft(self.optionWindow)
		self.viewLocationLeft(self.optionWindowSegControl)
		self.viewLocationLeft(self.optionWindowImage0)
		self.viewLocationLeft(self.optionWindowImage1)
		self.viewLocationLeft(self.descriptionWindow)
		self.viewLocationLeft(self.descriptionWindowTitle)
		self.viewLocationLeft(self.descriptionWindowContent)
		
		// viewGroup2
		self.viewLocationLeft(self.selectButton)
		self.viewLocationLeft(self.gameBoardWindow)
		self.viewLocationLeft(self.gameBoardDescription)
		self.viewLocationLeft(self.comCharacterImage)
		self.viewLocationLeft(self.comRockImage)
		self.viewLocationLeft(self.comPaperImage)
		self.viewLocationLeft(self.comScissorsImage)
		self.viewLocationLeft(self.comPlayerLabel)
		self.viewLocationLeft(self.youCharacterImage)
		self.viewLocationLeft(self.youRockImage)
		self.viewLocationLeft(self.youPaperImage)
		self.viewLocationLeft(self.youScissorsImage)
		self.viewLocationLeft(self.youPlayerLabel)
		
		// viewGroup3
		self.viewLocationLeft(self.restartButton)
		self.viewLocationLeft(self.comSelectedRPSImage)
		self.viewLocationLeft(self.youOutcomeLabel)
		self.viewLocationLeft(self.comOutcomeLabel)
	}
	func locationRightEndGroup1() {
		// viewGroup1
		self.viewLocationRightEnd(self.startButton)
		self.viewLocationRightEnd(self.optionWindow)
		self.viewLocationRightEnd(self.optionWindowSegControl)
		self.viewLocationRightEnd(self.optionWindowImage0)
		self.viewLocationRightEnd(self.optionWindowImage1)
		self.viewLocationRightEnd(self.descriptionWindow)
		self.viewLocationRightEnd(self.descriptionWindowTitle)
		self.viewLocationRightEnd(self.descriptionWindowContent)
	}
	
	
	func locationLeftGroup2() {
		// viewGroup1
		self.viewLocationLeft(self.startButton)
		self.viewLocationLeft(self.optionWindow)
		self.viewLocationLeft(self.optionWindowSegControl)
		self.viewLocationLeft(self.optionWindowImage0)
		self.viewLocationLeft(self.optionWindowImage1)
		self.viewLocationLeft(self.descriptionWindow)
		self.viewLocationLeft(self.descriptionWindowTitle)
		self.viewLocationLeft(self.descriptionWindowContent)
		
		// viewGroup2-1
		self.viewLocationLeft(self.selectButton)
		self.viewLocationLeft(self.comRockImage)
		self.viewLocationLeft(self.comPaperImage)
		self.viewLocationLeft(self.comScissorsImage)
		
		// viewGroup3
		self.viewLocationLeft(self.restartButton)
		self.viewLocationLeft(self.comSelectedRPSImage)
		self.viewLocationLeft(self.youOutcomeLabel)
		self.viewLocationLeft(self.comOutcomeLabel)
	}
	func locationRightEndGroup2() {
		// viewGroup2-1
		self.viewLocationRightEnd(self.selectButton)
		self.viewLocationRightEnd(self.comRockImage)
		self.viewLocationRightEnd(self.comPaperImage)
		self.viewLocationRightEnd(self.comScissorsImage)
		
	}
	
	
	func locationLeftGroup3() {
		// viewGroup1
		self.viewLocationLeft(self.startButton)
		self.viewLocationLeft(self.optionWindow)
		self.viewLocationLeft(self.optionWindowSegControl)
		self.viewLocationLeft(self.optionWindowImage0)
		self.viewLocationLeft(self.optionWindowImage1)
		self.viewLocationLeft(self.descriptionWindow)
		self.viewLocationLeft(self.descriptionWindowTitle)
		self.viewLocationLeft(self.descriptionWindowContent)
		
		// viewGroup2
		self.viewLocationLeft(self.selectButton)
		self.viewLocationLeft(self.gameBoardWindow)
		self.viewLocationLeft(self.gameBoardDescription)
		self.viewLocationLeft(self.comCharacterImage)
		self.viewLocationLeft(self.comRockImage)
		self.viewLocationLeft(self.comPaperImage)
		self.viewLocationLeft(self.comScissorsImage)
		self.viewLocationLeft(self.youCharacterImage)
		self.viewLocationLeft(self.youRockImage)
		self.viewLocationLeft(self.youPaperImage)
		self.viewLocationLeft(self.youScissorsImage)
		self.viewLocationLeft(self.comPlayerLabel)
		self.viewLocationLeft(self.youPlayerLabel)
		
		// viewGroup3
		self.viewLocationLeft(self.restartButton)
		self.viewLocationLeft(self.comSelectedRPSImage)
		self.viewLocationLeft(self.youOutcomeLabel)
		self.viewLocationLeft(self.comOutcomeLabel)
	}
	func locationRightEndGroup3() {
		// viewGorup2-2 RightEnd
		self.viewLocationRightEnd(self.gameBoardWindow)
		self.viewLocationRightEnd(self.gameBoardDescription)
		self.viewLocationRightEnd(self.comCharacterImage)
		self.viewLocationRightEnd(self.youCharacterImage)
		self.viewLocationRightEnd(self.comPlayerLabel)
		self.viewLocationRightEnd(self.youPlayerLabel)
		self.viewLocationRightEnd(self.youRockImage)
		self.viewLocationRightEnd(self.youPaperImage)
		self.viewLocationRightEnd(self.youScissorsImage)
		
		// viewGorup2-2 Left (viewGorup2의 위치로 이동)
		self.viewLocationLeft(self.gameBoardWindow)
		self.viewLocationLeft(self.gameBoardDescription)
		self.viewLocationLeft(self.comCharacterImage)
		self.viewLocationLeft(self.youCharacterImage)
		self.viewLocationLeft(self.comPlayerLabel)
		self.viewLocationLeft(self.youPlayerLabel)
		self.viewLocationLeft(self.youRockImage)
		self.viewLocationLeft(self.youPaperImage)
		self.viewLocationLeft(self.youScissorsImage)
		
		// viewGroup3
		self.viewLocationRightEnd(self.restartButton)
		self.viewLocationRightEnd(self.comSelectedRPSImage)
		self.viewLocationRightEnd(self.youOutcomeLabel)
		self.viewLocationRightEnd(self.comOutcomeLabel)
	}
	
}
