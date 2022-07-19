import Vapor

let feedbackController = FeedbackController()
let shoppingCartController = ShoppingCartController()
let userController = UserController()
let itemsController = ItemsController()

//1.get - for URL data
//get gb.ru?name=Anton&surname=Lebedev&password=sdfsdfs
//get hides nothing, password goes as it os

//2.post - for large datasets
//post gb.ru/account
//{ name = Anton
//  username = test
//  password = sdfsdfs
//}

//3.PUT - if we need to change name "Anton" to "Sergey"
//gb.ru?name = Sergey

//4.Patch - alsmost the same as "PUT", but put changes all body,
//and Patch changes only one attribute

func routes(_ app: Application) throws {
    app.get { req in
        return "The mockup VaporNoFluent562 server is working!!! /SinisterLaugh"
    }
    
    app.get("hello") { req -> String in
        return "Hello, world!"
    }
    
    //Added post-requests
    app.post("getFeedback.json", use: feedbackController.getFeedback)
    app.post("addFeedback.json", use: feedbackController.addFeedback)
    app.post("removeFeedback.json", use: feedbackController.removeFeedback)
    app.post("getShoppingCart.json", use: shoppingCartController.getShoppingCart)
    app.post("payForShoppingCart.json", use: shoppingCartController.payForShoppingCart)
    app.post("addToShoppingCart.json", use: shoppingCartController.addToShoppingCart)
    app.post("deleteFromShoppingCart.json", use: shoppingCartController.deleteFromShoppingCart)
    app.post("login.json", use: userController.login)
    app.post("logout.json", use: userController.logout)
    app.post("registerUser.json", use: userController.register)
    app.post("changeUserData.json", use: userController.changeUserData)
    app.post("catalogueData.json", use: itemsController.getCatalogue)
    app.post("getItem.json", use: itemsController.getItem)
    
    
    //This was for Fluent
    //try app.register(collection: TodoController())
}
