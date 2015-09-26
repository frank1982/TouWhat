

import UIKit

class BadCell: UITableViewCell {

    init(info: Dictionary<String,AnyObject>, reuseIdentifier cellID: String?){
        super.init(style: UITableViewCellStyle.Default, reuseIdentifier: cellID)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
