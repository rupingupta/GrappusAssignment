//
//  ViewController.swift
//  GrappusAssignment
//
//  Created by Rupin Gupta on 02/04/19.
//  Copyright © 2019 Rupin Gupta. All rights reserved.
//



import UIKit

class ViewController: UIViewController {
    
    

    @IBOutlet weak var myView: CurvedView!
    
    
    @IBOutlet weak var upLbl: UILabel!
    
    @IBOutlet weak var downLbl: UILabel!
    
    
    var translation: CGPoint!
    var startPosition: CGPoint!
    var difference: CGFloat!
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    
    
    @IBAction func panGestureOnMyView(_ sender: UIPanGestureRecognizer) {
        
        
        if sender.location(in: view).y > (myView.frame.origin.y + 60.0) {
           
            if sender.state == .began {
                startPosition = sender.location(in: myView)
                
            }
            
            if sender.state == .began || sender.state == .changed {
                
                translation = sender.translation(in: self.view)
                sender.setTranslation(CGPoint(x: 0, y: 0), in: self.view)
                let endPosition = sender.location(in: myView)
                difference = endPosition.y - startPosition.y
                var newFrame = myView.frame
                newFrame.origin.x = myView.frame.origin.x
                newFrame.origin.y = myView.frame.origin.y + difference
                newFrame.size.width = myView.frame.size.width
                newFrame.size.height = myView.frame.size.height - difference
                
                //updateLabels()   
                
                if  newFrame.size.height < view.frame.size.height - 100 && newFrame.size.height > 150 {
                    UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 0.05, initialSpringVelocity: 0.0, options: [], animations: {
                        self.myView.frame = newFrame
                        self.myView.distance = self.difference
                        self.myView.controlX = sender.location(in: self.view).x
                        self.myView.setNeedsDisplay()
                        
                    }, completion: nil)
                }
            }
        }
        
        if sender.state == .ended {
            self.myView.distance = 0.0
            self.myView.setNeedsDisplay()
        }
        
    }
    
    
    func updateLabels() {
        upLbl.font = upLbl.font.withSize(min(20 * (myView.frame.size.height / 200), 50.0))
        upLbl.alpha = myView.frame.size.height / 200
        downLbl.font = downLbl.font.withSize(50 - upLbl.font.pointSize)
        downLbl.alpha = 200 / myView.frame.size.height
    }
    
   
    
    
    
    
    
}
