//
//  ViewController.swift
//  CardView
//
//  Created by ATSUSHI on 2016/05/26.
//  Copyright © 2016年 ATSUSHI. All rights reserved.
//

import UIKit
import Koloda

private var numberOfCards: UInt = 5

class ViewController: UIViewController {

    @IBOutlet weak var cardView: KolodaView!
    
    private var cardInformations: [CardInformation] = {
        var array = [CardInformation]()
        for index in 0..<numberOfCards {
            array.append(CardInformation(image: UIImage(named: "Card_like_\(index + 1)")!, userImage: UIImage(), name: "\(index)さん", location: "Tokyo"))
        }
        return array
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.cardView.dataSource = self
        self.cardView.delegate = self
        
        self.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController: KolodaViewDelegate {
    
    func kolodaDidRunOutOfCards(koloda: KolodaView) {
        //self.cardInformations.insert(UIImage(named: "Card_like_6")!, atIndex: self.cardView.currentCardIndex - 1)
        let position = self.cardView.currentCardIndex
        self.cardView.insertCardAtIndexRange(position...position, animated: true)
    }
    
    func koloda(koloda: KolodaView, didSelectCardAtIndex index: UInt) {
        UIApplication.sharedApplication().openURL(NSURL(string: "http://yalantis.com/")!)
    }
    
}

extension ViewController: KolodaViewDataSource {
    
    func kolodaNumberOfCards(koloda:KolodaView) -> UInt {
        return UInt(self.cardInformations.count)
    }
    
    func koloda(koloda: KolodaView, viewForCardAtIndex index: UInt) -> UIView {
        //return display UIView
        let cardView = NSBundle.mainBundle().loadNibNamed("CardView", owner: self, options: nil)[0] as! CardView
        cardView.setCardInformation(self.cardInformations[Int(index)])
        
        return cardView
    }
    
    func koloda(koloda: KolodaView, viewForCardOverlayAtIndex index: UInt) -> OverlayView? {
        return NSBundle.mainBundle().loadNibNamed("OverlayView", owner: self, options: nil)[0] as? OverlayView
    }
    
}