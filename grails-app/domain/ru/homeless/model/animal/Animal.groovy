package ru.homeless.model.animal

import ru.homeless.model.Comment
import ru.homeless.model.Photo

/**
 * Animal
 * A domain class describes the data object and it's mapping to the database
 */
class Animal {

    /* Default (injected) attributes of GORM */
//	Long	id
//	Long	version
    String name
    boolean losted
    int age
    AnimalSex sex
    AnimalType type
    AnimalStatus status
    AnimalCharacter character
    AnimalPlace place
    String color
    Photo avatar
    String description
    boolean findOwner = false
    boolean published = false

    /* Automatic timestamping of GORM */
//	Date	dateCreated
//	Date	lastUpdated

//	static belongsTo	= []	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
//	static hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
//	static hasMany		= []	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static mappedBy		= []	// specifies which property should be used in a mapping 

    static hasMany = [photos: Photo, comments: Comment]
    static mapping = {
        //  version false
    }

    static constraints = {
        name blank: false, maxSize: 50
        age max: 12 * 30
        color blank: true, nullable: true
        character nullable: true
        avatar nullable: true
        description blank: true, nullable: true
        photos nullable: true
        comments nullable: true
        status nullable: true
        place nullable: true
    }

    /*
     * Methods of the Domain Class
     */
//	@Override	// Override toString for a nicer / more descriptive UI 
//	public String toString() {
//		return "${name}";
//	}
}
