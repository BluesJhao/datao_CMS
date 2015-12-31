class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(view:"/login") //后台登陆页
//		"/homePage"(view:"/message/homePage")
		"500"(view:'/error')
	}
}
