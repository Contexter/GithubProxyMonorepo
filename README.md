### README for GithubProxyMonorepo

---

# GithubProxyMonorepo

## Overview

**GithubProxyMonorepo** is a modular Swift library designed to interact with various aspects of GitHub's API. Each module is tightly coupled to its respective OpenAPI specification and provides a clean, type-safe interface for managing workflows, branches, commits, issues, labels, milestones, and repository configuration.

This project leverages the **Swift OpenAPI Generator** to produce server and type definitions directly from OpenAPI specifications.

---

## Features

- **Modular Structure**:
  - Each module (e.g., `Actions`, `Branches`, etc.) focuses on a specific aspect of GitHub's API.
- **Type-Safe Code**:
  - Code is generated directly from OpenAPI specs to ensure compliance and reliability.
- **Easily Testable**:
  - Includes unit tests for all modules to verify placeholder content and basic functionality.

---

## Structure

- **`Sources/`**:
  - Contains library modules for:
    - Actions
    - Branches
    - Commits
    - Issues
    - Labels
    - Milestones
    - RepoCM
  - Each module includes:
    - `Server.swift`: Handlers for API operations.
    - `Types.swift`: Types and protocol definitions.
    - `*.yaml`: The OpenAPI specification for the module.
- **`Tests/`**:
  - Contains unit tests for each module.

---

## Requirements

- Swift 5.7 or later
- macOS 12.0 or later

---

## Installation

### Using Swift Package Manager

Add the following line to the `dependencies` section of your `Package.swift`:

```swift
.package(url: "https://github.com/Contexter/GithubProxyMonorepo.git", from: "1.0.0")
```

Then, add the desired modules to your targets:

```swift
.target(
    name: "MyApp",
    dependencies: [
        .product(name: "Actions", package: "GithubProxyMonorepo"),
        .product(name: "Branches", package: "GithubProxyMonorepo")
    ]
)
```

---

## Usage

1. Register API operation handlers in `Server.swift`:
   ```swift
   let server = UniversalServer()
   let transport = ServerTransport<ServerRequest, ServerResponse>()
   server.registerHandlers(with: transport)
   ```

2. Implement custom logic in `Types.swift` by conforming to `APIProtocol`.

---

## Contributing

Contributions are welcome! To contribute:

1. Fork the repository.
2. Create a feature branch:
   ```bash
   git checkout -b feature/my-feature
   ```
3. Commit your changes:
   ```bash
   git commit -m "Add my feature"
   ```
4. Push your branch and create a pull request.

---

## License

This project is licensed under the [MIT License](LICENSE).

