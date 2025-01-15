import XCTest
@testable import Issues

final class IssuesTests: XCTestCase {

    func testServerAndTypesContentReplaced() throws {
        // Paths to the source files
        let currentDir = FileManager.default.currentDirectoryPath
        let serverFilePath = "/Users/benedikteickhoff/Development/GithubProxyMonorepo/Sources/Issues/Server.swift"
        let typesFilePath = "/Users/benedikteickhoff/Development/GithubProxyMonorepo/Sources/Issues/Types.swift"
        
        // Placeholder strings
        let serverPlaceholder = "// REPLACE_THIS_TAG - Server.swift"
        let typesPlaceholder = "// REPLACE_THIS_TAG - Types.swift"
        
        // Read file contents
        let serverContent = try String(contentsOfFile: serverFilePath, encoding: .utf8)
        let typesContent = try String(contentsOfFile: typesFilePath, encoding: .utf8)
        
        // Assert that placeholders are no longer present
        XCTAssertFalse(serverContent.contains(serverPlaceholder), "Server.swift still contains placeholder content.")
        XCTAssertFalse(typesContent.contains(typesPlaceholder), "Types.swift still contains placeholder content.")
    }
}