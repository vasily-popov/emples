#  MVC Example

##### Presentation Logic
* `View` - delegates user interaction events to the `Controller` and displays data from `Model` directly
* All `UIViewController`, `UIView`, `UITableViewCell` subclasses belong to the `View` layer
* View - it shouldn't contain any complex logic. Logic should be moved to Controller or Model
* `Controller` - contains the presentation logic and tells the `View` what to present and when
* Usually we have one `Controller` per view
* It reference the concrete type of the `View`, but can be references the `View` protocol that is implemented usually by a `UIViewController/UIView` subclass
* It should be a plain `Objective-c` class and not reference any `iOS` framework classes - this makes it easier to reuse
* it uses `Model` to fetch data source, manupulate it using `DecoratorModelProtocol` and set it to view
* `Assembly` - injects the dependency object graph into the scene (view controller)
* You could very easily use a DI (dependency injection) library. `Not used here`
* `Router` - contains navigation / flow logic from one scene (view controller) to another
* In some communities / blog posts it might be referred to as a `FlowController`
* In this project all MVC components are assempled in Router
* It is usually referenced only by the `Presenter`

##### Business Logic

* MPC does not describe business logic architecture. So it's up to developer how to implement it. Here is just a simple example.
* `Model` - it's either plain object that conatins source to display or interface to communicate with api (network/database)
* It is referenced both  `Controller` and `View`, but `View` has read-only access.
* It communicates with network and sorage `API` to retrieve / persist the data
* Models objects used by your application such as `Order`, `Product`, `Shopping Cart`, etc

