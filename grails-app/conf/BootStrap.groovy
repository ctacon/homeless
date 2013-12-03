import ru.homeless.model.PersonPostType
import ru.homeless.model.animal.*

class BootStrap {

    def init = { servletContext ->
        //пользователи роли
        def adminRole = ru.homeless.security.Role.findByAuthority('ROLE_ADMIN') ?: new ru.homeless.security.Role(authority: 'ROLE_ADMIN').save(failOnError: true)
        def userRole = ru.homeless.security.Role.findByAuthority('ROLE_USER') ?: new ru.homeless.security.Role(authority: 'ROLE_USER').save(failOnError: true)
        def adminUser = ru.homeless.security.User.findByUsername('admin') ?: new ru.homeless.security.User(
                username: 'admin',
                password: 'admin',
                email: 'ctacon183@gmail.com',
                enabled: true).save(failOnError: true)

        if (!adminUser.authorities.contains(adminRole)) {
            ru.homeless.security.UserRole.create adminUser, adminRole
        }

        //Вспомогательные таблицы
        new AnimalCharacter(name: "Ласковый").save(failOnError: true)
        new AnimalCharacter(name: "Нежный").save(failOnError: true)

        new AnimalSex(name: "Мужской").save(failOnError: true)
        new AnimalSex(name: "Женский").save(failOnError: true)

        new AnimalHair(name: "Короткая").save(failOnError: true)
        new AnimalHair(name: "Длинная").save(failOnError: true)

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

        // new Photo(originalFilename:"",newFilename:"",fileSize:)

        // new RequestMap(url: "/*", configAttribute: 'IS_AUTHENTICATED_ANONYMOUSLY').save()
    }
    def destroy = {
    }
}
