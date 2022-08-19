import UIKit
import Foundation

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var deathDateLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
}

class DeathData {
    static var myCells:[Note] = [
        Note(name:"crek", dateString:"2012/12/03 10:22:01"),
        Note(name:"Rdrty", dateString:"2012/11/11 10:22:02", description: """
025+t3d0b;(os/kern) invalid capability (0x1+0300 Death Note[6768:840356] XPC connection interrupted
        Notame: SdfdfjhgFhgfjhg kjhfjhfGodchild. Hgf\nDuh Kuhl kid k.  JugsJkshkdfjKhjsdhf \nJlskdjflj ;\n\nLsdjlksdjfj))
""")
    ]
}
