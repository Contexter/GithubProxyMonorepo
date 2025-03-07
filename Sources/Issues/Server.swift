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
import HTTPTypes
extension APIProtocol {
    /// Registers each operation handler with the provided transport.
    /// - Parameters:
    ///   - transport: A transport to which to register the operation handlers.
    ///   - serverURL: A URL used to determine the path prefix for registered
    ///   request handlers.
    ///   - configuration: A set of configuration values for the server.
    ///   - middlewares: A list of middlewares to call before the handler.
    internal func registerHandlers(
        on transport: any ServerTransport,
        serverURL: Foundation.URL = .defaultOpenAPIServerURL,
        configuration: Configuration = .init(),
        middlewares: [any ServerMiddleware] = []
    ) throws {
        let server = UniversalServer(
            serverURL: serverURL,
            handler: self,
            configuration: configuration,
            middlewares: middlewares
        )
        try transport.register(
            {
                try await server.listIssues(
                    request: $0,
                    body: $1,
                    metadata: $2
                )
            },
            method: .get,
            path: server.apiPathComponentsWithServerPrefix("/repos/{owner}/{repo}/issues")
        )
        try transport.register(
            {
                try await server.createIssue(
                    request: $0,
                    body: $1,
                    metadata: $2
                )
            },
            method: .post,
            path: server.apiPathComponentsWithServerPrefix("/repos/{owner}/{repo}/issues")
        )
        try transport.register(
            {
                try await server.getIssue(
                    request: $0,
                    body: $1,
                    metadata: $2
                )
            },
            method: .get,
            path: server.apiPathComponentsWithServerPrefix("/repos/{owner}/{repo}/issues/{issue_number}")
        )
        try transport.register(
            {
                try await server.updateIssue(
                    request: $0,
                    body: $1,
                    metadata: $2
                )
            },
            method: .patch,
            path: server.apiPathComponentsWithServerPrefix("/repos/{owner}/{repo}/issues/{issue_number}")
        )
        try transport.register(
            {
                try await server.deleteIssue(
                    request: $0,
                    body: $1,
                    metadata: $2
                )
            },
            method: .delete,
            path: server.apiPathComponentsWithServerPrefix("/repos/{owner}/{repo}/issues/{issue_number}")
        )
    }
}

fileprivate extension UniversalServer where APIHandler: APIProtocol {
    /// List Issues
    ///
    /// Retrieves a list of issues from the specified repository.
    ///
    /// - Remark: HTTP `GET /repos/{owner}/{repo}/issues`.
    /// - Remark: Generated from `#/paths//repos/{owner}/{repo}/issues/get(listIssues)`.
    func listIssues(
        request: HTTPTypes.HTTPRequest,
        body: OpenAPIRuntime.HTTPBody?,
        metadata: OpenAPIRuntime.ServerRequestMetadata
    ) async throws -> (HTTPTypes.HTTPResponse, OpenAPIRuntime.HTTPBody?) {
        try await handle(
            request: request,
            requestBody: body,
            metadata: metadata,
            forOperation: Operations.ListIssues.id,
            using: {
                APIHandler.listIssues($0)
            },
            deserializer: { request, requestBody, metadata in
                let path: Operations.ListIssues.Input.Path = .init(
                    owner: try converter.getPathParameterAsURI(
                        in: metadata.pathParameters,
                        name: "owner",
                        as: Swift.String.self
                    ),
                    repo: try converter.getPathParameterAsURI(
                        in: metadata.pathParameters,
                        name: "repo",
                        as: Swift.String.self
                    )
                )
                return Operations.ListIssues.Input(path: path)
            },
            serializer: { output, request in
                switch output {
                case let .ok(value):
                    suppressUnusedWarning(value)
                    var response = HTTPTypes.HTTPResponse(soar_statusCode: 200)
                    suppressMutabilityWarning(&response)
                    return (response, nil)
                case let .unauthorized(value):
                    suppressUnusedWarning(value)
                    var response = HTTPTypes.HTTPResponse(soar_statusCode: 401)
                    suppressMutabilityWarning(&response)
                    return (response, nil)
                case let .undocumented(statusCode, _):
                    return (.init(soar_statusCode: statusCode), nil)
                }
            }
        )
    }
    /// Create an Issue
    ///
    /// Creates a new issue in the specified repository.
    ///
    /// - Remark: HTTP `POST /repos/{owner}/{repo}/issues`.
    /// - Remark: Generated from `#/paths//repos/{owner}/{repo}/issues/post(createIssue)`.
    func createIssue(
        request: HTTPTypes.HTTPRequest,
        body: OpenAPIRuntime.HTTPBody?,
        metadata: OpenAPIRuntime.ServerRequestMetadata
    ) async throws -> (HTTPTypes.HTTPResponse, OpenAPIRuntime.HTTPBody?) {
        try await handle(
            request: request,
            requestBody: body,
            metadata: metadata,
            forOperation: Operations.CreateIssue.id,
            using: {
                APIHandler.createIssue($0)
            },
            deserializer: { request, requestBody, metadata in
                let path: Operations.CreateIssue.Input.Path = .init(
                    owner: try converter.getPathParameterAsURI(
                        in: metadata.pathParameters,
                        name: "owner",
                        as: Swift.String.self
                    ),
                    repo: try converter.getPathParameterAsURI(
                        in: metadata.pathParameters,
                        name: "repo",
                        as: Swift.String.self
                    )
                )
                let contentType = converter.extractContentTypeIfPresent(in: request.headerFields)
                let body: Operations.CreateIssue.Input.Body
                let chosenContentType = try converter.bestContentType(
                    received: contentType,
                    options: [
                        "application/json"
                    ]
                )
                switch chosenContentType {
                case "application/json":
                    body = try await converter.getRequiredRequestBodyAsJSON(
                        Operations.CreateIssue.Input.Body.JsonPayload.self,
                        from: requestBody,
                        transforming: { value in
                            .json(value)
                        }
                    )
                default:
                    preconditionFailure("bestContentType chose an invalid content type.")
                }
                return Operations.CreateIssue.Input(
                    path: path,
                    body: body
                )
            },
            serializer: { output, request in
                switch output {
                case let .created(value):
                    suppressUnusedWarning(value)
                    var response = HTTPTypes.HTTPResponse(soar_statusCode: 201)
                    suppressMutabilityWarning(&response)
                    return (response, nil)
                case let .unauthorized(value):
                    suppressUnusedWarning(value)
                    var response = HTTPTypes.HTTPResponse(soar_statusCode: 401)
                    suppressMutabilityWarning(&response)
                    return (response, nil)
                case let .unprocessableContent(value):
                    suppressUnusedWarning(value)
                    var response = HTTPTypes.HTTPResponse(soar_statusCode: 422)
                    suppressMutabilityWarning(&response)
                    return (response, nil)
                case let .undocumented(statusCode, _):
                    return (.init(soar_statusCode: statusCode), nil)
                }
            }
        )
    }
    /// Get an Issue
    ///
    /// Retrieves details of a specific issue.
    ///
    /// - Remark: HTTP `GET /repos/{owner}/{repo}/issues/{issue_number}`.
    /// - Remark: Generated from `#/paths//repos/{owner}/{repo}/issues/{issue_number}/get(getIssue)`.
    func getIssue(
        request: HTTPTypes.HTTPRequest,
        body: OpenAPIRuntime.HTTPBody?,
        metadata: OpenAPIRuntime.ServerRequestMetadata
    ) async throws -> (HTTPTypes.HTTPResponse, OpenAPIRuntime.HTTPBody?) {
        try await handle(
            request: request,
            requestBody: body,
            metadata: metadata,
            forOperation: Operations.GetIssue.id,
            using: {
                APIHandler.getIssue($0)
            },
            deserializer: { request, requestBody, metadata in
                let path: Operations.GetIssue.Input.Path = .init(
                    owner: try converter.getPathParameterAsURI(
                        in: metadata.pathParameters,
                        name: "owner",
                        as: Swift.String.self
                    ),
                    repo: try converter.getPathParameterAsURI(
                        in: metadata.pathParameters,
                        name: "repo",
                        as: Swift.String.self
                    ),
                    issueNumber: try converter.getPathParameterAsURI(
                        in: metadata.pathParameters,
                        name: "issue_number",
                        as: Swift.Int.self
                    )
                )
                return Operations.GetIssue.Input(path: path)
            },
            serializer: { output, request in
                switch output {
                case let .ok(value):
                    suppressUnusedWarning(value)
                    var response = HTTPTypes.HTTPResponse(soar_statusCode: 200)
                    suppressMutabilityWarning(&response)
                    return (response, nil)
                case let .unauthorized(value):
                    suppressUnusedWarning(value)
                    var response = HTTPTypes.HTTPResponse(soar_statusCode: 401)
                    suppressMutabilityWarning(&response)
                    return (response, nil)
                case let .notFound(value):
                    suppressUnusedWarning(value)
                    var response = HTTPTypes.HTTPResponse(soar_statusCode: 404)
                    suppressMutabilityWarning(&response)
                    return (response, nil)
                case let .undocumented(statusCode, _):
                    return (.init(soar_statusCode: statusCode), nil)
                }
            }
        )
    }
    /// Update an Issue
    ///
    /// Updates an existing issue.
    ///
    /// - Remark: HTTP `PATCH /repos/{owner}/{repo}/issues/{issue_number}`.
    /// - Remark: Generated from `#/paths//repos/{owner}/{repo}/issues/{issue_number}/patch(updateIssue)`.
    func updateIssue(
        request: HTTPTypes.HTTPRequest,
        body: OpenAPIRuntime.HTTPBody?,
        metadata: OpenAPIRuntime.ServerRequestMetadata
    ) async throws -> (HTTPTypes.HTTPResponse, OpenAPIRuntime.HTTPBody?) {
        try await handle(
            request: request,
            requestBody: body,
            metadata: metadata,
            forOperation: Operations.UpdateIssue.id,
            using: {
                APIHandler.updateIssue($0)
            },
            deserializer: { request, requestBody, metadata in
                let path: Operations.UpdateIssue.Input.Path = .init(
                    owner: try converter.getPathParameterAsURI(
                        in: metadata.pathParameters,
                        name: "owner",
                        as: Swift.String.self
                    ),
                    repo: try converter.getPathParameterAsURI(
                        in: metadata.pathParameters,
                        name: "repo",
                        as: Swift.String.self
                    ),
                    issueNumber: try converter.getPathParameterAsURI(
                        in: metadata.pathParameters,
                        name: "issue_number",
                        as: Swift.Int.self
                    )
                )
                let contentType = converter.extractContentTypeIfPresent(in: request.headerFields)
                let body: Operations.UpdateIssue.Input.Body
                let chosenContentType = try converter.bestContentType(
                    received: contentType,
                    options: [
                        "application/json"
                    ]
                )
                switch chosenContentType {
                case "application/json":
                    body = try await converter.getRequiredRequestBodyAsJSON(
                        Operations.UpdateIssue.Input.Body.JsonPayload.self,
                        from: requestBody,
                        transforming: { value in
                            .json(value)
                        }
                    )
                default:
                    preconditionFailure("bestContentType chose an invalid content type.")
                }
                return Operations.UpdateIssue.Input(
                    path: path,
                    body: body
                )
            },
            serializer: { output, request in
                switch output {
                case let .ok(value):
                    suppressUnusedWarning(value)
                    var response = HTTPTypes.HTTPResponse(soar_statusCode: 200)
                    suppressMutabilityWarning(&response)
                    return (response, nil)
                case let .unauthorized(value):
                    suppressUnusedWarning(value)
                    var response = HTTPTypes.HTTPResponse(soar_statusCode: 401)
                    suppressMutabilityWarning(&response)
                    return (response, nil)
                case let .notFound(value):
                    suppressUnusedWarning(value)
                    var response = HTTPTypes.HTTPResponse(soar_statusCode: 404)
                    suppressMutabilityWarning(&response)
                    return (response, nil)
                case let .undocumented(statusCode, _):
                    return (.init(soar_statusCode: statusCode), nil)
                }
            }
        )
    }
    /// Delete an Issue
    ///
    /// Deletes a specific issue.
    ///
    /// - Remark: HTTP `DELETE /repos/{owner}/{repo}/issues/{issue_number}`.
    /// - Remark: Generated from `#/paths//repos/{owner}/{repo}/issues/{issue_number}/delete(deleteIssue)`.
    func deleteIssue(
        request: HTTPTypes.HTTPRequest,
        body: OpenAPIRuntime.HTTPBody?,
        metadata: OpenAPIRuntime.ServerRequestMetadata
    ) async throws -> (HTTPTypes.HTTPResponse, OpenAPIRuntime.HTTPBody?) {
        try await handle(
            request: request,
            requestBody: body,
            metadata: metadata,
            forOperation: Operations.DeleteIssue.id,
            using: {
                APIHandler.deleteIssue($0)
            },
            deserializer: { request, requestBody, metadata in
                let path: Operations.DeleteIssue.Input.Path = .init(
                    owner: try converter.getPathParameterAsURI(
                        in: metadata.pathParameters,
                        name: "owner",
                        as: Swift.String.self
                    ),
                    repo: try converter.getPathParameterAsURI(
                        in: metadata.pathParameters,
                        name: "repo",
                        as: Swift.String.self
                    ),
                    issueNumber: try converter.getPathParameterAsURI(
                        in: metadata.pathParameters,
                        name: "issue_number",
                        as: Swift.Int.self
                    )
                )
                return Operations.DeleteIssue.Input(path: path)
            },
            serializer: { output, request in
                switch output {
                case let .noContent(value):
                    suppressUnusedWarning(value)
                    var response = HTTPTypes.HTTPResponse(soar_statusCode: 204)
                    suppressMutabilityWarning(&response)
                    return (response, nil)
                case let .unauthorized(value):
                    suppressUnusedWarning(value)
                    var response = HTTPTypes.HTTPResponse(soar_statusCode: 401)
                    suppressMutabilityWarning(&response)
                    return (response, nil)
                case let .notFound(value):
                    suppressUnusedWarning(value)
                    var response = HTTPTypes.HTTPResponse(soar_statusCode: 404)
                    suppressMutabilityWarning(&response)
                    return (response, nil)
                case let .undocumented(statusCode, _):
                    return (.init(soar_statusCode: statusCode), nil)
                }
            }
        )
    }
}
