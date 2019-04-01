//
//  CurvedView.swift
//  GrappusAssignment
//
//  Created by Rupin Gupta on 02/04/19.
//  Copyright © 2019 Rupin Gupta. All rights reserved.
//

import UIKit

class CurvedView: UIView {
    
    public var distance: CGFloat = 0.0
    public var controlX: CGFloat = 0.0
    
    
    
    override func draw(_ rect: CGRect) {
        
        let myBezier = UIBezierPath()
        myBezier.move(to: CGPoint(x: 0, y: rect.height))
        
        if distance == 0.0 {
            myBezier.addLine(to: CGPoint(x: 0, y: 100  ))
            myBezier.addQuadCurve(to: CGPoint(x: rect.width, y: 100 ), controlPoint: CGPoint(x: rect.width / 2, y: 100))
            myBezier.addLine(to: CGPoint(x: rect.width, y: rect.height))
            
        }
            
            
        else {
            myBezier.addLine(to: CGPoint(x: 0, y: 100  ))
            myBezier.addQuadCurve(to: CGPoint(x: rect.width, y: 100 ), controlPoint: CGPoint(x: controlX, y: 100 + (2.5 * distance)))
            myBezier.addLine(to: CGPoint(x: rect.width, y: rect.height))
        }
        
        myBezier.close()
        
        
        
        let context = UIGraphicsGetCurrentContext()
        context!.setLineWidth(4.0)
        
        UIColor.green.setFill()
        myBezier.fill()
        
        
    }
}
