package ru.homeless.model


import ru.homeless.security.User

/**
 * Person   - класс пользователя
 * A domain class describes the data object and it's mapping to the database
 */
class Person extends User {
    Photo avatar
    Long uid
    String fullName

    String provider
    String accessToken

    /* Default (injected) attributes of GORM */
//	Long	id
//	Long	version

    /* Automatic timestamping of GORM */
//	Date	dateCreated
//	Date	lastUpdated

    static mapping = {
    }

    static constraints = {
        avatar nullable: true
        uid unique: true, nullable: true
        accessToken nullable: true, unique: true
        provider nullable: true
        fullName nullable: true
    }


    public String getLoggedInName() {
        return fullName == null || fullName.isEmpty() ? username : fullName;
    }

    /*
     * Methods of the Domain Class
     */


    @Override
    public java.lang.String toString() {
        return "Person{" +
                "id=" + id +
                ", avatar=" + avatar +
                ", uid=" + uid +
                '}';
    }
}
