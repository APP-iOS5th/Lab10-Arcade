import UIKit

// MARK: - func - view location
extension RockPaperScissorsViewController {
	func locationLeft(_ target: UIView?) {
		let move = -(view.bounds.width)
		
		let t2 = CGAffineTransform(translationX: move, y: 0)
		let tConcat = target?.transform.concatenating(t2)
		target?.transform = tConcat!
	}
	
	func locationRightEnd(_ target: UIView?) {
		let move = (view.bounds.width) * 3
		
		let t2 = CGAffineTransform(translationX: move, y: 0)
		let tConcat = target?.transform.concatenating(t2)
		target?.transform = tConcat!
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
	
//	func locationInit(_ target: UIView?) {
//		let tConcat = CGAffineTransform.identity
//		target?.transform = tConcat
//	}
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
		self.locationLeft(self.youCharacterImage)
		self.locationLeft(self.youRockImage)
		self.locationLeft(self.youPaperImage)
		self.locationLeft(self.youScissorsImage)
		
		// viewGroup3
		self.locationLeft(self.restartButton)
		self.locationLeft(self.youSelectedRPSImage)
		self.locationLeft(self.comSelectedRPSImage)
		self.locationLeft(self.youResult)
		self.locationLeft(self.comResult)
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
		self.locationLeft(self.selectButton)
		// self.locationLeft(self.gameBoardWindow)
		// self.locationLeft(self.comCharacterImage)
		self.locationLeft(self.comRockImage)
		self.locationLeft(self.comPaperImage)
		self.locationLeft(self.comScissorsImage)
		// self.locationLeft(self.youCharacterImage)
		self.locationLeft(self.youRockImage)
		self.locationLeft(self.youPaperImage)
		self.locationLeft(self.youScissorsImage)
		
		// viewGroup3
		self.locationLeft(self.restartButton)
		self.locationLeft(self.youSelectedRPSImage)
		self.locationLeft(self.comSelectedRPSImage)
		self.locationLeft(self.youResult)
		self.locationLeft(self.comResult)
	}
	func locationRightEndGroup2() {
		// viewGroup2
		self.locationRightEnd(self.selectButton)
		// self.locationRightEnd(self.gameBoardWindow)
		// self.locationRightEnd(self.comCharacterImage)
		self.locationRightEnd(self.comRockImage)
		self.locationRightEnd(self.comPaperImage)
		self.locationRightEnd(self.comScissorsImage)
		// self.locationRightEnd(self.youCharacterImage)
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
		
		// viewGroup3
		self.locationLeft(self.restartButton)
		self.locationLeft(self.youSelectedRPSImage)
		self.locationLeft(self.comSelectedRPSImage)
		self.locationLeft(self.youResult)
		self.locationLeft(self.comResult)
	}
	func locationRightEndGroup3() {
		// viewGorup2 RightEnd
		self.locationRightEnd(self.gameBoardWindow)
		self.locationRightEnd(self.comCharacterImage)
		self.locationRightEnd(self.youCharacterImage)
		
		// viewGorup2 Left
		self.locationLeft(self.gameBoardWindow)
		self.locationLeft(self.comCharacterImage)
		self.locationLeft(self.youCharacterImage)
		
		// viewGroup3
		self.locationRightEnd(self.restartButton)
		self.locationRightEnd(self.youSelectedRPSImage)
		self.locationRightEnd(self.comSelectedRPSImage)
		self.locationRightEnd(self.youResult)
		self.locationRightEnd(self.comResult)
	}
}

// MARK: - action selector
extension RockPaperScissorsViewController {
	@objc func gameStart() {
		UIView.animate(withDuration: 0.5, animations: {
			self.locationLeftGroup1()
		}, completion: {_ in
			self.locationRightEndGroup1()
		})
	}
	
	@objc func gameRpsSelect() {
		UIView.animate(withDuration: 0.5, animations: {
			self.locationLeftGroup2()
		}, completion: {_ in
			self.locationRightEndGroup2()
		})
	}
	
	@objc func gameRestart() {
		UIView.animate(withDuration: 0.5, animations: {
			self.locationLeftGroup3()
		}, completion: {_ in
			self.locationRightEndGroup3()
			rpsViewModel.shared.initPlayerState()
		})
	}
}



//
//// MARK: - View Hidden (now not use)
//extension RockPaperScissorsViewController {
//	func hiddenSetup01(_ value: Bool) {
//		startButton.isHidden = value
//		optionWindow.isHidden = value
//		optionWindowSegControl.isHidden = value
//		optionWindowImage0.isHidden = value
//		optionWindowImage1.isHidden = value
//		descriptionWindow.isHidden = value
//		descriptionWindowTitle.isHidden = value
//		descriptionWindowContent.isHidden = value
//	}
//	
//	func alphaSetup02(_ value: CGFloat) {
//		selectButton.alpha = value
//	}
//	
//	func hiddenSetup02(_ value: Bool) {
//		selectButton.isHidden = value
//	}
//}
