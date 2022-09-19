//
//  HourMessageView.swift
//  hour-message
//
//  Created by Cora on 19/09/22.
//

import Foundation
import UIKit

class HourMessageView {
    
    let messageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let image: UIImageView = {
        let image = UIImageView()
        return image
    }()
}
