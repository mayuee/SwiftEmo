//
//  AutoLayoutCell.swift
//  SwiftEmo
//
//  Created by cs on 16/5/11.
//  Copyright © 2016年 mzb. All rights reserved.
//

import UIKit

let AutoHeightCellIdentifier:String = "AutoHeightCellIdentifier";

class AutoLayoutCell: UITableViewCell {

    @IBOutlet weak var imageHeader: UIImageView!;
    
    @IBOutlet weak var labelTitle: UILabel!;
    
    var title:String{     //计算属性
        set{
            self.storeTitle = newValue;
            self.labelTitle.text = self.storeTitle;
            
        }
        get{
            return self.storeTitle!;
        }
    }
    var storeTitle:String?;      //存储属性
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
