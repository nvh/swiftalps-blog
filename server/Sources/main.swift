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

// Handle HTTP GET requests to /
router.get("/") {
    request, response, next in
        staticServer.handle(request: request, response: response, next: next)
}



// Add an HTTP server and connect it to the router
Kitura.addHTTPServer(onPort: 8090, with: router)

// Start the Kitura runloop (this call never returns)
Kitura.run()
