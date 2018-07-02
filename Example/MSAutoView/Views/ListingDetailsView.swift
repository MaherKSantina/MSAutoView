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
    
    override func initView() {
        super.initView()
        testLabel.text = "Test inherited"
    }

}
