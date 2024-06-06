//
//  MatchImageGameViewController.swift
//  MatchImage
//
//  Created by Jungjin Park on 2024-06-06.
//

import UIKit

class MatchImageGameViewController: UIViewController {

    var cards = [UIImageView]()
    var cardImages = [UIImage]()
    var flippedCards = [UIImageView]()
    var matrix = [3,6]
    var imageNames = ["figure.badminton", "figure.baseball", "figure.basketball", "figure.bowling", "figure.cricket", "figure.american.football", "figure.golf", "figure.handball", "figure.soccer"]
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "같은 그림 찾기"
        view.backgroundColor = .white
        
        setupCardImages()
        setupCards()
    }
    
    func setupCardImages() {
        let numberOfImages = matrix.reduce(1, *) / 2
        print(numberOfImages)
        for i in 0..<numberOfImages {
            print("\(imageNames[i])")
            cardImages.append(UIImage(systemName: imageNames[i])!)
        }
        cardImages = cardImages.shuffled()
    }
    
    func setupCards() {
        let cardWidth: CGFloat = 100
        let cardHeight: CGFloat = 100
        let margin: CGFloat = 10
        let startX = (view.bounds.width - (cardWidth * CGFloat(matrix[0]) + margin * (CGFloat(matrix[0]) - 1.0 ))) / 2
        let startY = (view.bounds.height - (cardHeight * CGFloat(matrix[1]) + margin * (CGFloat(matrix[1]) - 1.0 ))) / 2
        
        for i in 0..<matrix[1] {
            for j in 0..<matrix[0] {
                let row = i % matrix[1]
                let col = j % matrix[0]
                let x = startX + (cardWidth + margin) * CGFloat(col)
                let y = startY + (cardHeight + margin) * CGFloat(row)
                
                let card = createCard(frame: CGRect(x: x, y: y, width: cardWidth, height: cardHeight))
                card.tag = i + j
                view.addSubview(card)
                cards.append(card)
            }
        }
    }
    
    func createCard(frame: CGRect) -> UIImageView {
        let card = UIImageView(frame: frame)
        card.backgroundColor = .gray
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
        print("card: \(image)")
        UIView.transition(with: card, duration: 0.5, options: .transitionFlipFromLeft, animations: {
            card.image = image
            card.backgroundColor = .clear
        }, completion: nil)
    }
    
    func checkForMatch() {
        let card1 = flippedCards[0]
        let card2 = flippedCards[1]
        
        if cardImages[card1.tag] == cardImages[card2.tag] {
            flippedCards.removeAll()
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.flipCardBack(card1)
                self.flipCardBack(card2)
                self.flippedCards.removeAll()
            }
        }
    }
    
    func flipCardBack(_ card: UIImageView) {
        UIView.transition(with: card, duration: 0.5, options: .transitionFlipFromRight, animations: {
            card.image = nil
            card.backgroundColor = .gray
        }, completion: nil)
    }
}
