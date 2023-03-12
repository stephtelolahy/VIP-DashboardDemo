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
- Contains view's business logic
- All dependencies are private
- All dependencies are injected with constructor 
- All data are initialized with constructor
- Should never import UIKit or SwiftUI

### Presenter
- `class`
- Contains view's data suitable for display
- All properties are @Published
- All properties have default value with constructor

### Worker
- `struct`
- Fetching data from API or local storage

### Router
- `struct`
- Contains navigation logic

### Configurator
- `struct`
- Configuring VIP cycle
- Creates all VIP componenets instances


## Features
- [x] Shared worker
- [x] Scalable configurator
- [ ] ChildView VIP
- [ ] Default Router


