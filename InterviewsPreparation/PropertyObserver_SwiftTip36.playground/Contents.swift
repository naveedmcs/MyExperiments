import UIKit

var str = """
#36 Property observers, getter/setter and lazy are mutually exclusive

Little thing that surprisingly became a discovery for me, because it's rare case in practice, so I'm not ashamed of it 🤣. Property observers, getter/setter and lazy cant be used together, they are mutually exclusive. So you should choose what pattern makes most profit to you in particaulr situation.
"""


struct StepCounter {
    lazy var totalSteps: Int = 0 {
        willSet {
            print("Aboud to set total Steps to \(totalSteps)")
        }
        didSet {
            if totalSteps > oldValue {
                 print("Added \(totalSteps - oldValue) steps")
            }
           
        }
    }
    
    lazy var doubleDistance: Double {
        get {
            return self.doubleDistance * 2
        }
    }
    
    lazy var doubleSpeed: Double {
        get {
            return self.doubleSpeed * 2
        }
        didSet {
            print("speed \(self.doubleSpeed)")
        }
    }
}
