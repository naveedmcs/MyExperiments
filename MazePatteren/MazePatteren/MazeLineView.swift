//
//  MazeLineView.swift
//  MazePatteren
//
//  Created by apple on 1/20/20.
//  Copyright © 2020 mytechnology. All rights reserved.
//

import UIKit

class MazeLineView: UIView {
    override func draw(_ rect: CGRect) {
        MazeLineStyle.drawMazeLine(frame: rect, resizing: .aspectFit)
    }
}
