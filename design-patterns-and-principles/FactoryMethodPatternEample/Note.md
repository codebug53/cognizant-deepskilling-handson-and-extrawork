# Understanding the Factory Method Pattern

While developing the first version, I found it difficult to differentiate between a normal implementation and the Factory Method Pattern because both approaches appeared to create and use objects in a similar way.

After designing the second version, the purpose of the pattern became much clearer. The main advantage of the Factory Method is not just object creation, but **abstraction and separation of responsibilities**.

By calling a single method, the client can trigger different document-specific functionalities without needing to know the internal implementation details. The client only interacts with the required interface and does not need to understand how each operation is performed.

This provides:

- Better abstraction by hiding unnecessary implementation details.
- Cleaner client code by reducing direct dependencies on concrete classes.
- Easier maintenance because changes in object creation or internal logic do not affect the client.
- Improved scalability because new document types can be added without changing existing client logic significantly.

The key idea I learned is that design patterns are not always about reducing the number of lines of code. They are about organizing code in a way that makes it easier to extend, maintain, and understand.