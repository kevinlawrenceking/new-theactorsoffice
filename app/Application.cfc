<cfcomponent output="false">
    <cfquery result="result" name="findit" >
        SELECT verid 
        FROM taoversions  
        ORDER BY isactive DESC, verid DESC 
        LIMIT 1
    </cfquery>

    <cfset current_ver = findit.verid />

    <cfset host = ListFirst(cgi.server_name, ".") />

    <cfif host eq "app" or host eq "uat">
        <cfset application.dsn = "abo" />
        <cfset dsn = application.dsn />
        <cfset rev = current_ver />
        <cfset suffix = IIF(host eq "app", "_1.5", "") />
        <cfset information_schema = "actorsbusinessoffice" />
    <cfelse>
        <cfset application.dsn = "abod" />
         <cfset dsn = application.dsn />
        <cfset rev = 1 />
        <cfset suffix = "" />
        <cfset information_schema = "new_development" />
    </cfif>

    <cfscript>
        this.name = "TAO";
        this.datasource = application.dsn;
        this.sessionManagement = true;
        this.applicationTimeout = createTimeSpan(1, 1, 0, 0);
        this.sessionTimeout = createTimeSpan(0, 0, 20, 0);
        this.loginStorage = "session";
        this.logPath = expandPath("error.log");
        this.errorTemplate = "500.cfm";
        this.errorTemplateNotFound = "404.cfm";
    </cfscript>

    <!--- Set dsn variable globally for all pages --->
    <cffunction name="onApplicationStart" returntype="boolean" output="false">
        <cfset dsn = application.dsn />
        <cfreturn true />
    </cffunction>

    <cffunction name="OnRequestStart" returntype="boolean" output="false">
        <cfargument name="targetPage" required="true" type="string">

        <cfif isDefined('u')>
            <cfset session.userid = u />
        </cfif>

        <cfif NOT isDefined('session.userid')>
            <cfif NOT isDefined('pwpass')>
                <cflocation url="/loginform.cfm" addtoken="no">
            </cfif>
        </cfif>
<Cfset userid = 30 />
<Cfset session.userid = 30 />
    
            <cfscript>
                baseMediaPath = "C:\home\theactorsoffice.com\media-" & this.datasource;
                baseMediaUrl = "/media-" & this.datasource;

                application.imagesPath = baseMediaPath & "\images";
                application.imagesUrl = baseMediaUrl & "/images";

                application.datesPath = application.imagesPath & "\dates";
                application.datesUrl = application.imagesUrl & "/dates";

                application.defaultsPath = application.imagesPath & "\defaults";
                application.defaultsUrl = application.imagesUrl & "/defaults";

                application.defaultAvatarUrl = application.defaultsUrl & "/avatar.jpg";
                application.defaultAvatarPath = application.defaultsPath & "\avatar.jpg";

                application.emailImagesPath = application.imagesPath & "\email";
                application.emailImagesUrl = application.imagesUrl & "/email";

                application.filetypesPath = application.imagesPath & "\filetypes";
                application.filetypesUrl = application.imagesUrl & "/filetypes";

                application.retinaIconsPath = application.imagesPath & "\retina-circular-icons";
                application.retinaIconsUrl = application.imagesUrl & "/retina-circular-icons";

                application.retinaIcons14Path = application.retinaIconsPath & "\14";
                application.retinaIcons14Url = application.retinaIconsUrl & "/14";

                application.retinaIcons32Path = application.retinaIconsPath & "\32";
                application.retinaIcons32Url = application.retinaIconsUrl & "/32";

                session.userMediaPath = baseMediaPath & "\users\" & session.userID;
                session.userMediaUrl = baseMediaUrl & "/users/" & session.userID;

                session.userCalendarPath = session.userMediaPath;
                session.userCalendarUrl = "https://" & host & ".theactorsoffice.com" & session.userMediaUrl;

                session.userContactsPath = session.userMediaPath & "\contacts";
                session.userContactsUrl = session.userMediaUrl & "/contacts";

                session.userImportsPath = session.userMediaPath & "\imports";
                session.userImportsUrl = session.userMediaUrl & "/imports";

                session.userExportsPath = session.userMediaPath & "\exports";
                session.userExportsUrl = session.userMediaUrl & "/exports";

                session.userSharePath = session.userMediaPath & "\share";
                session.userShareUrl = session.userMediaUrl & "/share";

                session.userAvatarPath = session.userMediaPath & "\avatar.jpg";
                session.userAvatarUrl = session.userMediaUrl & "/avatar.jpg";
            </cfscript>
         

        <cfreturn true>
    </cffunction>

</cfcomponent>
