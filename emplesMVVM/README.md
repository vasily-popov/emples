#  MVVM Example

##### Presentation Logic
* The `Model` is a representation of the actual data we’ll be dealing with. Your `Model` has no knowledge of the application it is being used in, and contains no logic.
* The `View` is what the end user interacts with. The `View` does not contain any logic; It is told what to display and carries out that task, along with forwarding any events (such as taps) to the ViewController.
* The `ViewModel` keeps track of events that are given to it from the `ViewController`, as well as data from the `Models`. They are going to expose properties and methods that will help to maintain the state of the `View`. They have no knowledge of where any events received from the `ViewController` originate from, or how specifically it is being displayed to the user.


* The `ViewModel` cannot call methods directly on the `ViewController`. (Hence why the `ViewController`, the delegate, is hidden behind a protocol)
* The `ViewModel` must tell its delegate to reload its views when it modifies the state of an exposed property.
* The `ViewModel` must only call methods on its delegate on the main thread (for safety)
* The properties of the `ViewModel` must be of the same type as what they will be used for.

