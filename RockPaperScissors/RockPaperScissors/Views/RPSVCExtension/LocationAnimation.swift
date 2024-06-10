import UIKit

// MARK: - func - view location
extension RockPaperScissorsViewController {
	func locationLeft(_ target: UIView) {
		let move = -(view.bounds.width)
		
		let t2 = CGAffineTransform(translationX: move, y: 0)
		let tConcat = target.transform.concatenating(t2)
		target.transform = tConcat
	}
	
	func locationRightEnd(_ target: UIView) {
		let move = (view.bounds.width) * 3
		
		let t2 = CGAffineTransform(translationX: move, y: 0)
		let tConcat = target.transform.concatenating(t2)
		target.transform = tConcat
	}
	
	func locationTop(_ target: UIView?) {
		let t2 = CGAffineTransform(translationX: 0, y: -30)
		let tConcat = target?.transform.concatenating(t2)
		target?.transform = tConcat!
	}
	
	func locationBottom(_ target: UIView?) {
		let t2 = CGAffineTransform(translationX: 0, y: 30)
		let tConcat = target?.transform.concatenating(t2)
		target?.transform = tConcat!
	}
}

// MARK: - SetupLocation Function
extension RockPaperScissorsViewController {
	func locationLeftGroup1() {
		// viewGroup1
		self.locationLeft(self.startButton)
		self.locationLeft(self.optionWindow)
		self.locationLeft(self.optionWindowSegControl)
		self.locationLeft(self.optionWindowImage0)
		self.locationLeft(self.optionWindowImage1)
		self.locationLeft(self.descriptionWindow)
		self.locationLeft(self.descriptionWindowTitle)
		self.locationLeft(self.descriptionWindowContent)
		
		// viewGroup2
		self.locationLeft(self.selectButton)
		self.locationLeft(self.gameBoardWindow)
		self.locationLeft(self.comCharacterImage)
		self.locationLeft(self.comRockImage)
		self.locationLeft(self.comPaperImage)
		self.locationLeft(self.comScissorsImage)
		self.locationLeft(self.comPlayerLabel)
		self.locationLeft(self.youCharacterImage)
		self.locationLeft(self.youRockImage)
		self.locationLeft(self.youPaperImage)
		self.locationLeft(self.youScissorsImage)
		self.locationLeft(self.youPlayerLabel)
		
		// viewGroup3
		self.locationLeft(self.restartButton)
		self.locationLeft(self.youSelectedRPSImage)
		self.locationLeft(self.comSelectedRPSImage)
		self.locationLeft(self.youOutcomeLabel)
		self.locationLeft(self.comOutcomeLabel)
	}
	func locationRightEndGroup1() {
		// viewGroup1
		self.locationRightEnd(self.startButton)
		self.locationRightEnd(self.optionWindow)
		self.locationRightEnd(self.optionWindowSegControl)
		self.locationRightEnd(self.optionWindowImage0)
		self.locationRightEnd(self.optionWindowImage1)
		self.locationRightEnd(self.descriptionWindow)
		self.locationRightEnd(self.descriptionWindowTitle)
		self.locationRightEnd(self.descriptionWindowContent)
	}
	
	func locationLeftGroup2() {
		// viewGroup1
		self.locationLeft(self.startButton)
		self.locationLeft(self.optionWindow)
		self.locationLeft(self.optionWindowSegControl)
		self.locationLeft(self.optionWindowImage0)
		self.locationLeft(self.optionWindowImage1)
		self.locationLeft(self.descriptionWindow)
		self.locationLeft(self.descriptionWindowTitle)
		self.locationLeft(self.descriptionWindowContent)
		
		// viewGroup2
		// 제외 (gameBoardWindow, comCharacterImage, youCharacterImage, comPlayerLabel, youPlayerLabel)
		self.locationLeft(self.selectButton)
		self.locationLeft(self.comRockImage)
		self.locationLeft(self.comPaperImage)
		self.locationLeft(self.comScissorsImage)
		self.locationLeft(self.youRockImage)
		self.locationLeft(self.youPaperImage)
		self.locationLeft(self.youScissorsImage)
		
		// viewGroup3
		self.locationLeft(self.restartButton)
		self.locationLeft(self.youSelectedRPSImage)
		self.locationLeft(self.comSelectedRPSImage)
		self.locationLeft(self.youOutcomeLabel)
		self.locationLeft(self.comOutcomeLabel)
	}
	func locationRightEndGroup2() {
		// viewGroup2
		// 제외 (gameBoardWindow, comCharacterImage, youCharacterImage, comPlayerLabel, youPlayerLabel)
		self.locationRightEnd(self.selectButton)
		self.locationRightEnd(self.comRockImage)
		self.locationRightEnd(self.comPaperImage)
		self.locationRightEnd(self.comScissorsImage)
		self.locationRightEnd(self.youRockImage)
		self.locationRightEnd(self.youPaperImage)
		self.locationRightEnd(self.youScissorsImage)
	}
	
	func locationLeftGroup3() {
		// viewGroup1
		self.locationLeft(self.startButton)
		self.locationLeft(self.optionWindow)
		self.locationLeft(self.optionWindowSegControl)
		self.locationLeft(self.optionWindowImage0)
		self.locationLeft(self.optionWindowImage1)
		self.locationLeft(self.descriptionWindow)
		self.locationLeft(self.descriptionWindowTitle)
		self.locationLeft(self.descriptionWindowContent)
		
		// viewGroup2
		self.locationLeft(self.selectButton)
		self.locationLeft(self.gameBoardWindow)
		self.locationLeft(self.comCharacterImage)
		self.locationLeft(self.comRockImage)
		self.locationLeft(self.comPaperImage)
		self.locationLeft(self.comScissorsImage)
		self.locationLeft(self.youCharacterImage)
		self.locationLeft(self.youRockImage)
		self.locationLeft(self.youPaperImage)
		self.locationLeft(self.youScissorsImage)
		self.locationLeft(self.comPlayerLabel)
		self.locationLeft(self.youPlayerLabel)
		
		// viewGroup3
		self.locationLeft(self.restartButton)
		self.locationLeft(self.youSelectedRPSImage)
		self.locationLeft(self.comSelectedRPSImage)
		self.locationLeft(self.youOutcomeLabel)
		self.locationLeft(self.comOutcomeLabel)
	}
	func locationRightEndGroup3() {
		// viewGorup2 RightEnd
		self.locationRightEnd(self.gameBoardWindow)
		self.locationRightEnd(self.comCharacterImage)
		self.locationRightEnd(self.youCharacterImage)
		self.locationRightEnd(self.comPlayerLabel)
		self.locationRightEnd(self.youPlayerLabel)
		
		// viewGorup2 Left (viewGorup2의 기본 위치로 이동)
		self.locationLeft(self.gameBoardWindow)
		self.locationLeft(self.comCharacterImage)
		self.locationLeft(self.youCharacterImage)
		self.locationLeft(self.comPlayerLabel)
		self.locationLeft(self.youPlayerLabel)
		
		// viewGroup3
		self.locationRightEnd(self.restartButton)
		self.locationRightEnd(self.youSelectedRPSImage)
		self.locationRightEnd(self.comSelectedRPSImage)
		self.locationRightEnd(self.youOutcomeLabel)
		self.locationRightEnd(self.comOutcomeLabel)
	}
}
