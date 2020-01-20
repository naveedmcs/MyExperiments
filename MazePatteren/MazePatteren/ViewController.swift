//
//  ViewController.swift
//  MazePatteren
//
//  Created by apple on 1/17/20.
//  Copyright © 2020 mytechnology. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
    }


    func path1() {
        let renderer1 = UIGraphicsImageRenderer(size: CGSize(width: self.view.frame.size.width, height: self.view.frame.size.height/2))
        let img1 = renderer1.image { ctx in
            ctx.cgContext.setStrokeColor(UIColor.white.cgColor)
            ctx.cgContext.setLineWidth(3)

            ctx.cgContext.move(to: CGPoint(x: 50, y: 50))
            ctx.cgContext.addLine(to: CGPoint(x: 10, y: 50))
            ctx.cgContext.addLine(to: CGPoint(x: 10, y: 50))
           // ctx.cgContext.addLine(to: CGPoint(x: 50, y: 150))

            let rectangle = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height/2)
            ctx.cgContext.addRect(rectangle)
            ctx.cgContext.drawPath(using: .fillStroke)
        }
    
        let image = UIImageView(image: img1)
        self.view.addSubview(image)
    }
    
    func image2() {
       let renderer2 = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
       let img2 = renderer2.image { ctx in
           ctx.cgContext.setStrokeColor(UIColor.black.cgColor)

           ctx.cgContext.translateBy(x: 256, y: 256)

           var first = true
           var length: CGFloat = 256

           for _ in 0 ..< 256 {
               ctx.cgContext.rotate(by: CGFloat.pi / 2)

               if first {
                   ctx.cgContext.move(to: CGPoint(x: length, y: 50))
                   first = false
               } else {
                   ctx.cgContext.addLine(to: CGPoint(x: length, y: 50))
               }

               length *= 0.99
           }

           ctx.cgContext.strokePath()
       }
        
        let image = UIImageView(image: img2)
        self.view.addSubview(image)
    }
}

