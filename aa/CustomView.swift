//
//  CustomView.swift
//  aa
//
//  Created by Megha on 01/07/19.
//  Copyright © 2019 Megha. All rights reserved

import UIKit
@IBDesignable

class CustomView: UIView {
    @IBOutlet weak var btnPress: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    let nibName = "CustomView"
    var contentView:UIView?
    //@IBOutlet weak var label: UILabel!
//    @IBAction func buttonTap(_ sender: UIButton) {
//        ///label.text = "Hi"
//    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    func commonInit() {
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
        contentView = view
    }
    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil)[0] as? UIView
    }

}
