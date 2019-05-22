//
//  GitRepoTableViewCell.swift
//  MobileCodingGit
//
//  Created by Ignacio Bononi on 21/05/19.
//  Copyright © 2019 Ignacio Bononi. All rights reserved.
//

import UIKit
import RxSwift
import Kingfisher

class GitRepoTableViewCell: RxTableCell {

    @IBOutlet weak var repoAvatar: UIImageView!
    @IBOutlet weak var repoName: UILabel!
    @IBOutlet weak var repoDescription: UILabel!
    @IBOutlet weak var repoOwnerName: UILabel!
    @IBOutlet weak var repoStarsCount: UILabel!

    
    func configure(with entry: GitRepo){
        repoAvatar.kf.setImage(with: entry.image, placeholder: UIImage.placeholder)
        repoName.text = entry.name
        repoDescription.text = entry.description
        repoOwnerName.text = entry.repoOwner
        repoStarsCount.text = entry.stars.abbreviated
    }    
}
