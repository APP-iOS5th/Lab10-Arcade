import UIKit

// MARK: - setup - viewGroup3 - GameCount
extension RockPaperScissorsViewController {
	func setupViewGroup3() {
		setupRestartButton()
		setupYouSelectedRPS()
		setupComSelectedRPS()
		setupYouResult()
		setupComResult()
	}
	
	func setupRestartButton() {
		view.addSubview(restartButton)
		let config = configGameStyledButton("RESTART")
		restartButton.configuration = config
		restartButton.addTarget(self, action: #selector(gameRestart), for: .touchUpInside)
		restartButton.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			restartButton.centerXAnchor.constraint(
				equalTo: view.centerXAnchor,
				constant: view.bounds.width * 2),
			restartButton.bottomAnchor.constraint(
				equalTo: view.bottomAnchor,
				constant: -100),
		])
	}
	
	func setupYouSelectedRPS() {
		view.addSubview(youSelectedRPSImage)
		youSelectedRPSImage.image = UIImage(
			named: IMAGE_RPS_PAPER_UP)
		youSelectedRPSImage.contentMode = .scaleAspectFit
		youSelectedRPSImage.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			youSelectedRPSImage.widthAnchor.constraint(
				equalToConstant: 50),
			youSelectedRPSImage.heightAnchor.constraint(
				equalToConstant: 50),
			youSelectedRPSImage.bottomAnchor.constraint(
				equalTo: gameBoardWindow.bottomAnchor,
				constant: -90),
			youSelectedRPSImage.centerXAnchor.constraint(
				equalTo: selectButton.centerXAnchor,
				constant: view.bounds.width),
		])
	}
	
	func setupComSelectedRPS() {
		view.addSubview(comSelectedRPSImage)
		comSelectedRPSImage.image = UIImage(
			named: IMAGE_RPS_PAPER_DOWN)
		comSelectedRPSImage.contentMode = .scaleAspectFit
		comSelectedRPSImage.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			comSelectedRPSImage.widthAnchor.constraint(
				equalToConstant: 50),
			comSelectedRPSImage.heightAnchor.constraint(
				equalToConstant: 50),
			comSelectedRPSImage.topAnchor.constraint(
				equalTo: gameBoardWindow.topAnchor,
				constant: 90),
			comSelectedRPSImage.centerXAnchor.constraint(
				equalTo: selectButton.centerXAnchor,
				constant: view.bounds.width),
		])
	}
	
	func setupYouResult() {
		view.addSubview(youResult)
		youResult.text = rpsViewModel.shared.you.resultText()
		youResult.font = UIFont(name: FONT_DNF, size: 20)
		youResult.textColor = .systemTeal
		youResult.shadowColor = .gray
		youResult.shadowOffset = CGSize(width: 1, height: 1)
		
		youResult.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			youResult.centerXAnchor.constraint(
				equalTo: restartButton.centerXAnchor,
				constant: 100),
			youResult.centerYAnchor.constraint(
				equalTo: youCharacterImage.centerYAnchor),
		])
	}
	
	func setupComResult() {
		view.addSubview(comResult)
		comResult.text = rpsViewModel.shared.com.resultText()
		comResult.font = UIFont(name: FONT_DNF, size: 20)
		comResult.textColor = .systemTeal
		comResult.shadowColor = .gray
		comResult.shadowOffset = CGSize(width: 1, height: 1)
		
		comResult.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			comResult.centerXAnchor.constraint(
				equalTo: restartButton.centerXAnchor,
				constant: 100),
			comResult.centerYAnchor.constraint(
				equalTo: comCharacterImage.centerYAnchor),
		])
	}
}

