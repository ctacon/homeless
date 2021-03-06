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
    Date age
    AnimalSex sex
    AnimalType type
    AnimalStatus status
    AnimalCharacter character
    AnimalPlace place
    AnimalColor color
    AnimalHair hair
    Photo avatar
    String description
    boolean findOwner = false
    boolean published = false

    /* Automatic timestamping of GORM */
    Date dateCreated
//	Date	lastUpdated

//	static belongsTo	= []	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
//	static hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
//	static hasMany		= []	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static mappedBy		= []	// specifies which property should be used in a mapping 

    static hasMany = [photos: Photo, comments: Comment]
    static mapping = {
        description type: 'text'
        //  version false
    }

    static constraints = {
        name blank: false, maxSize: 50
//        age max: 12 * 30, min: 0
        color nullable: true
        hair nullable: true
        character nullable: true
        avatar nullable: true
        description type: 'text', blank: true, nullable: true
        photos nullable: true
        comments nullable: true
        status nullable: true
        place nullable: true
    }

    public Collection<Comment> getCommentsSorted() {
        return (comments?.findAll { it.parent == null })?.sort { it.dateCreated }
    }

    public String getShortDescription() {
        int count = 250;
        String shortDesc = description
        if (shortDesc != null && shortDesc.length() > count) {
            shortDesc = description.substring(0, count)
        } else {
            if (shortDesc == null) shortDesc = "";
        }
        return String.format("%-" + count + "s", shortDesc);
    }

}
