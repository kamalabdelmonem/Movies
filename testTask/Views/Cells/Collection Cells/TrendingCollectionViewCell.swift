//
//  TrendingCollectionViewCell.swift
//  testTask
//
//  Created by 10 on 20/06/2021.
//

import UIKit

class TrendingCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieRate: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setContent(image:String,title:String,rate:String) {
        self.movieImage.loadImageFromUrl(imgUrl: image, defaultImage: "logo")
        self.movieTitle.text = title
        self.movieRate.text = rate

    }

}
