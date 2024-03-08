package routes

import (
	controllers "pa2/controllers/admin"
	"pa2/middleware"

	cashierController "pa2/controllers/cashier"

	fiber "github.com/gofiber/fiber/v2"
)

func Setup(app *fiber.App) {
	admin := app.Group("/admin")

	//Auth Admin
	admin.Post("/register", controllers.Register)
	admin.Post("/login", controllers.Login)
	admin.Use(middleware.RequiredLoginAdmin)
	admin.Get("/profile", controllers.Profile)
	admin.Post("/logout", controllers.Logout)

	//Manage Cashier
	admin.Post("/cashier", controllers.CreateCashier)
	admin.Get("/cashier/index", controllers.IndexCashier)
	admin.Get("/cashier/show/:id", controllers.ShowCashier)
	admin.Put("/cashier/update/:id", controllers.UpdateCashier)
	admin.Delete("/cashier/delete/:id", controllers.DeleteCashier)

	//Manage Category with Admin
	admin.Post("/category", controllers.CreateCategory)
	admin.Get("/category/index", controllers.IndexCategory)
	admin.Get("/category/show/:id", controllers.ShowCategory)
	admin.Put("/category/update/:id", controllers.UpdateCategory)
	admin.Delete("/category/delete/:id", controllers.DeleteCategory)

	//Manage Tabel with Admin
	admin.Post("/table", controllers.CreateTable)
	admin.Get("/table/index", controllers.IndexTable)
	admin.Get("/table/show/:id", controllers.ShowTable)
	admin.Put("/table/update/:id", controllers.UpdateTable)
	admin.Delete("/table/delete/:id", controllers.DeleteTable)

	//Manage Product with Admin
	admin.Post("/product", controllers.CreateProduct)
	admin.Get("/product/index", controllers.IndexProduct)
	admin.Get("/product/show/:id", controllers.ShowProduct)
	admin.Put("/product/update/:id", controllers.UpdateProduct)
	admin.Delete("/product/delete/:id", controllers.DeleteProduct)

	//Auth Cashier
	cashier := app.Group("/cashier")
	cashier.Post("/login", cashierController.Login)
	cashier.Use(middleware.RequiredLoginCashier)
	cashier.Get("/profile", cashierController.Profile)
	cashier.Post("/logout", cashierController.Logout)
}
