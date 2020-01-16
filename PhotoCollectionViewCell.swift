//
//  PhotoCollectionViewCell.swift
//  FlickerSearch
//
//  Created by 蘇健豪 on 2020/1/16.
//  Copyright © 2020 Oyster. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var photo: Photo!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func loadImage(photo: Photo) {
        let url = URL(string: "https://farm\(photo.farm).staticflickr.com/\(photo.server)/\(photo.id)_\(photo.secret).jpg")!
        
        let queue = DispatchQueue.main
        queue.async {
            guard let data = try? Data(contentsOf: url) else { return }
            let image = UIImage(data: data)
            self.imageView.image = image
        }
    }

}
