#  VIPER Example

##### Presentation Logic
* `View` - delegates user interaction events to the `Presenter` and displays data passed by the `Presenter`
* All `UIViewController`, `UIView`, `UITableViewCell` subclasses belong to the `View` layer
* Usually the view is passive / dumb - it shouldn't contain any complex logic
* `Presenter` - contains the presentation logic and tells the `View` what to present
* Usually we have one `Presenter` per scene (view controller)
* It doesn't reference the concrete type of the `View`, but rather it references the `View` protocol that is implemented usually by a `UIViewController` subclass
* It should be a plain `Objective-c` class and not reference any `iOS` framework classes - this makes it easier to reuse
* `Configurator`/`Assembly` - injects the dependency object graph into the scene (view controller)
* You could very easily use a DI (dependency injection) library. Typhoon is used here.
* `Router` - contains navigation / flow logic from one scene (view controller) to another
* In some communities / blog posts it might be referred to as a `FlowController`
* It is usually referenced only by the `Presenter`


##### Business Logic

* `UseCase / Interactor` - contains the application / business logic for a specific use case in your application
* It is referenced by the `Presenter`. The `Presenter` can reference multiple `UseCases` since it's common to have multiple use cases on the same screen
* It manipulates `Entities` and communicates with `Gateways` to retrieve / persist the entities
* The `Gateway` protocols should be defined in the `Application Logic` layers and implemented by the `Gateways & Framework Logic`
* The separation described above ensures that the `Application Logic` depends on abstractions and not on actual frameworks / implementations
* `Entity` - plain ``Objective-C` classes 
* Models objects used by your application such as `Order`, `Product`, `Shopping Cart`, etc

##### Gateways & Framework Logic

* `Gateway` - contains actual implementation of the protocols defined in the `Application Logic` layer
* We can implement for instance a `LocalPersistenceGateway` protocol using `CoreData`, `Realm`, `Sqlite`, or even simple use `file system`
* We can implement for instance an `ApiGateway` protocol using `URLSession`, `AFNetworking` or other.
* We can implement for instance a `UserSettings` protocol using `UserDefaults`
* `Persistence / API Entities` - contains framework specific representations
* `Framework specific APIs` - contains implementations of `iOS` specific APIs such as sensors / bluetooth / camera

##### Test

* Specta used for Unit testing
