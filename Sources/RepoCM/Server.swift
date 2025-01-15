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
                try await server.getFileContent(
                    request: $0,
                    body: $1,
                    metadata: $2
                )
            },
            method: .get,
            path: server.apiPathComponentsWithServerPrefix("/repos/{owner}/{repo}/contents/{path}")
        )
        try transport.register(
            {
                try await server.createOrUpdateFile(
                    request: $0,
                    body: $1,
                    metadata: $2
                )
            },
            method: .put,
            path: server.apiPathComponentsWithServerPrefix("/repos/{owner}/{repo}/contents/{path}")
        )
        try transport.register(
            {
                try await server.deleteFile(
                    request: $0,
                    body: $1,
                    metadata: $2
                )
            },
            method: .delete,
            path: server.apiPathComponentsWithServerPrefix("/repos/{owner}/{repo}/contents/{path}")
        )
    }
}

fileprivate extension UniversalServer where APIHandler: APIProtocol {
    /// Get File or Directory Content
    ///
    /// Retrieves the content of a file or directory within the repository.
    ///
    /// - Remark: HTTP `GET /repos/{owner}/{repo}/contents/{path}`.
    /// - Remark: Generated from `#/paths//repos/{owner}/{repo}/contents/{path}/get(getFileContent)`.
    func getFileContent(
        request: HTTPTypes.HTTPRequest,
        body: OpenAPIRuntime.HTTPBody?,
        metadata: OpenAPIRuntime.ServerRequestMetadata
    ) async throws -> (HTTPTypes.HTTPResponse, OpenAPIRuntime.HTTPBody?) {
        try await handle(
            request: request,
            requestBody: body,
            metadata: metadata,
            forOperation: Operations.GetFileContent.id,
            using: {
                APIHandler.getFileContent($0)
            },
            deserializer: { request, requestBody, metadata in
                let path: Operations.GetFileContent.Input.Path = .init(
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
                    path: try converter.getPathParameterAsURI(
                        in: metadata.pathParameters,
                        name: "path",
                        as: Swift.String.self
                    )
                )
                return Operations.GetFileContent.Input(path: path)
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
    /// Create or Update File
    ///
    /// Creates or updates a file within the repository.
    ///
    /// - Remark: HTTP `PUT /repos/{owner}/{repo}/contents/{path}`.
    /// - Remark: Generated from `#/paths//repos/{owner}/{repo}/contents/{path}/put(createOrUpdateFile)`.
    func createOrUpdateFile(
        request: HTTPTypes.HTTPRequest,
        body: OpenAPIRuntime.HTTPBody?,
        metadata: OpenAPIRuntime.ServerRequestMetadata
    ) async throws -> (HTTPTypes.HTTPResponse, OpenAPIRuntime.HTTPBody?) {
        try await handle(
            request: request,
            requestBody: body,
            metadata: metadata,
            forOperation: Operations.CreateOrUpdateFile.id,
            using: {
                APIHandler.createOrUpdateFile($0)
            },
            deserializer: { request, requestBody, metadata in
                let path: Operations.CreateOrUpdateFile.Input.Path = .init(
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
                    path: try converter.getPathParameterAsURI(
                        in: metadata.pathParameters,
                        name: "path",
                        as: Swift.String.self
                    )
                )
                let contentType = converter.extractContentTypeIfPresent(in: request.headerFields)
                let body: Operations.CreateOrUpdateFile.Input.Body
                let chosenContentType = try converter.bestContentType(
                    received: contentType,
                    options: [
                        "application/json"
                    ]
                )
                switch chosenContentType {
                case "application/json":
                    body = try await converter.getRequiredRequestBodyAsJSON(
                        Operations.CreateOrUpdateFile.Input.Body.JsonPayload.self,
                        from: requestBody,
                        transforming: { value in
                            .json(value)
                        }
                    )
                default:
                    preconditionFailure("bestContentType chose an invalid content type.")
                }
                return Operations.CreateOrUpdateFile.Input(
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
    /// Delete File
    ///
    /// Deletes a specific file from the repository.
    ///
    /// - Remark: HTTP `DELETE /repos/{owner}/{repo}/contents/{path}`.
    /// - Remark: Generated from `#/paths//repos/{owner}/{repo}/contents/{path}/delete(deleteFile)`.
    func deleteFile(
        request: HTTPTypes.HTTPRequest,
        body: OpenAPIRuntime.HTTPBody?,
        metadata: OpenAPIRuntime.ServerRequestMetadata
    ) async throws -> (HTTPTypes.HTTPResponse, OpenAPIRuntime.HTTPBody?) {
        try await handle(
            request: request,
            requestBody: body,
            metadata: metadata,
            forOperation: Operations.DeleteFile.id,
            using: {
                APIHandler.deleteFile($0)
            },
            deserializer: { request, requestBody, metadata in
                let path: Operations.DeleteFile.Input.Path = .init(
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
                    path: try converter.getPathParameterAsURI(
                        in: metadata.pathParameters,
                        name: "path",
                        as: Swift.String.self
                    )
                )
                let query: Operations.DeleteFile.Input.Query = .init(
                    message: try converter.getRequiredQueryItemAsURI(
                        in: request.soar_query,
                        style: .form,
                        explode: true,
                        name: "message",
                        as: Swift.String.self
                    ),
                    sha: try converter.getRequiredQueryItemAsURI(
                        in: request.soar_query,
                        style: .form,
                        explode: true,
                        name: "sha",
                        as: Swift.String.self
                    ),
                    branch: try converter.getOptionalQueryItemAsURI(
                        in: request.soar_query,
                        style: .form,
                        explode: true,
                        name: "branch",
                        as: Swift.String.self
                    )
                )
                return Operations.DeleteFile.Input(
                    path: path,
                    query: query
                )
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
