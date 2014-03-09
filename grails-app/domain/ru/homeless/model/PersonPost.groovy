package ru.homeless.model

import ru.homeless.model.animal.Animal

/**
 * PersonPost
 * роль пользователя по отношению к животному
 */
class PersonPost /*implements Serializable*/ {


    static belongsTo = [person: Person, animal: Animal, type: PersonPostType]
    static mapping = {
        version false
    }

    static constraints = {
    }
}
