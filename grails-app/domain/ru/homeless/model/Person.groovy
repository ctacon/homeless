package ru.homeless.model


import ru.homeless.security.User

/**
 * Person   - класс пользователя
 * A domain class describes the data object and it's mapping to the database
 */
class Person extends User {
    Long uid
    String fullName

    String provider
    String accessToken
    PersonProfile profile = new PersonProfile()

	Date	dateCreated
	Date	lastUpdated


    static belongsTo = [profile: PersonProfile]


    static mapping = {
        profile cascade: 'all'
    }

    static constraints = {
        uid unique: true, nullable: true
        accessToken nullable: true, unique: true
        provider nullable: true
        fullName nullable: true
    }


    public String getLoggedInName() {
        return fullName == null || fullName.isEmpty() ? username : fullName;
    }


    @Override
    public java.lang.String toString() {
        return "Person{" +
                "id=" + id +
                ", uid=" + uid +
                '}';
    }
}
