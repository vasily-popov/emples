#  MVC Example
the main purpose of this project to show the MVC on ios does not mean massive view controllers.
As you may see in project, I use classic mvc where  view is UIViewcontroller, controller is separated class based on NSObject and have nothing with UI. Model presents interface to fetch data from file system (as example). I use Decorator pattern  to prepare model for showing data, but we also could use separate model for it. Controller have link to router (in some article it calls as flow controller) to navigate beetwen screens.

The purpose of MV(X) architecture to divide logic beetwen components in order to make it possible use same model (in some cases controller/prsenter/etc) with another view. So you can see have I can use same model to present list, grid, stack, gallery, etc.

In project I use TableViewManager as dataSource and delegate for table view

In some expamle we could use same controller - for Grid and for List for exmple, but I intentionly keep them.
Maybe we even can avoid controller/router but to be more clearer, better keep the same approach throughout the project. At least for the main wireframe.  Actually MVP is slightly different from MVC, and sometime MVP calls as MVC with passive model. You will see it later.

Please remember, the goal is not to create perfect architecture. The goal is to create maintainable architecture.

It's easy to add DI framework here, but let's do it for another project and  keep this simple.
