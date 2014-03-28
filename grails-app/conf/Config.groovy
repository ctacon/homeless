// locations to search for config files that get merged into the main config;
// config files can be ConfigSlurper scripts, Java properties files, or classes
// in the classpath in ConfigSlurper format

// grails.config.locations = [ "classpath:${appName}-config.properties",
//                             "classpath:${appName}-config.groovy",
//                             "file:${userHome}/.grails/${appName}-config.properties",
//                             "file:${userHome}/.grails/${appName}-config.groovy"]

// if (System.properties["${appName}.config.location"]) {
//    grails.config.locations << "file:" + System.properties["${appName}.config.location"]
// }
import grails.plugin.springsecurity.SecurityConfigType
import org.apache.log4j.ConsoleAppender
import org.apache.log4j.DailyRollingFileAppender
import org.apache.log4j.PatternLayout

grails.project.groupId = homeless // change this to alter the default package name and Maven publishing destination
grails.app.context = "/"
// The ACCEPT header will not be used for content negotiation for user agents containing the following strings (defaults to the 4 major rendering engines)
grails.mime.disable.accept.header.userAgents = ['Gecko', 'WebKit', 'Presto', 'Trident']
grails.mime.types = [
        all: '*/*',
        atom: 'application/atom+xml',
        css: 'text/css',
        csv: 'text/csv',
        form: 'application/x-www-form-urlencoded',
        html: ['text/html', 'application/xhtml+xml'],
        js: 'text/javascript',
        json: ['application/json', 'text/json'],
        multipartForm: 'multipart/form-data',
        rss: 'application/rss+xml',
        text: 'text/plain',
        hal: ['application/hal+json', 'application/hal+xml'],
        xml: ['text/xml', 'application/xml']
]

// URL Mapping Cache Max Size, defaults to 5000
//grails.urlmapping.cache.maxsize = 1000

// What URL patterns should be processed by the resources plugin
grails.resources.adhoc.patterns = ['/images/*', '/css/*', '/js/*', '/plugins/*']

// Legacy setting for codec used to encode data with ${}
//grails.views.default.codec = "html"

// The default scope for controllers. May be prototype, session or singleton.
// If unspecified, controllers are prototype scoped.
grails.controllers.defaultScope = 'singleton'

// GSP settings
grails {
    views {
        gsp {
            encoding = 'UTF-8'
            htmlcodec = 'xml' // use xml escaping instead of HTML4 escaping
            codecs {
                expression = 'html' // escapes values inside ${}
                scriptlet = 'html' // escapes output from scriptlets in GSPs
                taglib = 'none' // escapes output from taglibs
                staticparts = 'none' // escapes output from static template parts
            }
        }
        // escapes all not-encoded output at final stage of outputting
        filteringCodecForContentType {
            //'text/html' = 'html'
        }
    }
    mail {
        host = "smtp.mail.ru"
        port = 465
        username = "noreply@bezdomishi.ru"
        password = "nfhfrfy12345"
        props = ["mail.smtp.auth": "true",
                "mail.smtp.socketFactory.port": "465",
                "mail.smtp.socketFactory.class": "javax.net.ssl.SSLSocketFactory",
                "mail.smtp.socketFactory.fallback": "false"]
    }
}

grails.converters.encoding = "UTF-8"
// scaffolding templates configuration
grails.scaffolding.templates.domainSuffix = 'Instance'

// Set to false to use the new Grails 1.2 JSONBuilder in the render method
grails.json.legacy.builder = false
// enabled native2ascii conversion of i18n properties files
grails.enable.native2ascii = true
// packages to include in Spring bean scanning
grails.spring.bean.packages = []
// whether to disable processing of multi part requests
grails.web.disable.multipart = false

// request parameters to mask when logging exceptions
grails.exceptionresolver.params.exclude = ['password']

// configure auto-caching of queries by default (if false you can cache individual queries with 'cache: true')
grails.hibernate.cache.queries = false

environments {
    development {
        grails.logging.jul.usebridge = true
        grails.serverURL = "http://homeless.dev:8080"
        file.upload.directory = '/Users/ctacon/programming/tmp/'
    }
    production {
        grails.logging.jul.usebridge = false
        grails.serverURL = "http://bezdomishi.ru"
        file.upload.directory = '/home/homeless/user/images/'
    }
}

// log4j configuration
//log4j
def log4jConsoleLogLevel = Priority.DEBUG
def log4jAppFileLogLevel = Priority.INFO

environments {
    development {
        log4jConsoleLogLevel = Priority.DEBUG
        log4jAppFileLogLevel = Priority.DEBUG
    }
}
log4j = {
    appenders {
        appender new ConsoleAppender(name: "stdout",
                threshold: log4jAppFileLogLevel,
                layout: new PatternLayout("%d{[ dd.MM.yy HH:mm:ss.SSS]} [%t] %-5p %c %x - %m%n")
        )
        appender new DailyRollingFileAppender(name: "model",
                threshold: log4jAppFileLogLevel,
                file: "/var/log/homeless/model/model.log",
                datePattern: "'.'yyyy-MM-dd",
                layout: new PatternLayout("%d{[ dd.MM.yy HH:mm:ss.SSS]} [%t] %-5p %c %x - %m%n")
        )
        appender new DailyRollingFileAppender(name: "security",
                threshold: log4jAppFileLogLevel,
                file: "/var/log/homeless/security/security.log",
                datePattern: "'.'yyyy-MM-dd",
                layout: new PatternLayout("%d{[ dd.MM.yy HH:mm:ss.SSS]} [%t] %-5p %c %x - %m%n")
        )
        appender new DailyRollingFileAppender(name: "system",
                threshold: log4jAppFileLogLevel,
                file: "/var/log/homeless/system/system.log",
                datePattern: "'.'yyyy-MM-dd",
                layout: new PatternLayout("%d{[ dd.MM.yy HH:mm:ss.SSS]} [%t] %-5p %c %x - %m%n")
        )
        appender new DailyRollingFileAppender(name: "domain",
                threshold: log4jAppFileLogLevel,
                file: "/var/log/homeless/domain/domain.log",
                datePattern: "'.'yyyy-MM-dd",
                layout: new PatternLayout("%d{[ dd.MM.yy HH:mm:ss.SSS]} [%t] %-5p %c %x - %m%n")
        )
        appender new DailyRollingFileAppender(name: "controller",
                threshold: log4jAppFileLogLevel,
                file: "/var/log/homeless/controller/controller.log",
                datePattern: "'.'yyyy-MM-dd",
                layout: new PatternLayout("%d{[ dd.MM.yy HH:mm:ss.SSS]} [%t] %-5p %c %x - %m%n")
        )
        appender new DailyRollingFileAppender(name: "service",
                threshold: log4jAppFileLogLevel,
                file: "/var/log/homeless/service/service.log",
                datePattern: "'.'yyyy-MM-dd",
                layout: new PatternLayout("%d{[ dd.MM.yy HH:mm:ss.SSS]} [%t] %-5p %c %x - %m%n")
        )
        appender new DailyRollingFileAppender(name: "systemother",
                threshold: log4jAppFileLogLevel,
                file: "/var/log/homeless/systemOther/systemother.log",
                datePattern: "'.'yyyy-MM-dd",
                layout: new PatternLayout("%d{[ dd.MM.yy HH:mm:ss.SSS]} [%t] %-5p %c %x - %m%n")
        )
    }

    debug 'com.the6hours', 'grails.app.taglib.com.the6hours'
    error 'org.codehaus.groovy.grails.web.servlet',        // controllers
            'org.codehaus.groovy.grails.web.pages',          // GSP
            'org.codehaus.groovy.grails.web.sitemesh',       // layouts
            'org.codehaus.groovy.grails.web.mapping.filter', // URL mapping
            'org.codehaus.groovy.grails.web.mapping',        // URL mapping
            'org.codehaus.groovy.grails.commons',            // core / classloading
            'org.codehaus.groovy.grails.plugins',            // plugins
            'org.codehaus.groovy.grails.orm.hibernate',      // hibernate integration
            'org.springframework',
            'org.hibernate',
            'net.sf.ehcache.hibernate'

    warn 'grails.app.services.grails.plugin.springsecurity.ui.SpringSecurityUiService'



    environments {
        development {
            root {
                info 'system', 'stdout'
            }
            debug controller: ["grails.app.controllers"],
                    service: ["grails.app.services"],
                    domain: ["grails.app.domain"],
                    system: ["grails.app"]

        }
        production {
            root {
                error 'system'
            }
            info controller: ["grails.app.controllers"],
                    service: ["grails.app.services"],
                    domain: ["grails.app.domain"]
            error system: ["grails.app"]
        }
    }

}

oauth {
    debug = true
    providers {
        facebook {
            api = org.scribe.builder.api.FacebookApi
            key = '1399516536964202'
            secret = 'b31c39b8118aef13b5fb0c3d38c3e362'
            successUri = '/oauth/facebook/success'
            failureUri = '/oauth/facebook/error'
            callback = "${grails.serverURL}/oauth/facebook/callback"
        }
        vkontakte {
            api = org.scribe.builder.api.VkontakteApi
            key = '4137269'
            secret = 'ddQeoqYXPgePq2M7Zj9g'
            successUri = '/oauth/vkontakte/success'
            failureUri = '/oauth/vkontakte/error'
            callback = "${grails.serverURL}/oauth/vkontakte/callback"
        }
    }
}





grails.config.defaults.locations = [KickstartResources]
// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'ru.homeless.model.Person'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'ru.homeless.security.UserRole'
grails.plugin.springsecurity.authority.className = 'ru.homeless.security.Role'


grails.plugin.springsecurity.ui.register.emailBody = '''\
Здравствуйте! <br/><br/>
Данный адрес был указан пользователем $user.username(возможно, это Вы) в качестве своего e-mail адреса для
регистрации на сайте bezdomishi.ru.<br/><br/>
Если Вы этого не делали или не желаете иметь аккаунт на сайте bezdomishi.ru, просто УДАЛИТЕ это письмо. <br/><br/>
Для подтверждения адреса нажмите &nbsp;<a href="$url">ссылку</a> или скопируйте ее в окно браузера. <br/>  <br/>
Это письмо написано роботом. Отвечать на него не нужно.<br/>
Связаться со службой поддержки сайта bezdomishi.ru Вы можете по адресу support@bezdomishi.ru.
'''
grails.plugin.springsecurity.ui.register.emailFrom = 'noreply@bezdomishi.ru'
grails.plugin.springsecurity.ui.register.emailSubject = 'Регистрация на bezdomishi.ru: подтверждение e-mail'

grails.plugin.springsecurity.ui.forgotPassword.emailBody = '''\
Здравствуйте! <br/><br/>
На сайте bezdomishi.ru для пользователя $user.username(возможно, это Вы) был запрошен сброс пароля.<br/><br/
Если Вы этого не делали или не желаете сбросить пароль на сайте bezdomishi.ru, просто УДАЛИТЕ это письмо. <br/><br/>
Для сброса пароля нажмите &nbsp;<a href="$url">ссылку</a> или скопируйте ее в окно браузера. <br/>  <br/>
Это письмо написано роботом. Отвечать на него не нужно.<br/>
Связаться со службой поддержки сайта bezdomishi.ru Вы можете по адресу support@bezdomishi.ru.
'''
grails.plugin.springsecurity.ui.forgotPassword.emailFrom = 'noreply@bezdomishi.ru'
grails.plugin.springsecurity.ui.forgotPassword.emailSubject = 'bezdomishi.ru: сброс пароля'

grails.plugin.springsecurity.ui.password.minLength = 4
grails.plugin.springsecurity.ui.password.maxLength = 64
grails.plugin.springsecurity.ui.password.validationRegex = '^.*$'

grails.plugin.springsecurity.ui.register.postRegisterUrl = '/'
grails.plugin.springsecurity.ui.register.postResetUrl = '/'

//grails.plugin.springsecurity.failureHandler.defaultFailureUrl = '/'
//grails.plugin.springsecurity.auth.loginFormUrl = '/'

grails.plugin.springsecurity.securityConfigType = SecurityConfigType.InterceptUrlMap
grails.plugin.springsecurity.interceptUrlMap = [
        '/timeline': ['ROLE_USER'],
        '/person/*': ['IS_AUTHENTICATED_REMEMBERED'],
        '/post/followAjax': ['ROLE_USER'],
        '/post/addPostAjax': ['ROLE_USER', 'IS_AUTHENTICATED_FULLY'],
        //  '/animal/create': ['ROLE_USER'],
        '/person/show/*': ['ROLE_USER'],
        '/**': ['IS_AUTHENTICATED_ANONYMOUSLY']
]

// Added by the Spring Security OAuth plugin:
grails.plugin.springsecurity.oauth.domainClass = 'ru.homeless.security.OAuthID'


grails.plugin.remotepagination.max = 10
grails.plugin.remotepagination.enableBootstrap = true

grails.plugin.databasemigration.updateOnStart = true
grails.plugin.databasemigration.updateOnStartFileNames = ['changelog.groovy']


tomcat.deploy.username="admin"
tomcat.deploy.password="admin"
tomcat.deploy.url="http://109.120.177.22/manager/text"