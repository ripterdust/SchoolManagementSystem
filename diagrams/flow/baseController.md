# Base controller

The `BaseController` class in this Ruby on Rails code snippet is designed as a generic controller to handle basic CRUD (Create, Read, Update, Delete) operations for a model. It serves as a template for other controllers to inherit from, providing a standardized way to perform common actions without duplicating code across multiple controllers.

### Controllers using baseController

- `coursesController.rb` -> /courses

## Base controller diagram

```mermaid
    flowchart
    id1([START]) --> id2(Server receives a request)
    id2 --> id3{Is there an existing model?}
    id3 --> id4(no)
    id4 --> id5(Returns an -not model specified- error message)
    id3 --> id6(yes)
    id6 --> id7(Handle the request based on the HTTP verb)
    id5 --> id8
    id7 --> id8([END])
```
