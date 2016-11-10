import Kitura
import HeliumLogger
import Foundation

// Create a new router
let router = Router()

// Initialize HeliumLogger
HeliumLogger.use()

let fileManager = FileManager.default

let staticServer = StaticFileServer(path: "../web/")

print(fileManager.currentDirectoryPath)
let currentDirectoryURL = URL(fileURLWithPath: fileManager.currentDirectoryPath)

// Handle HTTP GET requests to /
router.get("/") {
    request, response, next in
        staticServer.handle(request: request, response: response, next: next)
}

let postsServer = StaticFileServer(path: "../content/")

if #available(macOS 10.12, *) {
router.get("/posts/:identifier") {
    request, response, next in
    print(request)
    guard let identifier = request.parameters["identifier"] else {
        response.send("Not found")
        next()
        return
    }
    let fileURL = URL(fileURLWithPath: "../content/\(identifier).json", relativeTo: currentDirectoryURL)
    print(fileURL)
    guard let data = try? Data(contentsOf: fileURL),
          let json = String(data: data, encoding: String.Encoding.utf8) else {
        response.send("Not found: \(identifier)")
        next()
        return
    }
    response.send(json)
    next()
}

router.get("/posts") {
    request, response, next in
    let contentDirectory = URL(fileURLWithPath: "../content", isDirectory: true, relativeTo: currentDirectoryURL)
    guard let urls = try? fileManager.contentsOfDirectory(at: contentDirectory, includingPropertiesForKeys: nil, options: []) else {
        print("[]")
        next()
        return
    }
    var contents: [String] = []
    for url in urls {
        guard let data = try? Data(contentsOf: url),
            let json = String(data: data, encoding: String.Encoding.utf8) else {
                response.send("[]")
                next()
                return
        }
        contents.append(json)
    }
    let result = contents.joined(separator:",")
    response.send("{\"posts\":[\(result)]}")
    next()
}

}


// Add an HTTP server and connect it to the router
Kitura.addHTTPServer(onPort: 8090, with: router)

// Start the Kitura runloop (this call never returns)
Kitura.run()
