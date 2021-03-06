import ru.homeless.model.Person
import ru.homeless.model.PersonPostType
import ru.homeless.model.Photo
import ru.homeless.model.PhotoService
import ru.homeless.model.animal.*

class BootStrap {
    def PhotoService photoService
    def grailsApplication

    def init = { servletContext ->
        //пользователи роли
        if (Person.count == 0) {
            def adminRole = ru.homeless.security.Role.findByAuthority('ROLE_ADMIN') ?: new ru.homeless.security.Role(authority: 'ROLE_ADMIN').save(failOnError: true)
            def superAdminRole = ru.homeless.security.Role.findByAuthority('ROLE_SUPER_ADMIN') ?: new ru.homeless.security.Role(authority: 'ROLE_SUPER_ADMIN').save(failOnError: true)
            def userRole = ru.homeless.security.Role.findByAuthority('ROLE_USER') ?: new ru.homeless.security.Role(authority: 'ROLE_USER').save(failOnError: true)
            def userRoleFS = ru.homeless.security.Role.findByAuthority('ROLE_FACEBOOK') ?: new ru.homeless.security.Role(authority: 'ROLE_FACEBOOK').save(failOnError: true)
            def userRoleVK = ru.homeless.security.Role.findByAuthority('ROLE_VKONTAKTE') ?: new ru.homeless.security.Role(authority: 'ROLE_VKONTAKTE').save(failOnError: true)

            Photo superAdminAvatar = photoService.save('admin-avatar.gif',
                   new File("/usr/share/tomcat7/webapps/homeless/images/admin-avatar.gif").getBytes())
            def superAdminUser = ru.homeless.model.Person.findByUsername('admin') ?: new ru.homeless.model.Person(
                    username: 'admin',
                    password: 'ctac0n183',
                    email: 'ctacon183@gmail.com',
                    enabled: true)
            superAdminUser.profile.setAvatar(superAdminAvatar)
            superAdminUser.save(failOnError: true)

            if (!superAdminUser.authorities.contains(adminRole)) {
                ru.homeless.security.UserRole.create superAdminUser, adminRole
            }
            if (!superAdminUser.authorities.contains(superAdminRole)) {
                ru.homeless.security.UserRole.create superAdminUser, superAdminRole
            }
            if (!superAdminUser.authorities.contains(userRole)) {
                ru.homeless.security.UserRole.create superAdminUser, userRole
            }
        }

        //Вспомогательные таблицы
        if (AnimalCharacter.count == 0) {
            new AnimalCharacter(name: "Ласковый").save(failOnError: true)
            new AnimalCharacter(name: "Нежный").save(failOnError: true)

            new AnimalSex(name: "Мужской").save(failOnError: true)
            new AnimalSex(name: "Женский").save(failOnError: true)

            new AnimalHair(name: "Короткая").save(failOnError: true)
            new AnimalHair(name: "Длинная").save(failOnError: true)

            new AnimalColor(name: "Синий").save(failOnError: true)
            new AnimalColor(name: "Красный").save(failOnError: true)
            new AnimalColor(name: "Серый").save(failOnError: true)


            new AnimalType(name: "Кошка").save(failOnError: true)
            new AnimalType(name: "Собака").save(failOnError: true)

            new PersonPostType(name: "Создатель").save(failOnError: true)
            new PersonPostType(name: "Куратор").save(failOnError: true)

            new AnimalStatus(name: "Здоров").save(failOnError: true)
            new AnimalStatus(name: "Болен").save(failOnError: true)
            new AnimalStatus(name: "Ушел из жизни").save(failOnError: true)

            new AnimalPlace(name: "На улице").save(failOnError: true)
            new AnimalPlace(name: "Дома").save(failOnError: true)
            new AnimalPlace(name: "В подъезде").save(failOnError: true)
        }

        // new Photo(originalFilename:"",newFilename:"",fileSize:)

        // new RequestMap(url: "/*", configAttribute: 'IS_AUTHENTICATED_ANONYMOUSLY').save()
    }
    def destroy = {
    }
}
