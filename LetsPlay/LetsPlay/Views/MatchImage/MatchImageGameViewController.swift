//
//  SharedData.shared.matchImageGameViewController.swift
//  MatchImage
//
//  Created by Jungjin Park on 2024-06-06.
//

import UIKit
import AudioToolbox

class MatchImageGameViewController: UIViewController {
    
    let imageNames = ["figure.badminton", "figure.baseball", "figure.basketball", "figure.bowling", "figure.cricket", "figure.american.football", "figure.golf", "figure.handball", "figure.soccer"]

    var cards = [UIImageView]()
    var cardImages = [UIImage]()
    var flippedCards = [UIImageView]()
    var tags = [Int]()
    var numberOfImages = 0
    
    var playSeconds = 0
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        setupNavigationBar(title: "짝꿍 찾기 (00:00)", leftButtonTitle: "게임목록", leftButtonAction: #selector(leftButtonTappedToList))
        
        setBackground()
        
        setupCardImages()
        setupCards()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            self.playSeconds += 1
            self.title = "짝꿍 찾기 (\(self.playTimeFormat()))"
        }
    }
    func setupCardImages() {
        numberOfImages = SharedData.shared.matchImageGame.matrix.reduce(1, *) / 2
        for i in 0..<numberOfImages {
            cardImages.append(UIImage(systemName: imageNames[i])!)
            tags.append(i)
            tags.append(i)
        }
        tags = tags.shuffled()
    }
    
    func setupCards() {
        let cardWidth: CGFloat = 100
        let cardHeight: CGFloat = 100
        let margin: CGFloat = 10
        let startX = (view.bounds.width - (cardWidth * CGFloat(SharedData.shared.matchImageGame.matrix[0]) + margin * (CGFloat(SharedData.shared.matchImageGame.matrix[0]) - 1.0 ))) / 2
        let startY = (view.bounds.height - (cardHeight * CGFloat(SharedData.shared.matchImageGame.matrix[1]) + margin * (CGFloat(SharedData.shared.matchImageGame.matrix[1]) - 1.0 ))) / 2
        
        var index = 0
        for i in 0..<SharedData.shared.matchImageGame.matrix[1] {
            for j in 0..<SharedData.shared.matchImageGame.matrix[0] {
                let row = i % SharedData.shared.matchImageGame.matrix[1]
                let col = j % SharedData.shared.matchImageGame.matrix[0]
                let x = startX + (cardWidth + margin) * CGFloat(col)
                let y = startY + (cardHeight + margin) * CGFloat(row)
                
                let card = createCard(frame: CGRect(x: x, y: y, width: cardWidth, height: cardHeight))
                card.tag = tags.remove(at: 0)
                index += 1
                view.addSubview(card)
                cards.append(card)
            }
        }
    }
    
    func createCard(frame: CGRect) -> UIImageView {
        let card = UIImageView(frame: frame)
        card.backgroundColor = UIColor(named: "color-green")
        card.image = UIImage(systemName: "circle")
        card.tintColor = .white
        card.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(cardTapped))
        card.addGestureRecognizer(tapGesture)
        return card
    }
    
    @objc func cardTapped(_ sender: UITapGestureRecognizer) {
        guard let tappedCard = sender.view as? UIImageView else { return }
        guard flippedCards.count < 2 else { return }
        guard !flippedCards.contains(tappedCard) else { return }
        flipCard(tappedCard, toImage: cardImages[tappedCard.tag])
        
        flippedCards.append(tappedCard)
        
        if flippedCards.count == 2 {
            checkForMatch()
        }
    }
    
    func flipCard(_ card: UIImageView, toImage image: UIImage) {
        UIView.transition(with: card, duration: 0.5, options: .transitionFlipFromLeft, animations: {
            card.image = image
            card.tintColor = .white
            card.backgroundColor = UIColor(named: "color-skyblue")
        }, completion: nil)
    }
    
    func checkForMatch() {
        let card1 = flippedCards[0]
        let card2 = flippedCards[1]
        
        if cardImages[card1.tag] == cardImages[card2.tag] {
            matchedSound()
            flippedCards.removeAll()
            // matched cards unflippable
            card1.isUserInteractionEnabled = false
            card2.isUserInteractionEnabled = false
            // add animation to matched cards
            card1.addSymbolEffect(.pulse, options: .nonRepeating, animated: false)
            card2.addSymbolEffect(.pulse, options: .nonRepeating, animated: false)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                card1.tintColor = UIColor(named: "color-orange")
                card1.backgroundColor = .white
                card2.tintColor = UIColor(named: "color-orange")
                card2.backgroundColor = .white
            }
            // all matched
            numberOfImages -= 1
            if numberOfImages == 0 {
                timer?.invalidate()
                timer = nil
                let alertController = UIAlertController(title: "축하합니다", message: "모든 그림 카드를 맞추셨습니다.", preferredStyle: .alert)
                self.present(alertController, animated: true, completion: nil)
                playEndSound()
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
                    guard let self = self else { return }
                    alertController.dismiss(animated: true) {
                        let matchImageEndViewController = MatchImageEndViewController()
                        SharedData.shared.matchImageGame.playedTime = self.playTimeFormat()
                        self.navigationController?.pushViewController(matchImageEndViewController, animated: true)
                    }
                }
            }
        } else {
            // not matched
            unmatchedSound()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
                guard let self = self else { return }
                self.flipCardBack(card1)
                self.flipCardBack(card2)
                self.flippedCards.removeAll()
            }
        }
    }
    
    func flipCardBack(_ card: UIImageView) {
        UIView.transition(with: card, duration: 0.5, options: .transitionFlipFromRight, animations: {
            card.image = UIImage(systemName: "circle")
            card.tintColor = .white
            card.backgroundColor = UIColor(named: "color-green")
        }, completion: nil)
    }
    
    func playTimeFormat() -> String {
        let minutes = playSeconds / 60
        let seconds = playSeconds % 60
        let timeFormat = String(format: "%02d:%02d", minutes, seconds)
        
        return timeFormat
    }
    
    func matchedSound()  {
        let systemSoundId: SystemSoundID = 1002
        
        AudioServicesPlaySystemSound(systemSoundId)
    }
    func unmatchedSound()  {
        let systemSoundId: SystemSoundID = 1004
        
        AudioServicesPlaySystemSound(systemSoundId)
    }
    func playEndSound()  {
        let systemSoundId: SystemSoundID = 1005
        
        AudioServicesPlaySystemSound(systemSoundId)
    }
}
