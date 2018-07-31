//
//  ViewController.swift
//  PlayingCard
//
//  Created by Никита on 30/07/2018.
//  Copyright © 2018 Никита. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func flipCard(_ sender: UITapGestureRecognizer) {
        switch sender.state {
        case .ended: playingCardView.isFaceUp = !playingCardView.isFaceUp
        default: break
        }
    }
    @IBOutlet weak var playingCardView: PlayingCardView! {
        didSet{
            let swipe = UISwipeGestureRecognizer(target: self, action: #selector(nextCard))
            swipe.direction = [.left,.right]
            playingCardView.addGestureRecognizer(swipe)
            let pinch = UIPinchGestureRecognizer(target: playingCardView, action: #selector(PlayingCardView.adjustFaceCardScale(byHandlingGestureRecognizedBy:)))
            playingCardView.addGestureRecognizer(pinch)
        }
    }
    var deck = PlayingCardDeck()
    
    @objc func nextCard() {
        if let card = deck.draw(){
            playingCardView.rank = card.rank.order
            playingCardView.suit = card.suit.rawValue
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    
}

