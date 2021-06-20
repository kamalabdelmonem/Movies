//
//  ImageViewExtention.swift
//  GoJekUser
//
//  Created by 10 on 20/12/2020.
//  Copyright © 2020 Appoets. All rights reserved.
//

import UIKit
import SDWebImageWebPCoder
extension UIImageView {
    func loadImageFromUrl (imgUrl : String?,defaultImage:String?){
        let defaultImage = UIImage(named: defaultImage!)
        if imgUrl == "" || imgUrl == nil
        {
            self.image = defaultImage
            return
        }
        let webPCoder = SDImageWebPCoder.shared
        SDImageCodersManager.shared.addCoder(webPCoder)
        guard let url = URL(string: imgUrl ?? "" ) else {
            self.image = defaultImage
            return
        }
        DispatchQueue.main.async {[weak self] () in
            self?.sd_setImage(with: url, placeholderImage: defaultImage, options: .highPriority, progress: nil, completed: nil)
        }
    }
}
