grails.servlet.version = "3.0" // Change depending on target container compliance (2.5 or 3.0)
grails.project.class.dir = "target/classes"
grails.project.test.class.dir = "target/test-classes"
grails.project.test.reports.dir = "target/test-reports"
grails.project.work.dir = "target/work"
grails.project.target.level = 1.6
grails.project.source.level = 1.6
grails.project.war.file = "target/${appName}.war"
//grails.project.war.file = "target/${appName}-${appVersion}.war"

grails.project.fork = [
        // configure settings for compilation JVM, note that if you alter the Groovy version forked compilation is required
        //  compile: [maxMemory: 256, minMemory: 64, debug: false, maxPerm: 256, daemon:true],

        // configure settings for the test-app JVM, uses the daemon by default
        test: [maxMemory: 768, minMemory: 64, debug: false, maxPerm: 256, daemon: true],
        // configure settings for the run-app JVM
        run: [maxMemory: 768, minMemory: 64, debug: false, maxPerm: 256, forkReserve: false],
        // configure settings for the run-war JVM
        war: [maxMemory: 768, minMemory: 64, debug: false, maxPerm: 256, forkReserve: false],
        // configure settings for the Console UI JVM
        console: [maxMemory: 768, minMemory: 64, debug: false, maxPerm: 256]
]

//grails{
//    tomcat{
//        jvmArgs = ["-server", "-XX:MaxPermSize=64m", "-XX:MaxNewSize=64m", "-XX:NewSize=64m",
//                "-Xms128m", "-Xmx256m", "-XX:SurvivorRatio=32", "-XX:MaxTenuringThreshold=0",
//                "-XX:+UseTLAB", "-XX:+UseConcMarkSweepGC", "-XX:+CMSClassUnloadingEnabled",
//                "-XX:+CMSIncrementalMode", "-XX:-UseGCOverheadLimit", "-XX:+ExplicitGCInvokesConcurrent"]
//    }
//}


grails.project.dependency.resolver = "maven" // or ivy
grails.project.dependency.resolution = {
    // inherit Grails' default dependencies
    inherits("global") {
        // specify dependency exclusions here; for example, uncomment this to disable ehcache:
        // excludes 'ehcache'
    }
    log "error" // log level of Ivy resolver, either 'error', 'warn', 'info', 'debug' or 'verbose'
    checksums true // Whether to verify checksums on resolve
    legacyResolve false // whether to do a secondary resolve on plugin installation, not advised and here for backwards compatibility

    repositories {
        inherits true // Whether to inherit repository definitions from plugins

        grailsPlugins()
        grailsHome()
        mavenLocal()
        grailsCentral()
        mavenCentral()
        mavenRepo "http://repo.spring.io/milestone/"
        mavenRepo "http://repo.grails.org/grails/libs-releases/"
        mavenRepo "http://m2repo.spockframework.org/ext/"
        // uncomment these (or add new ones) to enable remote dependency resolution from public Maven repositories
        //mavenRepo "http://repository.codehaus.org"
        //mavenRepo "http://download.java.net/maven/2/"
        //mavenRepo "http://repository.jboss.com/maven2/"
    }

    dependencies {
        // specify dependencies here under either 'build', 'compile', 'runtime', 'test' or 'provided' scopes e.g.
        // runtime 'mysql:mysql-connector-java:5.1.24'
//        compile 'org.springframework.social:spring-social-core:1.0.3.RELEASE'
        compile 'org.springframework.social:spring-social-facebook:1.0.3.RELEASE'
        runtime 'org.xerial:sqlite-jdbc:3.6.17'
    }

    plugins {
        // plugins for the build system only
        build ":tomcat:7.0.52.1"

        // plugins for the compile step
        compile ":scaffolding:2.0.1"
        compile ':cache:1.1.1'
        compile ":kickstart-with-bootstrap:0.9.6"
        compile ':lesscss-resources:1.3.0.3'
        compile ":twitter-bootstrap:3.0.2"
        compile ":spring-security-core:2.0-RC2"
        compile ":mail:1.0.1"
        compile ":jquery-ui:1.10.3"
        compile ":famfamfam:1.0.1"
        compile ":spring-security-ui:1.0-RC1"
        compile ":remote-pagination:0.4.6"
        //compile ":bootstrap-file-upload:2.1.2"
       // compile "org.grails.plugins:spring-security-facebook:0.15.2-CORE2"

        compile ':spring-security-oauth:2.0.2'
        compile ':spring-security-oauth-facebook:0.1'
        compile ':spring-security-oauth-vkontakte:0.1.1'


        // plugins needed at runtime but not for compilation
        runtime ":hibernate:3.6.10.2" // or ":hibernate4:4.1.11.2"
        runtime ":database-migration:1.3.8"
        runtime ":jquery:1.10.2.2"
        runtime ":resources:1.2.1"

        // Uncomment these (or add new ones) to enable additional resources capabilities
        //runtime ":zipped-resources:1.0.1"
        //runtime ":cached-resources:1.1"
        //runtime ":yui-minify-resources:0.1.5"
    }
}
