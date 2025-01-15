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
                try await server.listLabels(
                    request: $0,
                    body: $1,
                    metadata: $2
                )
            },
            method: .get,
            path: server.apiPathComponentsWithServerPrefix("/repos/{owner}/{repo}/labels")
        )
        try transport.register(
            {
                try await server.createLabel(
                    request: $0,
                    body: $1,
                    metadata: $2
                )
            },
            method: .post,
            path: server.apiPathComponentsWithServerPrefix("/repos/{owner}/{repo}/labels")
        )
        try transport.register(
            {
                try await server.getLabel(
                    request: $0,
                    body: $1,
                    metadata: $2
                )
            },
            method: .get,
            path: server.apiPathComponentsWithServerPrefix("/repos/{owner}/{repo}/labels/{name}")
        )
        try transport.register(
            {
                try await server.updateLabel(
                    request: $0,
                    body: $1,
                    metadata: $2
                )
            },
            method: .patch,
            path: server.apiPathComponentsWithServerPrefix("/repos/{owner}/{repo}/labels/{name}")
        )
        try transport.register(
            {
                try await server.deleteLabel(
                    request: $0,
                    body: $1,
                    metadata: $2
                )
            },
            method: .delete,
            path: server.apiPathComponentsWithServerPrefix("/repos/{owner}/{repo}/labels/{name}")
        )
    }
}

fileprivate extension UniversalServer where APIHandler: APIProtocol {
    /// List Labels
    ///
    /// Retrieves a list of labels in the repository.
    ///
    /// - Remark: HTTP `GET /repos/{owner}/{repo}/labels`.
    /// - Remark: Generated from `#/paths//repos/{owner}/{repo}/labels/get(listLabels)`.
    func listLabels(
        request: HTTPTypes.HTTPRequest,
        body: OpenAPIRuntime.HTTPBody?,
        metadata: OpenAPIRuntime.ServerRequestMetadata
    ) async throws -> (HTTPTypes.HTTPResponse, OpenAPIRuntime.HTTPBody?) {
        try await handle(
            request: request,
            requestBody: body,
            metadata: metadata,
            forOperation: Operations.ListLabels.id,
            using: {
                APIHandler.listLabels($0)
            },
            deserializer: { request, requestBody, metadata in
                let path: Operations.ListLabels.Input.Path = .init(
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
                return Operations.ListLabels.Input(path: path)
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
    /// Create a Label
    ///
    /// Creates a new label in the specified repository.
    ///
    /// - Remark: HTTP `POST /repos/{owner}/{repo}/labels`.
    /// - Remark: Generated from `#/paths//repos/{owner}/{repo}/labels/post(createLabel)`.
    func createLabel(
        request: HTTPTypes.HTTPRequest,
        body: OpenAPIRuntime.HTTPBody?,
        metadata: OpenAPIRuntime.ServerRequestMetadata
    ) async throws -> (HTTPTypes.HTTPResponse, OpenAPIRuntime.HTTPBody?) {
        try await handle(
            request: request,
            requestBody: body,
            metadata: metadata,
            forOperation: Operations.CreateLabel.id,
            using: {
                APIHandler.createLabel($0)
            },
            deserializer: { request, requestBody, metadata in
                let path: Operations.CreateLabel.Input.Path = .init(
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
                let body: Operations.CreateLabel.Input.Body
                let chosenContentType = try converter.bestContentType(
                    received: contentType,
                    options: [
                        "application/json"
                    ]
                )
                switch chosenContentType {
                case "application/json":
                    body = try await converter.getRequiredRequestBodyAsJSON(
                        Operations.CreateLabel.Input.Body.JsonPayload.self,
                        from: requestBody,
                        transforming: { value in
                            .json(value)
                        }
                    )
                default:
                    preconditionFailure("bestContentType chose an invalid content type.")
                }
                return Operations.CreateLabel.Input(
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
    /// Get a Label
    ///
    /// Retrieves details of a specific label by name.
    ///
    /// - Remark: HTTP `GET /repos/{owner}/{repo}/labels/{name}`.
    /// - Remark: Generated from `#/paths//repos/{owner}/{repo}/labels/{name}/get(getLabel)`.
    func getLabel(
        request: HTTPTypes.HTTPRequest,
        body: OpenAPIRuntime.HTTPBody?,
        metadata: OpenAPIRuntime.ServerRequestMetadata
    ) async throws -> (HTTPTypes.HTTPResponse, OpenAPIRuntime.HTTPBody?) {
        try await handle(
            request: request,
            requestBody: body,
            metadata: metadata,
            forOperation: Operations.GetLabel.id,
            using: {
                APIHandler.getLabel($0)
            },
            deserializer: { request, requestBody, metadata in
                let path: Operations.GetLabel.Input.Path = .init(
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
                    name: try converter.getPathParameterAsURI(
                        in: metadata.pathParameters,
                        name: "name",
                        as: Swift.String.self
                    )
                )
                return Operations.GetLabel.Input(path: path)
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
    /// Update a Label
    ///
    /// Updates an existing label.
    ///
    /// - Remark: HTTP `PATCH /repos/{owner}/{repo}/labels/{name}`.
    /// - Remark: Generated from `#/paths//repos/{owner}/{repo}/labels/{name}/patch(updateLabel)`.
    func updateLabel(
        request: HTTPTypes.HTTPRequest,
        body: OpenAPIRuntime.HTTPBody?,
        metadata: OpenAPIRuntime.ServerRequestMetadata
    ) async throws -> (HTTPTypes.HTTPResponse, OpenAPIRuntime.HTTPBody?) {
        try await handle(
            request: request,
            requestBody: body,
            metadata: metadata,
            forOperation: Operations.UpdateLabel.id,
            using: {
                APIHandler.updateLabel($0)
            },
            deserializer: { request, requestBody, metadata in
                let path: Operations.UpdateLabel.Input.Path = .init(
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
                    name: try converter.getPathParameterAsURI(
                        in: metadata.pathParameters,
                        name: "name",
                        as: Swift.String.self
                    )
                )
                let contentType = converter.extractContentTypeIfPresent(in: request.headerFields)
                let body: Operations.UpdateLabel.Input.Body
                let chosenContentType = try converter.bestContentType(
                    received: contentType,
                    options: [
                        "application/json"
                    ]
                )
                switch chosenContentType {
                case "application/json":
                    body = try await converter.getRequiredRequestBodyAsJSON(
                        Operations.UpdateLabel.Input.Body.JsonPayload.self,
                        from: requestBody,
                        transforming: { value in
                            .json(value)
                        }
                    )
                default:
                    preconditionFailure("bestContentType chose an invalid content type.")
                }
                return Operations.UpdateLabel.Input(
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
    /// Delete a Label
    ///
    /// Deletes a specific label.
    ///
    /// - Remark: HTTP `DELETE /repos/{owner}/{repo}/labels/{name}`.
    /// - Remark: Generated from `#/paths//repos/{owner}/{repo}/labels/{name}/delete(deleteLabel)`.
    func deleteLabel(
        request: HTTPTypes.HTTPRequest,
        body: OpenAPIRuntime.HTTPBody?,
        metadata: OpenAPIRuntime.ServerRequestMetadata
    ) async throws -> (HTTPTypes.HTTPResponse, OpenAPIRuntime.HTTPBody?) {
        try await handle(
            request: request,
            requestBody: body,
            metadata: metadata,
            forOperation: Operations.DeleteLabel.id,
            using: {
                APIHandler.deleteLabel($0)
            },
            deserializer: { request, requestBody, metadata in
                let path: Operations.DeleteLabel.Input.Path = .init(
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
                    name: try converter.getPathParameterAsURI(
                        in: metadata.pathParameters,
                        name: "name",
                        as: Swift.String.self
                    )
                )
                return Operations.DeleteLabel.Input(path: path)
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
