import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    let usersController = UsersController()
    try router.register(collection: usersController)
    
    let petsController = PetsController()
    try router.register(collection: petsController)
    
    let categoriesController = CategoriesControll()
    try router.register(collection: categoriesController)
    
    let websiteController = WebsiteController()
    try router.register(collection: websiteController)
    
    let loginController = LoginController()
    try router.register(collection: loginController)
}
