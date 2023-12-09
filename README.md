# CS5520_Accelerometer
Demo of accelerometer in iOS swift

For this extra credit assignment we deployed a real-time accelerometer in an app.

This accelerometer makes use of the `CoreMotion` library, which is surprisingly simple to use.

For this example, we simply import the library in the main ViewController

```swift
import CoreMotion
```

And from there, we use the `CMMotionManager` class to access the accelerometer in
our `viewDidLoad`:

```swift
class ViewController: UIViewController {
    
    let motionManager = CMMotionManager()
    var xLabel: UILabel! //acceleration in the X axis
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // we can access motionManager from here
    }
}
```

For example, to start the accelerometer, we use the `startAccelerometerUpdates()` method
and use a timer to update the `xLabel` UI text at the timer's interval with the new
value being read from the accelerometer:

```swift
class ViewController: UIViewController {
    
    let motionManager = CMMotionManager()
    var xLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupXLabel() //code for setting up a label

        // start the accelerometer
        motionManager.startAccelerometerUpdates()

        // set up a timer that updates the text label at a given interval
        
        Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { _ in
            if let data = self.motionManager.accelerometerData {
                self.xLabel.text = String(format: "%.5f", data.acceleration.x)
            }
        }
    }

    func setupXLabel() {
        //set up your text label for the accelerometer values here

        
    }
}
```
