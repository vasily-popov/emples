#  MVP Example

     - view is UIViewcontroller. May interact with Presenter only.
     - presenter is separated class based on NSObject (PONSO) and have nothing with UI. Have link to Model and View. Send request to model and update view with special prepared data.
     - Model presents interface to fetch data from file system (as example).
     - Presenter have link to router (in some article it calls as flow controller) to navigate beetwen screens.

