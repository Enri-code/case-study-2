# case_study

A new Flutter project.

## Getting Started


The project was split into multiple packages in order to maintain explicit dependencies for each package with clear boundaries that enforce the single responsibility principle.
Advantages:

easy to reuse packages across multiple projects
CI/CD improvements in terms of efficiency (run checks on only the code that has changed)
easy to maintain the packages in isolation with their dedicated test suites, semantic versioning, and release cycle/cadence

This application consists of three main layers:

infrastruture layer
domain layer
feature layer
   presentation (widgets)
   application (blocs)



Infrastruture Layer

Communicates with external database, Apis.
It doesn't depend on UI and can be reused

Domain Layer

This layer combines one or more data providers and applies "business rules" to the data. Each component in this layer is called a repository and each repository generally manages a single domain. Packages in the repository layer should generally only interact with the data layer. 


Feature Layer

This layer contains all of the application-specific features and use cases. Each feature generally consists of some UI and business logic. Features should generally be independent of other features so that they can easily be added/removed without impacting the rest of the codebase. Within each feature, the state of the feature along with any business logic is managed by blocs. Blocs interact with zero or more repositories. Blocs react to events and emit states which trigger changes in the UI. Widgets within each feature should generally only depend on the corresponding bloc and render UI based on the current state. The UI can notify the bloc of user input via events.
