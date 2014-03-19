package ru.homeless.model

/**
 * Photo
 * A domain class describes the data object and it's mapping to the database
 */
class Photo {

    /* Default (injected) attributes of GORM */
//	Long	id
//	Long	version
    String originalFilename
    String thumbnailFilename
    String newFilename
    String folder
    long fileSize
    boolean deleted
    boolean avatar

    /* Automatic timestamping of GORM */
//	Date	dateCreated
//	Date	lastUpdated

    static hasMany = [comments: Comment]
    static mapping = {
    }
    //static transients = [ 'deleted' ]

    static constraints = {
        comments nullable: true
    }

    /*
     * Methods of the Domain Class
     */

//	@Override	// Override toString for a nicer / more descriptive UI 
//	public String toString() {
//		return "${name}";
//	}
    @Override
    public java.lang.String toString() {
        return "Photo{" +
                "id=" + id +
                ", originalFilename='" + originalFilename + '\'' +
                ", thumbnailFilename='" + thumbnailFilename + '\'' +
                ", newFilename='" + newFilename + '\'' +
                ", fileSize=" + fileSize +
                ", deleted=" + deleted +
                ", version=" + version +
                '}';
    }
}
