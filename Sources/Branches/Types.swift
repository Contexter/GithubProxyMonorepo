// Generated by swift-openapi-generator, do not modify.
@_spi(Generated) import OpenAPIRuntime
#if os(Linux)
@preconcurrency import struct Foundation.URL
@preconcurrency import struct Foundation.Data
@preconcurrency import struct Foundation.Date
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif
/// A type that performs HTTP operations defined by the OpenAPI document.
internal protocol APIProtocol: Sendable {
    /// List Branches
    ///
    /// Retrieves a list of branches in the specified repository.
    ///
    /// - Remark: HTTP `GET /repos/{owner}/{repo}/branches`.
    /// - Remark: Generated from `#/paths//repos/{owner}/{repo}/branches/get(listBranches)`.
    func listBranches(_ input: Operations.ListBranches.Input) async throws -> Operations.ListBranches.Output
    /// Get Branch Details
    ///
    /// Retrieves details of a specific branch.
    ///
    /// - Remark: HTTP `GET /repos/{owner}/{repo}/branches/{branch}`.
    /// - Remark: Generated from `#/paths//repos/{owner}/{repo}/branches/{branch}/get(getBranch)`.
    func getBranch(_ input: Operations.GetBranch.Input) async throws -> Operations.GetBranch.Output
    /// Create Branch (via refs)
    ///
    /// Creates a new branch in the specified repository using refs.
    ///
    /// - Remark: HTTP `POST /repos/{owner}/{repo}/git/refs`.
    /// - Remark: Generated from `#/paths//repos/{owner}/{repo}/git/refs/post(createBranch)`.
    func createBranch(_ input: Operations.CreateBranch.Input) async throws -> Operations.CreateBranch.Output
    /// Delete Branch (via refs)
    ///
    /// Deletes a specific branch reference.
    ///
    /// - Remark: HTTP `DELETE /repos/{owner}/{repo}/git/refs/{ref}`.
    /// - Remark: Generated from `#/paths//repos/{owner}/{repo}/git/refs/{ref}/delete(deleteBranch)`.
    func deleteBranch(_ input: Operations.DeleteBranch.Input) async throws -> Operations.DeleteBranch.Output
}

/// Convenience overloads for operation inputs.
extension APIProtocol {
    /// List Branches
    ///
    /// Retrieves a list of branches in the specified repository.
    ///
    /// - Remark: HTTP `GET /repos/{owner}/{repo}/branches`.
    /// - Remark: Generated from `#/paths//repos/{owner}/{repo}/branches/get(listBranches)`.
    internal func listBranches(path: Operations.ListBranches.Input.Path) async throws -> Operations.ListBranches.Output {
        try await listBranches(Operations.ListBranches.Input(path: path))
    }
    /// Get Branch Details
    ///
    /// Retrieves details of a specific branch.
    ///
    /// - Remark: HTTP `GET /repos/{owner}/{repo}/branches/{branch}`.
    /// - Remark: Generated from `#/paths//repos/{owner}/{repo}/branches/{branch}/get(getBranch)`.
    internal func getBranch(path: Operations.GetBranch.Input.Path) async throws -> Operations.GetBranch.Output {
        try await getBranch(Operations.GetBranch.Input(path: path))
    }
    /// Create Branch (via refs)
    ///
    /// Creates a new branch in the specified repository using refs.
    ///
    /// - Remark: HTTP `POST /repos/{owner}/{repo}/git/refs`.
    /// - Remark: Generated from `#/paths//repos/{owner}/{repo}/git/refs/post(createBranch)`.
    internal func createBranch(
        path: Operations.CreateBranch.Input.Path,
        body: Operations.CreateBranch.Input.Body
    ) async throws -> Operations.CreateBranch.Output {
        try await createBranch(Operations.CreateBranch.Input(
            path: path,
            body: body
        ))
    }
    /// Delete Branch (via refs)
    ///
    /// Deletes a specific branch reference.
    ///
    /// - Remark: HTTP `DELETE /repos/{owner}/{repo}/git/refs/{ref}`.
    /// - Remark: Generated from `#/paths//repos/{owner}/{repo}/git/refs/{ref}/delete(deleteBranch)`.
    internal func deleteBranch(path: Operations.DeleteBranch.Input.Path) async throws -> Operations.DeleteBranch.Output {
        try await deleteBranch(Operations.DeleteBranch.Input(path: path))
    }
}

/// Server URLs defined in the OpenAPI document.
internal enum Servers {
    /// Proxy server for GitHub repository branches.
    internal enum Server1 {
        /// Proxy server for GitHub repository branches.
        internal static func url() throws -> Foundation.URL {
            try Foundation.URL(
                validatingOpenAPIServerURL: "https://branches.pm.fountain.coach",
                variables: []
            )
        }
    }
    /// Proxy server for GitHub repository branches.
    @available(*, deprecated, renamed: "Servers.Server1.url")
    internal static func server1() throws -> Foundation.URL {
        try Foundation.URL(
            validatingOpenAPIServerURL: "https://branches.pm.fountain.coach",
            variables: []
        )
    }
}

/// Types generated from the components section of the OpenAPI document.
internal enum Components {
    /// Types generated from the `#/components/schemas` section of the OpenAPI document.
    internal enum Schemas {}
    /// Types generated from the `#/components/parameters` section of the OpenAPI document.
    internal enum Parameters {}
    /// Types generated from the `#/components/requestBodies` section of the OpenAPI document.
    internal enum RequestBodies {}
    /// Types generated from the `#/components/responses` section of the OpenAPI document.
    internal enum Responses {}
    /// Types generated from the `#/components/headers` section of the OpenAPI document.
    internal enum Headers {}
}

/// API operations, with input and output types, generated from `#/paths` in the OpenAPI document.
internal enum Operations {
    /// List Branches
    ///
    /// Retrieves a list of branches in the specified repository.
    ///
    /// - Remark: HTTP `GET /repos/{owner}/{repo}/branches`.
    /// - Remark: Generated from `#/paths//repos/{owner}/{repo}/branches/get(listBranches)`.
    internal enum ListBranches {
        internal static let id: Swift.String = "listBranches"
        internal struct Input: Sendable, Hashable {
            /// - Remark: Generated from `#/paths/repos/{owner}/{repo}/branches/GET/path`.
            internal struct Path: Sendable, Hashable {
                /// - Remark: Generated from `#/paths/repos/{owner}/{repo}/branches/GET/path/owner`.
                internal var owner: Swift.String
                /// - Remark: Generated from `#/paths/repos/{owner}/{repo}/branches/GET/path/repo`.
                internal var repo: Swift.String
                /// Creates a new `Path`.
                ///
                /// - Parameters:
                ///   - owner:
                ///   - repo:
                internal init(
                    owner: Swift.String,
                    repo: Swift.String
                ) {
                    self.owner = owner
                    self.repo = repo
                }
            }
            internal var path: Operations.ListBranches.Input.Path
            /// Creates a new `Input`.
            ///
            /// - Parameters:
            ///   - path:
            internal init(path: Operations.ListBranches.Input.Path) {
                self.path = path
            }
        }
        internal enum Output: Sendable, Hashable {
            internal struct Ok: Sendable, Hashable {
                /// Creates a new `Ok`.
                internal init() {}
            }
            /// List of branches retrieved successfully.
            ///
            /// - Remark: Generated from `#/paths//repos/{owner}/{repo}/branches/get(listBranches)/responses/200`.
            ///
            /// HTTP response code: `200 ok`.
            case ok(Operations.ListBranches.Output.Ok)
            /// List of branches retrieved successfully.
            ///
            /// - Remark: Generated from `#/paths//repos/{owner}/{repo}/branches/get(listBranches)/responses/200`.
            ///
            /// HTTP response code: `200 ok`.
            internal static var ok: Self {
                .ok(.init())
            }
            /// The associated value of the enum case if `self` is `.ok`.
            ///
            /// - Throws: An error if `self` is not `.ok`.
            /// - SeeAlso: `.ok`.
            internal var ok: Operations.ListBranches.Output.Ok {
                get throws {
                    switch self {
                    case let .ok(response):
                        return response
                    default:
                        try throwUnexpectedResponseStatus(
                            expectedStatus: "ok",
                            response: self
                        )
                    }
                }
            }
            internal struct Unauthorized: Sendable, Hashable {
                /// Creates a new `Unauthorized`.
                internal init() {}
            }
            /// Unauthorized.
            ///
            /// - Remark: Generated from `#/paths//repos/{owner}/{repo}/branches/get(listBranches)/responses/401`.
            ///
            /// HTTP response code: `401 unauthorized`.
            case unauthorized(Operations.ListBranches.Output.Unauthorized)
            /// Unauthorized.
            ///
            /// - Remark: Generated from `#/paths//repos/{owner}/{repo}/branches/get(listBranches)/responses/401`.
            ///
            /// HTTP response code: `401 unauthorized`.
            internal static var unauthorized: Self {
                .unauthorized(.init())
            }
            /// The associated value of the enum case if `self` is `.unauthorized`.
            ///
            /// - Throws: An error if `self` is not `.unauthorized`.
            /// - SeeAlso: `.unauthorized`.
            internal var unauthorized: Operations.ListBranches.Output.Unauthorized {
                get throws {
                    switch self {
                    case let .unauthorized(response):
                        return response
                    default:
                        try throwUnexpectedResponseStatus(
                            expectedStatus: "unauthorized",
                            response: self
                        )
                    }
                }
            }
            /// Undocumented response.
            ///
            /// A response with a code that is not documented in the OpenAPI document.
            case undocumented(statusCode: Swift.Int, OpenAPIRuntime.UndocumentedPayload)
        }
    }
    /// Get Branch Details
    ///
    /// Retrieves details of a specific branch.
    ///
    /// - Remark: HTTP `GET /repos/{owner}/{repo}/branches/{branch}`.
    /// - Remark: Generated from `#/paths//repos/{owner}/{repo}/branches/{branch}/get(getBranch)`.
    internal enum GetBranch {
        internal static let id: Swift.String = "getBranch"
        internal struct Input: Sendable, Hashable {
            /// - Remark: Generated from `#/paths/repos/{owner}/{repo}/branches/{branch}/GET/path`.
            internal struct Path: Sendable, Hashable {
                /// - Remark: Generated from `#/paths/repos/{owner}/{repo}/branches/{branch}/GET/path/owner`.
                internal var owner: Swift.String
                /// - Remark: Generated from `#/paths/repos/{owner}/{repo}/branches/{branch}/GET/path/repo`.
                internal var repo: Swift.String
                /// - Remark: Generated from `#/paths/repos/{owner}/{repo}/branches/{branch}/GET/path/branch`.
                internal var branch: Swift.String
                /// Creates a new `Path`.
                ///
                /// - Parameters:
                ///   - owner:
                ///   - repo:
                ///   - branch:
                internal init(
                    owner: Swift.String,
                    repo: Swift.String,
                    branch: Swift.String
                ) {
                    self.owner = owner
                    self.repo = repo
                    self.branch = branch
                }
            }
            internal var path: Operations.GetBranch.Input.Path
            /// Creates a new `Input`.
            ///
            /// - Parameters:
            ///   - path:
            internal init(path: Operations.GetBranch.Input.Path) {
                self.path = path
            }
        }
        internal enum Output: Sendable, Hashable {
            internal struct Ok: Sendable, Hashable {
                /// Creates a new `Ok`.
                internal init() {}
            }
            /// Branch details retrieved successfully.
            ///
            /// - Remark: Generated from `#/paths//repos/{owner}/{repo}/branches/{branch}/get(getBranch)/responses/200`.
            ///
            /// HTTP response code: `200 ok`.
            case ok(Operations.GetBranch.Output.Ok)
            /// Branch details retrieved successfully.
            ///
            /// - Remark: Generated from `#/paths//repos/{owner}/{repo}/branches/{branch}/get(getBranch)/responses/200`.
            ///
            /// HTTP response code: `200 ok`.
            internal static var ok: Self {
                .ok(.init())
            }
            /// The associated value of the enum case if `self` is `.ok`.
            ///
            /// - Throws: An error if `self` is not `.ok`.
            /// - SeeAlso: `.ok`.
            internal var ok: Operations.GetBranch.Output.Ok {
                get throws {
                    switch self {
                    case let .ok(response):
                        return response
                    default:
                        try throwUnexpectedResponseStatus(
                            expectedStatus: "ok",
                            response: self
                        )
                    }
                }
            }
            internal struct Unauthorized: Sendable, Hashable {
                /// Creates a new `Unauthorized`.
                internal init() {}
            }
            /// Unauthorized.
            ///
            /// - Remark: Generated from `#/paths//repos/{owner}/{repo}/branches/{branch}/get(getBranch)/responses/401`.
            ///
            /// HTTP response code: `401 unauthorized`.
            case unauthorized(Operations.GetBranch.Output.Unauthorized)
            /// Unauthorized.
            ///
            /// - Remark: Generated from `#/paths//repos/{owner}/{repo}/branches/{branch}/get(getBranch)/responses/401`.
            ///
            /// HTTP response code: `401 unauthorized`.
            internal static var unauthorized: Self {
                .unauthorized(.init())
            }
            /// The associated value of the enum case if `self` is `.unauthorized`.
            ///
            /// - Throws: An error if `self` is not `.unauthorized`.
            /// - SeeAlso: `.unauthorized`.
            internal var unauthorized: Operations.GetBranch.Output.Unauthorized {
                get throws {
                    switch self {
                    case let .unauthorized(response):
                        return response
                    default:
                        try throwUnexpectedResponseStatus(
                            expectedStatus: "unauthorized",
                            response: self
                        )
                    }
                }
            }
            internal struct NotFound: Sendable, Hashable {
                /// Creates a new `NotFound`.
                internal init() {}
            }
            /// Branch not found.
            ///
            /// - Remark: Generated from `#/paths//repos/{owner}/{repo}/branches/{branch}/get(getBranch)/responses/404`.
            ///
            /// HTTP response code: `404 notFound`.
            case notFound(Operations.GetBranch.Output.NotFound)
            /// Branch not found.
            ///
            /// - Remark: Generated from `#/paths//repos/{owner}/{repo}/branches/{branch}/get(getBranch)/responses/404`.
            ///
            /// HTTP response code: `404 notFound`.
            internal static var notFound: Self {
                .notFound(.init())
            }
            /// The associated value of the enum case if `self` is `.notFound`.
            ///
            /// - Throws: An error if `self` is not `.notFound`.
            /// - SeeAlso: `.notFound`.
            internal var notFound: Operations.GetBranch.Output.NotFound {
                get throws {
                    switch self {
                    case let .notFound(response):
                        return response
                    default:
                        try throwUnexpectedResponseStatus(
                            expectedStatus: "notFound",
                            response: self
                        )
                    }
                }
            }
            /// Undocumented response.
            ///
            /// A response with a code that is not documented in the OpenAPI document.
            case undocumented(statusCode: Swift.Int, OpenAPIRuntime.UndocumentedPayload)
        }
    }
    /// Create Branch (via refs)
    ///
    /// Creates a new branch in the specified repository using refs.
    ///
    /// - Remark: HTTP `POST /repos/{owner}/{repo}/git/refs`.
    /// - Remark: Generated from `#/paths//repos/{owner}/{repo}/git/refs/post(createBranch)`.
    internal enum CreateBranch {
        internal static let id: Swift.String = "createBranch"
        internal struct Input: Sendable, Hashable {
            /// - Remark: Generated from `#/paths/repos/{owner}/{repo}/git/refs/POST/path`.
            internal struct Path: Sendable, Hashable {
                /// - Remark: Generated from `#/paths/repos/{owner}/{repo}/git/refs/POST/path/owner`.
                internal var owner: Swift.String
                /// - Remark: Generated from `#/paths/repos/{owner}/{repo}/git/refs/POST/path/repo`.
                internal var repo: Swift.String
                /// Creates a new `Path`.
                ///
                /// - Parameters:
                ///   - owner:
                ///   - repo:
                internal init(
                    owner: Swift.String,
                    repo: Swift.String
                ) {
                    self.owner = owner
                    self.repo = repo
                }
            }
            internal var path: Operations.CreateBranch.Input.Path
            /// - Remark: Generated from `#/paths/repos/{owner}/{repo}/git/refs/POST/requestBody`.
            internal enum Body: Sendable, Hashable {
                /// - Remark: Generated from `#/paths/repos/{owner}/{repo}/git/refs/POST/requestBody/json`.
                internal struct JsonPayload: Codable, Hashable, Sendable {
                    /// - Remark: Generated from `#/paths/repos/{owner}/{repo}/git/refs/POST/requestBody/json/ref`.
                    internal var ref: Swift.String?
                    /// - Remark: Generated from `#/paths/repos/{owner}/{repo}/git/refs/POST/requestBody/json/sha`.
                    internal var sha: Swift.String?
                    /// Creates a new `JsonPayload`.
                    ///
                    /// - Parameters:
                    ///   - ref:
                    ///   - sha:
                    internal init(
                        ref: Swift.String? = nil,
                        sha: Swift.String? = nil
                    ) {
                        self.ref = ref
                        self.sha = sha
                    }
                    internal enum CodingKeys: String, CodingKey {
                        case ref
                        case sha
                    }
                }
                /// - Remark: Generated from `#/paths/repos/{owner}/{repo}/git/refs/POST/requestBody/content/application\/json`.
                case json(Operations.CreateBranch.Input.Body.JsonPayload)
            }
            internal var body: Operations.CreateBranch.Input.Body
            /// Creates a new `Input`.
            ///
            /// - Parameters:
            ///   - path:
            ///   - body:
            internal init(
                path: Operations.CreateBranch.Input.Path,
                body: Operations.CreateBranch.Input.Body
            ) {
                self.path = path
                self.body = body
            }
        }
        internal enum Output: Sendable, Hashable {
            internal struct Created: Sendable, Hashable {
                /// Creates a new `Created`.
                internal init() {}
            }
            /// Branch created successfully.
            ///
            /// - Remark: Generated from `#/paths//repos/{owner}/{repo}/git/refs/post(createBranch)/responses/201`.
            ///
            /// HTTP response code: `201 created`.
            case created(Operations.CreateBranch.Output.Created)
            /// Branch created successfully.
            ///
            /// - Remark: Generated from `#/paths//repos/{owner}/{repo}/git/refs/post(createBranch)/responses/201`.
            ///
            /// HTTP response code: `201 created`.
            internal static var created: Self {
                .created(.init())
            }
            /// The associated value of the enum case if `self` is `.created`.
            ///
            /// - Throws: An error if `self` is not `.created`.
            /// - SeeAlso: `.created`.
            internal var created: Operations.CreateBranch.Output.Created {
                get throws {
                    switch self {
                    case let .created(response):
                        return response
                    default:
                        try throwUnexpectedResponseStatus(
                            expectedStatus: "created",
                            response: self
                        )
                    }
                }
            }
            internal struct Unauthorized: Sendable, Hashable {
                /// Creates a new `Unauthorized`.
                internal init() {}
            }
            /// Unauthorized.
            ///
            /// - Remark: Generated from `#/paths//repos/{owner}/{repo}/git/refs/post(createBranch)/responses/401`.
            ///
            /// HTTP response code: `401 unauthorized`.
            case unauthorized(Operations.CreateBranch.Output.Unauthorized)
            /// Unauthorized.
            ///
            /// - Remark: Generated from `#/paths//repos/{owner}/{repo}/git/refs/post(createBranch)/responses/401`.
            ///
            /// HTTP response code: `401 unauthorized`.
            internal static var unauthorized: Self {
                .unauthorized(.init())
            }
            /// The associated value of the enum case if `self` is `.unauthorized`.
            ///
            /// - Throws: An error if `self` is not `.unauthorized`.
            /// - SeeAlso: `.unauthorized`.
            internal var unauthorized: Operations.CreateBranch.Output.Unauthorized {
                get throws {
                    switch self {
                    case let .unauthorized(response):
                        return response
                    default:
                        try throwUnexpectedResponseStatus(
                            expectedStatus: "unauthorized",
                            response: self
                        )
                    }
                }
            }
            internal struct UnprocessableContent: Sendable, Hashable {
                /// Creates a new `UnprocessableContent`.
                internal init() {}
            }
            /// Validation failed.
            ///
            /// - Remark: Generated from `#/paths//repos/{owner}/{repo}/git/refs/post(createBranch)/responses/422`.
            ///
            /// HTTP response code: `422 unprocessableContent`.
            case unprocessableContent(Operations.CreateBranch.Output.UnprocessableContent)
            /// Validation failed.
            ///
            /// - Remark: Generated from `#/paths//repos/{owner}/{repo}/git/refs/post(createBranch)/responses/422`.
            ///
            /// HTTP response code: `422 unprocessableContent`.
            internal static var unprocessableContent: Self {
                .unprocessableContent(.init())
            }
            /// The associated value of the enum case if `self` is `.unprocessableContent`.
            ///
            /// - Throws: An error if `self` is not `.unprocessableContent`.
            /// - SeeAlso: `.unprocessableContent`.
            internal var unprocessableContent: Operations.CreateBranch.Output.UnprocessableContent {
                get throws {
                    switch self {
                    case let .unprocessableContent(response):
                        return response
                    default:
                        try throwUnexpectedResponseStatus(
                            expectedStatus: "unprocessableContent",
                            response: self
                        )
                    }
                }
            }
            /// Undocumented response.
            ///
            /// A response with a code that is not documented in the OpenAPI document.
            case undocumented(statusCode: Swift.Int, OpenAPIRuntime.UndocumentedPayload)
        }
    }
    /// Delete Branch (via refs)
    ///
    /// Deletes a specific branch reference.
    ///
    /// - Remark: HTTP `DELETE /repos/{owner}/{repo}/git/refs/{ref}`.
    /// - Remark: Generated from `#/paths//repos/{owner}/{repo}/git/refs/{ref}/delete(deleteBranch)`.
    internal enum DeleteBranch {
        internal static let id: Swift.String = "deleteBranch"
        internal struct Input: Sendable, Hashable {
            /// - Remark: Generated from `#/paths/repos/{owner}/{repo}/git/refs/{ref}/DELETE/path`.
            internal struct Path: Sendable, Hashable {
                /// - Remark: Generated from `#/paths/repos/{owner}/{repo}/git/refs/{ref}/DELETE/path/owner`.
                internal var owner: Swift.String
                /// - Remark: Generated from `#/paths/repos/{owner}/{repo}/git/refs/{ref}/DELETE/path/repo`.
                internal var repo: Swift.String
                /// - Remark: Generated from `#/paths/repos/{owner}/{repo}/git/refs/{ref}/DELETE/path/ref`.
                internal var ref: Swift.String
                /// Creates a new `Path`.
                ///
                /// - Parameters:
                ///   - owner:
                ///   - repo:
                ///   - ref:
                internal init(
                    owner: Swift.String,
                    repo: Swift.String,
                    ref: Swift.String
                ) {
                    self.owner = owner
                    self.repo = repo
                    self.ref = ref
                }
            }
            internal var path: Operations.DeleteBranch.Input.Path
            /// Creates a new `Input`.
            ///
            /// - Parameters:
            ///   - path:
            internal init(path: Operations.DeleteBranch.Input.Path) {
                self.path = path
            }
        }
        internal enum Output: Sendable, Hashable {
            internal struct NoContent: Sendable, Hashable {
                /// Creates a new `NoContent`.
                internal init() {}
            }
            /// Branch deleted successfully.
            ///
            /// - Remark: Generated from `#/paths//repos/{owner}/{repo}/git/refs/{ref}/delete(deleteBranch)/responses/204`.
            ///
            /// HTTP response code: `204 noContent`.
            case noContent(Operations.DeleteBranch.Output.NoContent)
            /// Branch deleted successfully.
            ///
            /// - Remark: Generated from `#/paths//repos/{owner}/{repo}/git/refs/{ref}/delete(deleteBranch)/responses/204`.
            ///
            /// HTTP response code: `204 noContent`.
            internal static var noContent: Self {
                .noContent(.init())
            }
            /// The associated value of the enum case if `self` is `.noContent`.
            ///
            /// - Throws: An error if `self` is not `.noContent`.
            /// - SeeAlso: `.noContent`.
            internal var noContent: Operations.DeleteBranch.Output.NoContent {
                get throws {
                    switch self {
                    case let .noContent(response):
                        return response
                    default:
                        try throwUnexpectedResponseStatus(
                            expectedStatus: "noContent",
                            response: self
                        )
                    }
                }
            }
            internal struct Unauthorized: Sendable, Hashable {
                /// Creates a new `Unauthorized`.
                internal init() {}
            }
            /// Unauthorized.
            ///
            /// - Remark: Generated from `#/paths//repos/{owner}/{repo}/git/refs/{ref}/delete(deleteBranch)/responses/401`.
            ///
            /// HTTP response code: `401 unauthorized`.
            case unauthorized(Operations.DeleteBranch.Output.Unauthorized)
            /// Unauthorized.
            ///
            /// - Remark: Generated from `#/paths//repos/{owner}/{repo}/git/refs/{ref}/delete(deleteBranch)/responses/401`.
            ///
            /// HTTP response code: `401 unauthorized`.
            internal static var unauthorized: Self {
                .unauthorized(.init())
            }
            /// The associated value of the enum case if `self` is `.unauthorized`.
            ///
            /// - Throws: An error if `self` is not `.unauthorized`.
            /// - SeeAlso: `.unauthorized`.
            internal var unauthorized: Operations.DeleteBranch.Output.Unauthorized {
                get throws {
                    switch self {
                    case let .unauthorized(response):
                        return response
                    default:
                        try throwUnexpectedResponseStatus(
                            expectedStatus: "unauthorized",
                            response: self
                        )
                    }
                }
            }
            internal struct NotFound: Sendable, Hashable {
                /// Creates a new `NotFound`.
                internal init() {}
            }
            /// Branch not found.
            ///
            /// - Remark: Generated from `#/paths//repos/{owner}/{repo}/git/refs/{ref}/delete(deleteBranch)/responses/404`.
            ///
            /// HTTP response code: `404 notFound`.
            case notFound(Operations.DeleteBranch.Output.NotFound)
            /// Branch not found.
            ///
            /// - Remark: Generated from `#/paths//repos/{owner}/{repo}/git/refs/{ref}/delete(deleteBranch)/responses/404`.
            ///
            /// HTTP response code: `404 notFound`.
            internal static var notFound: Self {
                .notFound(.init())
            }
            /// The associated value of the enum case if `self` is `.notFound`.
            ///
            /// - Throws: An error if `self` is not `.notFound`.
            /// - SeeAlso: `.notFound`.
            internal var notFound: Operations.DeleteBranch.Output.NotFound {
                get throws {
                    switch self {
                    case let .notFound(response):
                        return response
                    default:
                        try throwUnexpectedResponseStatus(
                            expectedStatus: "notFound",
                            response: self
                        )
                    }
                }
            }
            /// Undocumented response.
            ///
            /// A response with a code that is not documented in the OpenAPI document.
            case undocumented(statusCode: Swift.Int, OpenAPIRuntime.UndocumentedPayload)
        }
    }
}
