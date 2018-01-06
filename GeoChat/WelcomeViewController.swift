
//  First welcome view controller
//

import UIKit
import Firebase


class WelcomeViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //If tuser already logged in, bypass straight to ChatViewController
        
        if Auth.auth().currentUser != nil {
            performSegue(withIdentifier: "goToChat", sender: self)
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
