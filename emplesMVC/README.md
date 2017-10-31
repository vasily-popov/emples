#  MVC Example

### *the main purpose of this project to show that MVC on ios does not mean massive view controllers.*
###### As you may see in project, I use classic mvc where
     - view is UIViewcontroller,
     - controller is separated class based on NSObject and have nothing with UI.
     - Model presents interface to fetch data from file system (as example). I use Decorator pattern to prepare model for showing data, but we also could use separate model for it.
     - Controller have link to router (in some article it calls as flow controller) to navigate beetwen screens.
     - it's easy to add DI framework like Typhoon.

 - **The purpose of MV(X) architecture to separate logic beetwen components in order to make it possible use same model (in some cases controller/prsenter/etc) with another view. So you can see have I can use same model to present list, grid, stack, gallery, carousel.**
 - **the goal is not to create perfect architecture. The goal is to create maintainable architecture.**

