//
//  ListingDetailsView.swift
//  MSAutoView
//
//  Created by Maher Santina on 8/2/18.
//  Copyright © 2018 Maher Santina. All rights reserved.
//

import UIKit

class ListingDetailsView: ListingView {

    @IBOutlet weak var testLabel: UILabel!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func awakeFromNib() {
        super.awakeFromNib()
        testLabel.text = "hala"
    }

}
