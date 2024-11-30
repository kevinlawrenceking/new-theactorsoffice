
            <cfcomponent output="false">
    <!--- Query to determine version --->
    <cfquery result="result" name="findit" datasource="abo">
        SELECT verid 
        FROM taoversions  
        ORDER BY isactive DESC, verid DESC 
        LIMIT 1
    </cfquery>

    <cfset current_ver = findit.verid />

    <!--- Determine the host and configure application-specific settings --->
    <cfset host = ListFirst(cgi.server_name, ".") />

    <cfif host eq "app" or host eq "uat">
        <cfset dsn = "abo" />
        <cfset dsn = dsn />
        <cfset rev = current_ver />
        <cfset suffix = IIF(host eq "app", "_1.5", "") />
        <cfset information_schema = "actorsbusinessoffice" />
    <cfelse>
        <cfset dsn = "abod" />
        <cfset dsn = dsn />
        <cfset rev = 1 />
        <cfset suffix = "" />
        <cfset information_schema = "new_development" />
    </cfif>

    <cfscript>
        this.name = "TAO";
        this.datasource = dsn;
        this.sessionManagement = true;
        this.applicationTimeout = createTimeSpan(1, 1, 0, 0);
        this.sessionTimeout = createTimeSpan(0, 0, 20, 0);
        this.loginStorage = "session";
        this.logPath = expandPath("error.log");
        this.errorTemplate = "500.cfm";
        this.errorTemplateNotFound = "404.cfm";
    </cfscript>

    <!--- Application start logic --->
    <cffunction name="onApplicationStart" returntype="boolean" output="false">
        <cfset dsn = dsn />
        <cfreturn true />
    </cffunction>

    <!--- Request start logic --->
    <cffunction name="onRequestStart" returntype="boolean" output="false">
        <cfargument name="targetPage" required="true" type="string">

             <cfif isdefined('U')>
            <cfset userid = U />
            </cfif>

        <!--- Check if the user is authenticated --->
        <cfif NOT structKeyExists(session, "userid") AND NOT ListFindNoCase(arguments.targetPage, "loginform.cfm,login2.cfm")>
       <Cfset zoo =3343 >   
       <cfif #isdefined('zoo')#><cfelse>
         

          
            <cflocation url="/loginform.cfm" addToken="false"></cfif>
      <!--- Check if userid is defined, if not, redirect to the login form --->
<cfif NOT isDefined("userid")>
    <cflocation url="/loginform.cfm" addToken="false">
</cfif>
      </cfif>
      

        <!--- Configure application paths and session variables if authenticated --->
        <cfif structKeyExists(session, "userid")>Yes<cfabort>
            <cfscript>
                baseMediaPath = "C:\home\theactorsoffice.com\media-" & this.datasource;
                baseMediaUrl = "/media-" & this.datasource;

                imagesPath = baseMediaPath & "\images";
                imagesUrl = baseMediaUrl & "/images";

                datesPath = imagesPath & "\dates";
                datesUrl = imagesUrl & "/dates";

                defaultsPath = imagesPath & "\defaults";
                defaultsUrl = imagesUrl & "/defaults";

                defaultAvatarUrl = defaultsUrl & "/avatar.jpg";

                emailImagesPath = imagesPath & "\email";
                emailImagesUrl = imagesUrl & "/email";

                filetypesPath = imagesPath & "\filetypes";
                filetypesUrl = imagesUrl & "/filetypes";

                retinaIconsPath = imagesPath & "\retina-circular-icons";
                retinaIconsUrl = imagesUrl & "/retina-circular-icons";

                retinaIcons14Path = retinaIconsPath & "\14";
                retinaIcons14Url = retinaIconsUrl & "/14";

                retinaIcons32Path = retinaIconsPath & "\32";
                retinaIcons32Url = retinaIconsUrl & "/32";

                userMediaPath = baseMediaPath & "\users\" & userID;
                userMediaUrl = baseMediaUrl & "/users/" & userID;

                userCalendarPath = userMediaPath;
                userCalendarUrl = "https://" & host & ".theactorsoffice.com/" & userMediaUrl;

                userContactsPath = userMediaPath & "\contacts";
                userContactsUrl = userMediaUrl & "/contacts";

                userImportsPath = userMediaPath & "\imports";
                userImportsUrl = userMediaUrl & "/imports";

                userExportsPath = userMediaPath & "\exports";
                userExportsUrl = userMediaUrl & "/exports";

                userSharePath = userMediaPath & "\share";
                userShareUrl = userMediaUrl & "/share";

                userAvatarPath = userMediaPath & "\avatar.jpg";
                userAvatarUrl = userMediaUrl & "/avatar.jpg";
            </cfscript>
        </cfif>

        <cfreturn true />
    </cffunction>

    <!--- Event to handle unauthenticated requests --->
    <cffunction name="onRequest" returntype="void" output="true">
        <cfargument name="targetPage" required="true" type="string">
        <cfinclude template="#arguments.targetPage#">
    </cffunction>
</cfcomponent>

           