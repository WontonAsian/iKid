import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var jokeLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    var jokes: [String] = []
    var jokeIndex: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        setupJokesForCategory()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupJokesForCategory()
        displayJoke()
    }

    func setupJokesForCategory() {
        jokeIndex = 0
        switch title {
        case "Dark Jokes":
            jokes = ["What's al Qaeda's favorite football team?", "The New York Jets."]
        case "Pun":
            jokes = ["Want to hear a joke about construction?", "I’m still working on it."]
        case "Dad":
            jokes = ["Can February March?", "No, but April May!"]
        case "Knock Knock":
            jokes = ["Knock knock", "Who's there?", "Lettuce", "Lettuce who?", "Lettuce in, it’s cold out here!"]
        default:
            jokes = []
        }
        displayJoke()
    }
    
    func displayJoke() {
        if jokeIndex < jokes.count { // Check bounds to avoid crash
            let jokeText = jokes[jokeIndex]
            UIView.transition(with: jokeLabel, duration: 0.75, options: .transitionFlipFromRight, animations: {
                self.jokeLabel.text = jokeText
            }, completion: nil)
            nextButton.isHidden = jokeIndex == jokes.count - 1
        }
    }
    
    @IBAction func nextJoke(_ sender: UIButton) {
        if jokeIndex < jokes.count - 1 {
            jokeIndex += 1
            displayJoke()
        } else {
            nextButton.isHidden = true
        }
    }
}
