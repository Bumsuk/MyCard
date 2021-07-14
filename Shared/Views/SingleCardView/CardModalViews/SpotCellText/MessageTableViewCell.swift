//
//  MessageTableViewCell.swift
//  spot
//
//  Created by brown on 2021/06/25.
//  Copyright © 2021 LCC Ltd. All rights reserved.
//

import UIKit

class MessageTableViewCell: UITableViewCell {

    @IBOutlet weak var btnCheck: UIButton! // 체크 버튼
    @IBOutlet weak var ivProfile: UIImageView!
    @IBOutlet weak var ivLevel: UIImageView!
    @IBOutlet weak var lblNickName: UILabel!
    @IBOutlet weak var lblContent: UILabel!
    @IBOutlet weak var lblRegTimeStamp: UILabel!
    @IBOutlet weak var lblReadMsg: UILabel! // N 라벨

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        
        btnCheck.setImage(.init(named: "brown"), for: .normal)
        ivProfile.image = .init(named: "brown")
        ivLevel.image = .init(named: "brown")

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
        
}
