<cfcomponent output="false">

  <cfquery result="result" name="findit" datasource="abo">
    SELECT verid
    FROM taoversions
    ORDER BY isactive DESC, verid DESC
    LIMIT 1
  </cfquery>

  <cfset current_ver=findit.verid/>

  <cfset host=ListFirst(cgi.server_name, ".")/>

  <cfif host eq "app" or host eq "uat">
    <cfset application.dsn="abo"/>
    <cfset application.information_schema="actorsbusinessoffice"/>
    <cfset application.suffix=IIF(host eq "app", "_1.5", "")/>
    <cfset application.rev=current_ver/>
  <cfelse>
    <cfset application.dsn="abod"/>
    <cfset application.information_schema="new_development"/>
    <cfset application.suffix=""/>
    <cfset application.rev=1/>
  </cfif>

  <cfscript>
    this.mappings["/app"] = expandPath(".");
    this.name = "TAO";
    this.datasource = application.dsn;
    this.sessionManagement = true;
    this.applicationTimeout = createTimeSpan(1, 1, 0, 0);
    this.sessionTimeout = createTimeSpan(0, 0, 20, 0);
    this.loginStorage = "session";
    this.logPath = expandPath("error.log");
    this.errorTemplate = "500.cfm";
    this.errorTemplateNotFound = "404.cfm";

    application.baseMediaPath = "C:\home\theactorsoffice.com\media-" & this.datasource;
    application.baseMediaUrl = "/media-" & this.datasource;
    application.auditionimporttemplate = application.baseMediaUrl & "/auditionimporttemplates.xlsx";

    application.imagesPath = application.baseMediaPath & "\images";
    application.imagesUrl = application.baseMediaUrl & "/images";

    application.datesPath = application.imagesPath & "\dates";
    application.datesUrl = application.imagesUrl & "/dates";

    application.defaultsPath = application.imagesPath & "\defaults";
    application.defaultsUrl = application.imagesUrl & "/defaults";

    application.defaultAvatarUrl = application.defaultsUrl & "/avatar.jpg";
    application.defaultAvatarPath = application.defaultsPath & "/avatar.jpg";

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
  </cfscript>

  <cffunction name="onApplicationStart" returntype="boolean" output="false">
    <cfreturn true/>
  </cffunction>

  <cffunction name="onRequestStart" returntype="boolean" output="false">
    <cfargument name="targetPage" required="true" type="string">

    <cfif isdefined('U')>
      <cfset session.userid=U/>
    </cfif>
    <cfif NOT structKeyExists(session, "userid") AND NOT ListFindNoCase(arguments.targetPage, "loginform.cfm,login2.cfm") AND NOT ListFindNoCase(CGI.SCRIPT_NAME, "/app/login2.cfm")>
      <cflocation url="/loginform.cfm" addToken="false">
    </cfif>

    <cfif structKeyExists(session, "userid")>
    <CFINCLUDE template="/include/qry/fetchUsers.cfm" />
      <cfscript>
        session.userMediaPath = application.baseMediaPath & "\users\" & session.userID;
        session.userMediaUrl = application.baseMediaUrl & "/users/" & session.userID;

        session.userCalendarPath = session.userMediaPath & "\calendar\" & calendarname & ".ics";
        session.userCalendarUrl = "https://" & host & ".theactorsoffice.com/media-" & dsn & "calendar/" & calendarname & ".ics";

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

      <cfif isdefined('contactid')>

        <cfscript>

          defaultavatarurl = session.userContactsUrl & "/" & contactid & "/avatar.jpg";
        </cfscript>

      </cfif>
      <cfif isdefined('currentid')>

        <cfscript>

          defaultavatarurl = session.userContactsUrl & "/" & contactid & "/avatar.jpg";
        </cfscript>

      </cfif>

    </cfif>

    <cfreturn true/>
  </cffunction>

  <cffunction name="onRequest" returntype="void" output="true">
    <cfargument name="targetPage" required="true" type="string">
    <cfinclude template="#arguments.targetPage#">
  </cffunction>
</cfcomponent>
