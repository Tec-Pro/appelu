package appelu

class UrlMappings {

    static mappings = {

        "/user"(controller:"user")



        "/"(view: '/index')
        "500"(view: '/error')
        "404"(view: '/notFound')
    }
}
