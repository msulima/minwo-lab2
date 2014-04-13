class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/todoList"(resources:'TodoList') {
            "/items"(resources:"TodoItem")
        }

        "/"(controller:"TodoList")
        "500"(view:'/error')
	}
}
