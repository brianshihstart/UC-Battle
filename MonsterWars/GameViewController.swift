import UIKit
import SpriteKit
class GameViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        

        let aspectRatio = view.bounds.size.width / view.bounds.size.height
        //
        let intro = IntroScene(size: CGSize(width: 640 * aspectRatio, height: 640), playbutton: "background2", background: "background1" )
        
//        let player1menu = MenuScene(size: CGSize(width: 640 * aspectRatio, height: 640), nextButton: "nextButton", background: "background")
//        let player2menu = MenuScene(size: CGSize(width: 640 * aspectRatio, height: 640), nextButton: "nextButton", background: "background")

        

        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        intro.scaleMode = .AspectFill
        skView.presentScene(intro)
    }
    override func prefersStatusBarHidden() -> Bool  {
        return true
    }
}