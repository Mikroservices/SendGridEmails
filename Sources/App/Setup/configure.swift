import Vapor
import SendGrid

/// Called before your application initializes.
public func configure(_ config: inout Config, _ env: inout Environment, _ services: inout Services) throws {

    /// Register routes to the router.
    try registerRoutes(services: &services)

    /// Register middleware.
    registerMiddlewares(services: &services)

    /// Register SendGrid provider.
    try registerSendGridProvider(services: &services)
}

private func registerMiddlewares(services: inout Services) {
    var middlewares = MiddlewareConfig() // Create _empty_ middleware config
    middlewares.use(ErrorMiddleware.self) // Catches errors and converts to HTTP response
    services.register(middlewares)
}

private func registerRoutes(services: inout Services) throws {
    let router = EngineRouter.default()
    try routes(router)
    services.register(router, as: Router.self)
}

private func registerSendGridProvider(services: inout Services) throws {

    guard let apiKey = Environment.get("MIKROSERVICE_SENDGRIDEMAILS_KEY") else { throw Abort(.internalServerError) }

    let config = SendGridConfig(apiKey: apiKey)
    services.register(config)
    try services.register(SendGridProvider())
}
