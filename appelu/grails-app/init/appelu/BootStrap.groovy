package appelu

class BootStrap {

    def init = { servletContext ->

        Role admin = new Role("ROLE_ADMIN").save()
        Role client = new Role("ROLE_CLIENT").save()
        Role owner = new Role("ROLE_OWNER").save()
        User userAdmin = new User("user", "pass", "123").save()
        User userClient = new User("user", "pass", "123").save()
        User userOwner = new User("user", "pass", "123").save()
        UserRole.create(userAdmin, admin, true)
        UserRole.create(userOwner, admin, true)
        UserRole.create(userClient, admin, true)
    }
    def destroy = {
    }
}
