# VIP-DashboardDemo

A Sample implementation of configurable Dashboard with use of VIP architecture

![](docs/dependency-injection.png)

## Guide

### View
- `struct`
- Contains views
- Keep instances of presenter and interactor

### Interactor
- `struct`
- Contains view's logic
- All dependencies are private
- All dependencies are defined with constructor 
- All data are initialized with constructor

### Presenter
- `class`
- Contains view's data
- All properties are @Published
- All properties have default value with constructor

### Worker
- `struct`
- Fetching data from API or local storage


