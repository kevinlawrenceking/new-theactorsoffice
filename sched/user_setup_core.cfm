<cfset host = ListFirst(cgi.server_name, ".") />

<cfif host eq "app" or host eq "uat">
    <cfset dsn = "abo" />
<cfelse>
    <cfset dsn = "abod" />
</cfif>

<cfparam name="dbugz" default="N" />

<cfparam name="dbug" default="Y" />

<cfparam name="select_user" default="0" />

<cfparam name="select_contactid" default="0" />

<cfparam name="select_userid" default="0" />

<cfif select_userid is "0">
    No user
    <cfabort />
</cfif>

        <cfscript>
           userid = select_userid/

    baseMediaPath = "C:\home\theactorsoffice.com\media-" & dsn;
    baseMediaUrl = "/media-" & dsn;

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

<cfset starttime = timeFormat(Now(), 'HHMMSS') />

<cfif not DirectoryExists(userMediaPath)>
    <cfdirectory directory="#userMediaPath#" action="create" />
</cfif>

<cfif not DirectoryExists(userContactsPath)>
    <cfdirectory directory="#userContactsPath#" action="create" />
</cfif>

<cfif not DirectoryExists(userImportsPath)>
    <cfdirectory directory="#userImportsPath#" action="create" />
</cfif>

<cfif not DirectoryExists(userExportsPath)>
    <cfdirectory directory="#userExportsPath#" action="create" />
</cfif>

<cfif not DirectoryExists(userSharePath)>
    <cfdirectory directory="#userSharePath#" action="create" />
</cfif>

<cfif NOT fileExists(userAvatarPath)>
    <cffile action="copy" source="#defaultAvatarUrl#" destination="#userAvatarPath#" />
</cfif>

<cfquery result="result"  datasource="#dsn#" name="C">
    SELECT contactid, recordname
    FROM contactdetails
    WHERE userid = <cfquery result="result" param value="#select_userid#" cfsqltype="CF_SQL_INTEGER">
    <cfif select_contactid neq 0>
        AND contactid = <cfquery result="result" param value="#select_contactid#" cfsqltype="CF_SQL_INTEGER">
    </cfif>
    ORDER BY contactid
</cfquery>

<cfloop query="C">
    <cfset new_contactid = C.contactid />

    <cfif not DirectoryExists(userContactsPath & "\" & new_contactid)>
        <cfdirectory directory="#userContactsPath#\#new_contactid#" action="create" />
    </cfif>

    <cfset contactPath = userContactsPath & "\" & new_contactid />
    <cfset contactAvatarPath = contactPath & "\avatar.jpg" />

    <cfif NOT fileExists(contactAvatarPath)>
        <cffile action="copy" source="#dir_missing_avatar_filename#" destination="#contactAvatarPath#" />
    </cfif>
</cfloop>


<cfquery result="result"  datasource="#dsn#" name="update_tags">
    UPDATE tags_user
    SET IsTeam = 1
    WHERE userid = <cfquery result="result" param value="#select_userid#" cfsqltype="CF_SQL_INTEGER"> and tagname IN (
    select tagname FROM tags WHERE isteam = 1)
</cfquery>

<cfset n=0 />

<cfquery result="result"  datasource="#dsn#" name="x">
    SELECT auddialectid,
    auddialect,
    audcatid,
    isDeleted
    FROM auddialects
    WHERE isdeleted = <cfquery result="result" param value="0" cfsqltype="CF_SQL_BIT">
</cfquery>

<cfloop query="x">

    <cfquery result="result"  datasource="#dsn#" name="find">
        Select * from auddialects_user
        where auddialect = '#x.auddialect#' and userid = <cfquery result="result" param value="#select_userid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>

    <cfif find.recordcount is "0">

        <cfoutput>
            <cfset n=n + 1 />
            <cfif n is "1">
                <h3>auddialects_user</h3>
            </cfif>
        </cfoutput>

        <cfquery result="result"  datasource="#dsn#" name="insert">
            INSERT INTO auddialects_user (auddialect, audcatid, userid)
            VALUES ('#x.auddialect#','#x.audcatid#',<cfquery result="result" param value="#select_userid#" cfsqltype="CF_SQL_INTEGER">);
        </cfquery>

        <cfoutput>
            auddialects added: #x.auddialect# (user #select_userid#)<br />
        </cfoutput>
    </cfif>
</cfloop>

<cfset n=0 />

<cfquery result="result"  datasource="#dsn#" name="x">
    select audgenreid,
    audgenre,
    audcatid,
    isDeleted
    FROM audgenres
    where isdeleted = <cfquery result="result" param value="0" cfsqltype="CF_SQL_BIT">
</cfquery>

<cfloop query="x">
    <cfquery result="result"  datasource="#dsn#" name="find">
        Select * from audgenres_user
        where audgenre = '#x.audgenre#' and userid = <cfquery result="result" param value="#select_userid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>

    <cfif find.recordcount is "0">
        <cfoutput>
            <cfset n=n + 1 />
            <cfif n is "1">
                <h3>audgenres_user</h3>
            </cfif>
        </cfoutput>

        <cfquery result="result"  datasource="#dsn#" name="insert">
            INSERT INTO audgenres_user (audgenre, audcatid, userid)
            VALUES ('#x.audgenre#','#x.audcatid#',<cfquery result="result" param value="#select_userid#" cfsqltype="CF_SQL_INTEGER">);
        </cfquery>

        <cfif dbug is "Y">
            <cfoutput>
                audgenres added: #x.audgenre#<br />
            </cfoutput>
        </cfif>
    </cfif>
</cfloop>

<cfset n=0 />

<cfquery result="result"  datasource="#dsn#" name="x">
    select networkid,
    network,
    audcatid,
    isDeleted
    FROM audnetworks
    where isdeleted = <cfquery result="result" param value="0" cfsqltype="CF_SQL_BIT">
</cfquery>

<cfloop query="x">
    <cfquery result="result"  datasource="#dsn#" name="find">
        Select * from audnetworks_user
        where network = '#x.network#' and userid = <cfquery result="result" param value="#select_userid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>

    <cfif find.recordcount is "0">
        <cfoutput>
            <cfset n=n + 1 />
            <cfif n is "1">
                <h3>audnetworks_user</h3>
            </cfif>
        </cfoutput>

        <cfquery result="result"  datasource="#dsn#" name="insert">
            INSERT INTO audnetworks_user (network, audcatid, userid)
            VALUES ('#x.network#','#x.audcatid#',<cfquery result="result" param value="#select_userid#" cfsqltype="CF_SQL_INTEGER">);
        </cfquery>

        <cfif dbug is "Y">
            <cfoutput>
                audnetworks added: #x.network#<br />
            </cfoutput>
        </cfif>
    </cfif>
</cfloop>

<cfset n=0 />

<cfquery result="result"  datasource="#dsn#" name="x">
    select opencallname FROM audopencalloptions WHERE isdeleted = <cfquery result="result" param value="0" cfsqltype="CF_SQL_BIT">
</cfquery>

<cfloop query="x">
    <cfquery result="result"  datasource="#dsn#" name="find">
        select opencallname
        FROM audopencalloptions_user
        where opencallname = '#x.opencallname#' and userid = <cfquery result="result" param value="#select_userid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>

    <cfif find.recordcount is "0">
        <cfoutput>
            <cfset n=n + 1 />
            <cfif n is "1">
                <h3>audopencalloptions_user</h3>
            </cfif>
        </cfoutput>

        <cfquery result="result"  datasource="#dsn#" name="insert">
            INSERT INTO audopencalloptions_user (opencallname, userid)
            VALUES ('#x.opencallname#', <cfquery result="result" param value="#select_userid#" cfsqltype="CF_SQL_INTEGER">);
        </cfquery>

        <cfif dbug is "Y">
            <cfoutput>opencallname_user: #x.opencallname# added</cfoutput><br />
        </cfif>
    </cfif>
</cfloop>

<cfset n=0 />

<cfquery result="result"  datasource="#dsn#" name="x">
    select audplatformid,
    audplatform,
    isDeleted
    FROM audplatforms
</cfquery>

<cfloop query="x">
    <cfquery result="result"  datasource="#dsn#" name="find">
        Select * from audplatforms_user
        where audplatform = '#x.audplatform#' and userid = <cfquery result="result" param value="#select_userid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>

    <cfif find.recordcount is "0">
        <cfoutput>
            <cfset n=n + 1 />
            <cfif n is "1">
                <h3>audplatforms_user</h3>
            </cfif>
        </cfoutput>

        <cfquery result="result"  datasource="#dsn#" name="insert">
            INSERT INTO audplatforms_user (audplatform, userid)
            VALUES ('#x.audplatform#',<cfquery result="result" param value="#select_userid#" cfsqltype="CF_SQL_INTEGER">);
        </cfquery>

        <cfif dbug is "Y">
            <cfoutput>
                audplatforms added: #x.audplatform#<br />
            </cfoutput>
        </cfif>
    </cfif>
</cfloop>

<cfset n=0 />

<cfquery result="result"  datasource="#dsn#" name="x">
    SELECT * FROM audquestions_default where isdeleted = <cfquery result="result" param value="0" cfsqltype="CF_SQL_BIT">
</cfquery>

<cfloop query="x">
    <cfquery result="result"  datasource="#dsn#" name="find">
        Select * from audquestions_user
        where isdeleted is false and qorder = #x.qorder# and userid = <cfquery result="result" param value="#select_userid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>

    <cfif find.recordcount is "0">
        <cfoutput>
            <cfset n=n + 1 />
            <cfif n is "1">
                <h3>audquestions_user</h3>
            </cfif>
        </cfoutput>

        <cfquery result="result"  datasource="#dsn#" name="insert">
            INSERT INTO audquestions_user (qtypeid, qtext, qorder, userid)
            VALUES (#x.qtypeid#, '#x.qtext#', #x.qorder#, <cfquery result="result" param value="#select_userid#" cfsqltype="CF_SQL_INTEGER">);
        </cfquery>

        <cfif dbug is "Y">
            <cfoutput>Audquestions_user added: #x.qtext#</cfoutput><br />
        </cfif>
    </cfif>
</cfloop>

<cfset n=0 />

<cfquery result="result"  datasource="#dsn#" name="x">
    SELECT submitsitename,catlist FROM audsubmitsites
</cfquery>

<cfloop query="x">
    <cfquery result="result"  datasource="#dsn#" name="find">
        Select * from audsubmitsites_user
        where submitsitename = '#x.submitsitename#' and userid = <cfquery result="result" param value="#select_userid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>

    <cfif find.recordcount is "0">
        <cfoutput>
            <cfset n=n + 1 />
            <cfif n is "1">
                <h3>audsubmitsites_user</h3>
            </cfif>
        </cfoutput>

        <cfquery result="result"  datasource="#dsn#" name="insert">
            INSERT INTO audsubmitsites_user (submitsitename, catlist, userid)
            VALUES ('#x.submitsitename#','#x.catlist#',<cfquery result="result" param value="#select_userid#" cfsqltype="CF_SQL_INTEGER">);
        </cfquery>

        <cfif dbug is "Y">
            <cfoutput>audsubmitsites_user added: #x.submitsitename#</cfoutput><br />
        </cfif>
    </cfif>
</cfloop>

<cfset n=0 />

<cfquery result="result"  datasource="#dsn#" name="x">
    select toneid,
    tone,
    audcatid,
    isDeleted
    FROM audtones
    where isdeleted = <cfquery result="result" param value="0" cfsqltype="CF_SQL_BIT">
</cfquery>

<cfloop query="x">
    <cfquery result="result"  datasource="#dsn#" name="find">
        Select * from audtones_user
        where tone = '#x.tone#' and userid = <cfquery result="result" param value="#select_userid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>

    <cfif find.recordcount is "0">
        <cfoutput>
            <cfset n=n + 1 />
            <cfif n is "1">
                <h3>audtones_user</h3>
            </cfif>
        </cfoutput>

        <cfquery result="result"  datasource="#dsn#" name="insert">
            INSERT INTO audtones_user (tone, audcatid, userid)
            VALUES ('#x.tone#','#x.audcatid#',<cfquery result="result" param value="#select_userid#" cfsqltype="CF_SQL_INTEGER">);
        </cfquery>

        <cfoutput>
            audtones added: #x.tone#<br />
        </cfoutput>
    </cfif>
</cfloop>

<cfset n=0 />

<cfquery result="result"  datasource="#dsn#" name="x">
    select eventTypeName,
    eventtypedescription,
    eventtypecolor
    FROM eventtypes
    where isdeleted = <cfquery result="result" param value="0" cfsqltype="CF_SQL_BIT">
</cfquery>

<cfloop query="x">
    <cfquery result="result"  datasource="#dsn#" name="find">
        select eventTypeName,
        eventtypedescription,
        eventtypecolor
        FROM eventtypes_user
        where eventTypeName = '#x.eventtypeName#' and userid = <cfquery result="result" param value="#select_userid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>

    <cfif find.recordcount is "0">
        <cfoutput>
            <cfset n=n + 1 />
            <cfif n is "1">
                <h3>eventtypes_user</h3>
            </cfif>
        </cfoutput>

        <cfquery result="result"  datasource="#dsn#" name="insert">
            INSERT INTO eventtypes_user (eventTypeName, eventtypedescription, eventtypecolor, userid)
            VALUES ('#x.eventTypeName#', '#x.eventtypedescription#', '#x.eventtypecolor#', <cfquery result="result" param value="#select_userid#" cfsqltype="CF_SQL_INTEGER">);
        </cfquery>

        <cfif dbug is "Y">
            <cfoutput>eventtypes_user: #x.eventTypeName# added</cfoutput><br />
        </cfif>
    </cfif>
</cfloop>

<cfset n=0 />

<cfquery result="result"  datasource="#dsn#" name="x">
    SELECT genderpronoun, genderpronounplural FROM genderpronouns where isdeleted = <cfquery result="result" param value="0" cfsqltype="CF_SQL_BIT">
</cfquery>

<cfloop query="x">
    <cfquery result="result"  datasource="#dsn#" name="find">
        Select * from genderpronouns_users
        where genderpronoun = '#x.genderpronoun#' and userid = <cfquery result="result" param value="#select_userid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>

    <cfif find.recordcount is "0">
        <cfoutput>
            <cfset n=n + 1 />
            <cfif n is "1">
                <h3>genderpronouns_users</h3>
            </cfif>
        </cfoutput>

        <cfquery result="result"  datasource="#dsn#" name="insert">
            INSERT INTO genderpronouns_users (genderpronoun, genderpronounplural, userid)
            VALUES ('#x.genderpronoun#','#x.genderpronounplural#',<cfquery result="result" param value="#select_userid#" cfsqltype="CF_SQL_INTEGER">);
        </cfquery>

        <cfif dbug is "Y">
            <cfoutput>genderpronouns_users: #x.genderpronoun# added</cfoutput><br />
        </cfif>
    </cfif>
</cfloop>

<cfset n=0 />

<cfquery result="result"  datasource="#dsn#" name="x">
    select typeid, valuetype, typeicon FROM itemtypes
</cfquery>

<cfloop query="x">
    <cfquery result="result"  datasource="#dsn#" name="find">
        Select * from itemtypes_user
        where valuetype = '#x.valuetype#' and userid = <cfquery result="result" param value="#select_userid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>

    <cfif find.recordcount is "0">
        <cfoutput>
            <cfset n=n + 1 />
            <cfif n is "1">
                <h3>itemtypes_user</h3>
            </cfif>
        </cfoutput>

        <cfquery result="result"  datasource="#dsn#" name="insert">
            INSERT INTO itemtypes_user (valuetype, typeicon, userid)
            VALUES ('#x.valuetype#', '#x.typeicon#', <cfquery result="result" param value="#select_userid#" cfsqltype="CF_SQL_INTEGER">);
        </cfquery>

        <cfif dbug is "Y">
            <cfoutput>itemtypes_user: #x.valuetype# added</cfoutput><br />
        </cfif>
    </cfif>
</cfloop>

<cfset n=0 />

<cfquery result="result"  datasource="#dsn#" name="x">
    select DISTINCT c.catid, i.valuetype
    FROM itemcategory c
    inner join itemcatxref x ON x.catid = c.catid
    INNER JOIN itemtypes i ON i.typeid = x.typeid
    WHERE c.isdeleted = <cfquery result="result" param value="0" cfsqltype="CF_SQL_BIT"> AND i.isdeleted = <cfquery result="result" param value="0" cfsqltype="CF_SQL_BIT">
    ORDER BY c.catid, i.valuetype
</cfquery>

<cfloop query="x">
    <cfset new_catid=x.catid />

    <cfquery result="result"  datasource="#dsn#" name="find">
        Select typeid from itemtypes_user
        where valuetype = '#x.valuetype#' and userid = <cfquery result="result" param value="#select_userid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>

    <cfset new_typeid=find.typeid />

    <cfquery result="result"  datasource="#dsn#" name="check">
        select * from itemcatxref_user where userid = <cfquery result="result" param value="#select_userid#" cfsqltype="CF_SQL_INTEGER"> and typeid = #new_typeid# and catid = #new_catid#
    </cfquery>

    <cfif check.recordcount is "0">
        <cfoutput>
            <cfset n=n + 1 />
            <cfif n is "1">
                <h3>itemcatxref_user</h3>
            </cfif>
        </cfoutput>

        <cfquery result="result"  datasource="#dsn#" name="insert">
            INSERT INTO itemcatxref_user (typeid, catid, userid)
            VALUES (#new_typeid#, #new_catid#, <cfquery result="result" param value="#select_userid#" cfsqltype="CF_SQL_INTEGER">);
        </cfquery>

        <cfif dbug is "Y">
            <cfoutput>itemcatxref_user: (#new_typeid#, #new_catid#, #select_userid# added</cfoutput><br />
        </cfif>
    </cfif>
</cfloop>

<cfset n=0 />

<cfquery result="result"  datasource="#dsn#" name="x">
    SELECT * FROM pgpanels_master
</cfquery>

<cfloop query="x">
    <cfquery result="result"  datasource="#dsn#" name="find">
        SELECT * FROM pgpanels_user where userid = <cfquery result="result" param value="#select_userid#" cfsqltype="CF_SQL_INTEGER"> and pnFilename = '#x.pnFilename#' and isdeleted = <cfquery result="result" param value="0" cfsqltype="CF_SQL_BIT">
    </cfquery>

    <cfif find.recordcount is "0">
        <cfoutput>
            <cfset n=n + 1 />
            <cfif n is "1">
                <h3>pgpanels_user</h3>
            </cfif>
        </cfoutput>

        <cfquery result="result"  datasource="#dsn#" name="insert">
            INSERT INTO pgpanels_user (userid, pnTitle, pnFilename, pnOrderNo, pnColXl, pnColMd, pnDescription, IsVisible)
            VALUES (#select_userid#, '#x.pntitle#', '#x.pnfilename#', #x.pnOrderNo#, #x.pnColXl#, #x.pnColMd#, '#x.pnDescription#', 1);
        </cfquery>
    </cfif>
</cfloop>

<cfset n=0 />

<cfquery result="result"  datasource="#dsn#" name="x">
    SELECT * FROM tags
</cfquery>

<cfloop query="x">
    <cfquery result="result"  datasource="#dsn#" name="find">
        Select * from tags_user
        where tagname = '#x.tagname#' and userid = <cfquery result="result" param value="#select_userid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>

    <cfif find.recordcount is "0">
        <cfoutput>
            <cfset n=n + 1 />
            <cfif n is "1">
                <h3>tags_user</h3>
            </cfif>
        </cfoutput>

        <cfquery result="result"  datasource="#dsn#" name="insert">
            INSERT INTO tags_user (tagname, userid)
            VALUES ('#x.tagname#', <cfquery result="result" param value="#select_userid#" cfsqltype="CF_SQL_INTEGER">);
        </cfquery>

        <cfif dbug is "Y">
            <cfoutput>tags_user: #x.tagname# added</cfoutput><br />
        </cfif>
    </cfif>
</cfloop>

<cfquery result="result"  datasource="#dsn#" name="x">
    SELECT tagname, isteam, iscasting, tagtype FROM tags
</cfquery>

<cfloop query="x">
    <cfquery result="result"  datasource="#dsn#" name="insert">
        update tags_user
        set isteam = #x.isteam#, iscasting = #x.iscasting#, tagtype = '#x.tagtype#'
        where tagname = '#x.tagname#'
    </cfquery>
</cfloop>

<Cfset n=0 />

<cfquery result="result"  datasource="#dsn#" name="x">
    select sitetypename, sitetypedescription from sitetypes_master
</cfquery>

<cfloop query="x">
    <cfquery result="result"  datasource="#dsn#" name="find">
        Select * from sitetypes_user
        where sitetypename = '#x.sitetypename#' and userid = <cfquery result="result" param value="#select_userid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>

    <cfif find.recordcount is "0">
        <cfoutput>
            <cfset n=n + 1 />
            <cfif n is "1">
                <h3>sitetypes_user</h3>
            </cfif>
        </cfoutput>

        <cfquery result="result"  datasource="#dsn#" name="insert">
            INSERT INTO sitetypes_user (siteTypeName, siteTypeDescription, userid)
            VALUES ('#x.sitetypename#', '#x.sitetypedescription#', <cfquery result="result" param value="#select_userid#" cfsqltype="CF_SQL_INTEGER">);
        </cfquery>

        <cfoutput>
            sitetypes_user added: #x.sitetypename#<br />
        </cfoutput>
    </cfif>
</cfloop>

<cfset n=0 />

<cfquery result="result"  datasource="#dsn#" name="x">
    SELECT
        s.id,
        s.sitename,
        s.siteURL,
        s.siteicon,
        s.sitetypeid,
        t.sitetypename
    FROM
        sitelinks_master s
        INNER JOIN sitetypes_master t ON t.sitetypeid = s.siteTypeid
    ORDER BY
        s.sitename
</cfquery>

<cfloop query="x">
    <cfquery result="result"  datasource="#dsn#" name="find">
        SELECT sitetypeid
        FROM sitetypes_user
        WHERE sitetypename = <cfquery result="result" param value="#x.sitetypename#" cfsqltype="CF_SQL_VARCHAR">
        AND userid = <cfquery result="result" param value="#select_userid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>

    <cfif dbug eq "Y">
        <cfoutput>
            SELECT sitetypeid FROM sitetypes_user
            WHERE sitetypename = '#x.sitetypename#' AND userid = #select_userid# (#find.recordcount#)<br/>
        </cfoutput>
    </cfif>

    <cfif find.recordcount eq 1>
        <cfoutput>
            <cfset n = n + 1 />
            <cfif n eq 1>
                <h3>sitelinks_user</h3>
            </cfif>
        </cfoutput>

        <cfset new_sitetypeid = find.sitetypeid />

        <cfif dbug eq "Y">
            <cfoutput>
                <h3>new_sitetypeid: #new_sitetypeid#</h3>
            </cfoutput>
        </cfif>

        <cfquery result="result"  datasource="#dsn#" name="find2">
            SELECT *
            FROM sitelinks_user
            WHERE sitename = <cfquery result="result" param value="#x.sitename#" cfsqltype="CF_SQL_VARCHAR">
            AND userid = <cfquery result="result" param value="#select_userid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>

        <cfif dbug eq "Y">
            <cfoutput>
                SELECT * FROM sitelinks_user WHERE sitename = '#x.sitename#' AND userid = #select_userid#<br/>
            </cfoutput>
        </cfif>

        <cfif find2.recordcount eq 0>
            <cfif dbug eq "Y">
                <cfoutput>
                    INSERT INTO sitelinks_user_tbl (siteName, siteURL, siteicon, siteTypeid, userid)
                    VALUES ('#x.sitename#', '#x.siteurl#', '#x.siteicon#', #new_sitetypeid#, #select_userid#)<br/>
                </cfoutput>
            </cfif>

            <cfquery result="result"  datasource="#dsn#" name="insert">
                INSERT INTO sitelinks_user_tbl (siteName, siteURL, siteicon, siteTypeid, userid)
                VALUES (
                    <cfquery result="result" param value="#x.sitename#" cfsqltype="CF_SQL_VARCHAR">,
                    <cfquery result="result" param value="#x.siteurl#" cfsqltype="CF_SQL_VARCHAR">,
                    <cfquery result="result" param value="#x.siteicon#" cfsqltype="CF_SQL_VARCHAR">,
                    <cfquery result="result" param value="#new_sitetypeid#" cfsqltype="CF_SQL_INTEGER">,
                    <cfquery result="result" param value="#select_userid#" cfsqltype="CF_SQL_INTEGER">
                )
            </cfquery>

            <cfif dbug eq "Y">
                <cfoutput>
                    sitelinks_user_tbl: #x.sitename# added<br />
                </cfoutput>
            </cfif>
        </cfif>
    </cfif>
</cfloop>

<cfset n = 0 />



<cfquery result="result"  datasource="#dsn#" name="x">
    SELECT sitetypeid, sitetypename, sitetypedescription from sitetypes_user where userid = <cfquery result="result" param value="#select_userid#" cfsqltype="CF_SQL_INTEGER">
</cfquery>

<cfloop query="x">
    <cfoutput>
        <cfset new_pntitle = "#x.sitetypename# Links" />
        <cfset new_sitetypeid = x.sitetypeid />
    </cfoutput>

    <cfquery result="result"  name="Findtotal" maxrows="1" datasource="#dsn#">
        Select p.pnOrderno + 1 as new_pnOrderNo
        from pgpanels_user p 
        where p.userid = <cfquery result="result" param value="#select_userid#" cfsqltype="CF_SQL_INTEGER">
        order by p.pnOrderno desc
    </cfquery> 

    <cfquery name="add" datasource="#dsn#" result="PN">    
        INSERT INTO pgpanels_user (pnTitle, pnFilename, pnorderno, pncolxl, pncolMd, pnDescription, IsDeleted, IsVisible, userid)
        VALUES ('#new_pnTitle#', 'mylinks_user.cfm', #Findtotal.new_pnOrderNo#, <cfquery result="result" param value="3" cfsqltype="CF_SQL_INTEGER">, <cfquery result="result" param value="3" cfsqltype="CF_SQL_INTEGER">, '', 0, 1, <cfquery result="result" param value="#select_userid#" cfsqltype="CF_SQL_INTEGER">)
    </cfquery>

    <cfset new_pnid = PN.generated_key />

    <cfquery result="result"  name="add" datasource="#dsn#"> 
        update sitetypes_user
        set pnid = <cfquery result="result" param value="#new_pnid#" cfsqltype="CF_SQL_INTEGER"> where sitetypeid = <cfquery result="result" param value="#new_sitetypeid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>
</cfloop>
