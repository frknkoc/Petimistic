import UIKit

class FeedCell: UITableViewCell {


    @IBOutlet weak var postImageView: UIImageView!

    @IBOutlet weak var descriptionLabel: UILabel!

    @IBOutlet weak var emailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }

}
