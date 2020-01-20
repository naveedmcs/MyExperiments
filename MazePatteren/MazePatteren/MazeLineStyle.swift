//
//  MazeLineStyle.swift
//  MazePatteren
//
//  Created by apple on 1/20/20.
//  Copyright © 2020 mytechnology. All rights reserved.
//

import UIKit

public class MazeLineStyle : NSObject {

    //// Drawing Methods

    @objc dynamic public class func drawMazeLine(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 200, height: 250), resizing: ResizingBehavior = .aspectFit) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()!
        
        //// Resize to Target Frame
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 200, height: 250), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 200, y: resizedFrame.height / 250)
        let resizedShadowScale: CGFloat = min(resizedFrame.width / 200, resizedFrame.height / 250)


        //// Color Declarations
        let shadowColor2 = UIColor(red: 0.436, green: 0.892, blue: 1.000, alpha: 1.000)
        let color2 = UIColor(red: 0.994, green: 1.000, blue: 0.993, alpha: 1.000)

        //// Shadow Declarations
        let shadow = NSShadow()
        shadow.shadowColor = shadowColor2
        shadow.shadowOffset = CGSize(width: 0, height: 0)
        shadow.shadowBlurRadius = 6

        //// defaultLine Drawing
        let defaultLinePath = UIBezierPath()
        defaultLinePath.move(to: CGPoint(x: 88.69, y: 155.29))
        defaultLinePath.addCurve(to: CGPoint(x: 88.69, y: 71.26), controlPoint1: CGPoint(x: 86.38, y: 69.31), controlPoint2: CGPoint(x: 88.69, y: 71.26))
        defaultLinePath.addLine(to: CGPoint(x: 123.31, y: 71.26))
        defaultLinePath.addLine(to: CGPoint(x: 123.31, y: 178.74))
        defaultLinePath.addLine(to: CGPoint(x: 61, y: 178.74))
        defaultLinePath.addLine(to: CGPoint(x: 61, y: 40))
        defaultLinePath.addLine(to: CGPoint(x: 151, y: 40))
        defaultLinePath.addLine(to: CGPoint(x: 151, y: 210))
        defaultLinePath.addLine(to: CGPoint(x: 61, y: 210))
        defaultLinePath.addLine(to: CGPoint(x: 61, y: 198.28))
        UIColor.gray.setStroke()
        defaultLinePath.lineWidth = 10.5
        defaultLinePath.lineCapStyle = .round
        defaultLinePath.lineJoinStyle = .round
        defaultLinePath.stroke()


        //// selectedLine Drawing
        context.saveGState()
        context.translateBy(x: 61.5, y: 126.5)

        let selectedLinePath = UIBezierPath()
        selectedLinePath.move(to: CGPoint(x: 27.69, y: 28.29))
        selectedLinePath.addCurve(to: CGPoint(x: 27.69, y: -55.74), controlPoint1: CGPoint(x: 25.38, y: -57.69), controlPoint2: CGPoint(x: 27.69, y: -55.74))
        selectedLinePath.addLine(to: CGPoint(x: 62.31, y: -55.74))
        selectedLinePath.addLine(to: CGPoint(x: 62.31, y: 51.74))
        selectedLinePath.addLine(to: CGPoint(x: 0, y: 51.74))
        selectedLinePath.addLine(to: CGPoint(x: 0, y: -87))
        selectedLinePath.addLine(to: CGPoint(x: 90, y: -87))
        selectedLinePath.addLine(to: CGPoint(x: 90, y: 83))
        selectedLinePath.addLine(to: CGPoint(x: 0, y: 83))
        selectedLinePath.addLine(to: CGPoint(x: 0, y: 71.28))
        context.saveGState()
        context.setShadow(offset: CGSize(width: shadow.shadowOffset.width * resizedShadowScale, height: shadow.shadowOffset.height * resizedShadowScale), blur: shadow.shadowBlurRadius * resizedShadowScale, color: (shadow.shadowColor as! UIColor).cgColor)
        color2.setStroke()
        selectedLinePath.lineWidth = 10.5
        selectedLinePath.lineCapStyle = .round
        selectedLinePath.lineJoinStyle = .round
        selectedLinePath.stroke()
        context.restoreGState()

        context.restoreGState()


        //// Pin Drawing
        let pinPath = UIBezierPath(ovalIn: CGRect(x: 48.5, y: 193.5, width: 26, height: 26))
        context.saveGState()
        context.setShadow(offset: shadow.shadowOffset, blur: shadow.shadowBlurRadius, color: (shadow.shadowColor as! UIColor).cgColor)
        UIColor.white.setFill()
        pinPath.fill()
        context.restoreGState()

        shadowColor2.setStroke()
        pinPath.lineWidth = 5
        pinPath.stroke()
        
        context.restoreGState()

    }




    @objc(MazeLineViewResizingBehavior)
    public enum ResizingBehavior: Int {
        case aspectFit /// The content is proportionally resized to fit into the target rectangle.
        case aspectFill /// The content is proportionally resized to completely fill the target rectangle.
        case stretch /// The content is stretched to match the entire target rectangle.
        case center /// The content is centered in the target rectangle, but it is NOT resized.

        public func apply(rect: CGRect, target: CGRect) -> CGRect {
            if rect == target || target == CGRect.zero {
                return rect
            }

            var scales = CGSize.zero
            scales.width = abs(target.width / rect.width)
            scales.height = abs(target.height / rect.height)

            switch self {
                case .aspectFit:
                    scales.width = min(scales.width, scales.height)
                    scales.height = scales.width
                case .aspectFill:
                    scales.width = max(scales.width, scales.height)
                    scales.height = scales.width
                case .stretch:
                    break
                case .center:
                    scales.width = 1
                    scales.height = 1
            }

            var result = rect.standardized
            result.size.width *= scales.width
            result.size.height *= scales.height
            result.origin.x = target.minX + (target.width - result.width) / 2
            result.origin.y = target.minY + (target.height - result.height) / 2
            return result
        }
    }
}
