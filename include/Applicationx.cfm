<cfscript>
    host = ListFirst(cgi.server_name, ".");
    if (host == "app" || host == "uat") {
        datasourceName = "abo";
        dsn = "abo";
    } else {
        datasourceName = "abod";
        dsn = "abod";
    }
</cfscript>


<cfapplication 
    name="TAO_dev" 
    sessionmanagement="true" 
    applicationtimeout="#createTimeSpan(1, 0, 0, 0)#" 
    sessiontimeout="#createTimeSpan(0, 1, 0, 0)#" 
    datasource="#datasourceName#"
    setclientcookies="true"
>


<cfif isDefined('userid')>
<cfscript>
                baseMediaPath = "C:\home\theactorsoffice.com\media-" & datasourceName;
                baseMediaUrl = "/media-" & datasourceName;

                imagesPath = baseMediaPath & "\images";
                iapplication.imagesUrl = baseMediaUrl & "/images";

                datesPath = imagesPath & "\dates";
                datesUrl = iapplication.imagesUrl & "/dates";

                defaultsPath = imagesPath & "\defaults";
                defaultsUrl = iapplication.imagesUrl & "/defaults";

                defaultAvatarUrl = defaultsUrl & "/avatar.jpg";
                defaultAvatarPath = defaultsPath & "\avatar.jpg";

                emailImagesPath = imagesPath & "\email";
                emailIapplication.imagesUrl = iapplication.imagesUrl & "/email";

                filetypesPath = imagesPath & "\filetypes";
                filetypesUrl = iapplication.imagesUrl & "/filetypes";

                retinaIconsPath = imagesPath & "\retina-circular-icons";
                retinaIconsUrl = iapplication.imagesUrl & "/retina-circular-icons";

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

