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
    
    private var dataSource: Array<UIImage> = {
        var array: Array<UIImage> = []
        for index in 0..<numberOfCards {
            array.append(UIImage(named: "Card_like_\(index + 1)")!)
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
        dataSource.insert(UIImage(named: "Card_like_6")!, atIndex: self.cardView.currentCardIndex - 1)
        let position = self.cardView.currentCardIndex
        self.cardView.insertCardAtIndexRange(position...position, animated: true)
    }
    
    func koloda(koloda: KolodaView, didSelectCardAtIndex index: UInt) {
        UIApplication.sharedApplication().openURL(NSURL(string: "http://yalantis.com/")!)
    }
    
}

extension ViewController: KolodaViewDataSource {
    
    func kolodaNumberOfCards(koloda:KolodaView) -> UInt {
        return UInt(dataSource.count)
    }
    
    func koloda(koloda: KolodaView, viewForCardAtIndex index: UInt) -> UIView {
        //return display UIView
        return UIImageView(image: dataSource[Int(index)])
    }
    
    func koloda(koloda: KolodaView, viewForCardOverlayAtIndex index: UInt) -> OverlayView? {
        return NSBundle.mainBundle().loadNibNamed("OverlayView", owner: self, options: nil)[0] as? OverlayView
    }
    
}