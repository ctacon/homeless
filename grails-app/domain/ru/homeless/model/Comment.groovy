package ru.homeless.model

import ru.homeless.model.animal.Animal

/**
 * Comment
 * A domain class describes the data object and it's mapping to the database
 */
class Comment {

    /* Default (injected) attributes of GORM */
//	Long	id
//	Long	version
    String text
    double rate
    Person person

    /* Automatic timestamping of GORM */
    Date dateCreated
//	Date	lastUpdated

//	static belongsTo	= []	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
//	static hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
//	static hasMany		= []	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static mappedBy		= []	// specifies which property should be used in a mapping 
    static belongsTo = [parent: Comment, animal: Animal]
    static mapping = {
    }

    static hasMany = [childComments: Comment]
    static constraints = {
        person nullable: false
        childComments nullable: true
        parent nullable: true
        text blank: false
        animal nullable: true
    }

    public Collection<Comment> getChildCommentsSorted() {
        return childComments?.sort { it.dateCreated }
    }

    /*
     * Methods of the Domain Class
     */
//	@Override	// Override toString for a nicer / more descriptive UI 
//	public String toString() {
//		return "${name}";
//	}
}
