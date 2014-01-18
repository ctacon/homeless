package ru.homeless.model

import ru.homeless.security.User

/**
 * Person   - класс пользователя
 * A domain class describes the data object and it's mapping to the database
 */
class Person extends User {
    Photo avatar
    long uid
    String accessToken
    Date accessTokenExpires
    String fullName

    /* Default (injected) attributes of GORM */
//	Long	id
//	Long	version

    /* Automatic timestamping of GORM */
//	Date	dateCreated
//	Date	lastUpdated

//	static belongsTo	= []	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
//	static hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
//	static hasMany		= []	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static mappedBy		= []	// specifies which property should be used in a mapping 

    static mapping = {
    }

    static constraints = {
        avatar nullable: true
        uid unique: true
        accessToken nullable: true
        accessTokenExpires nullable: true
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
