<cfcomponent displayname="ExportItemService" hint="Handles operations for ExportItem table" output="false"> 

<cffunction name="INSexportitems" access="public" returntype="void">
    <cfargument name="new_exportid" type="numeric" required="true">
    <cfargument name="new_contactid" type="numeric" required="true">
    <cfargument name="new_FirstName" type="string" required="false" default="">
    <cfargument name="new_LastName" type="string" required="false" default="">
    <cfargument name="new_Tag1" type="string" required="false" default="">
    <cfargument name="new_Tag2" type="string" required="false" default="">
    <cfargument name="new_Tag3" type="string" required="false" default="">
    <cfargument name="new_BusinessEmail" type="string" required="false" default="">
    <cfargument name="new_PersonalEmail" type="string" required="false" default="">
    <cfargument name="new_WorkPhone" type="string" required="false" default="">
    <cfargument name="new_MobilePhone" type="string" required="false" default="">
    <cfargument name="new_HomePhone" type="string" required="false" default="">
    <cfargument name="new_Company" type="string" required="false" default="">
    <cfargument name="new_Address" type="string" required="false" default="">
    <cfargument name="new_Address2" type="string" required="false" default="">
    <cfargument name="new_City" type="string" required="false" default="">
    <cfargument name="new_State" type="string" required="false" default="">
    <cfargument name="new_Zip" type="string" required="false" default="">
    <cfargument name="new_Country" type="string" required="false" default="">
    <cfargument name="new_ContactMeetingDate" type="date" required="false">
    <cfargument name="new_ContactMeetingLoc" type="string" required="false">
    <cfargument name="new_contactBirthday" type="date" required="false">
    <cfargument name="new_Website" type="string" required="false">

        <cfquery result="result"  datasource="#application.datasource#">
            INSERT INTO exportitems (
                exportid, contactid, FirstName, LastName, Tag1, Tag2, Tag3, BusinessEmail, PersonalEmail,
                WorkPhone, MobilePhone, HomePhone, Company, Address, Address2, City, State, Zip, Country,
                ContactMeetingDate, ContactMeetingLoc, contactBirthday, Website
            ) VALUES (
                <cfquery result="result" param cfsqltype="#CF_SQL_INTEGER#" value="#arguments.new_exportid#" />,
                <cfquery result="result" param cfsqltype="#CF_SQL_INTEGER#" value="#arguments.new_contactid#" />,
                <cfquery result="result" param cfsqltype="#CF_SQL_VARCHAR#" value="#arguments.new_FirstName#" maxlength=1000 null="#NOT len(trim(arguments.new_FirstName))#" />,
                <cfquery result="result" param cfsqltype="#CF_SQL_VARCHAR#" value="#arguments.new_LastName#" maxlength=1000 null="#NOT len(trim(arguments.new_LastName))#" />,
                <cfquery result="result" param cfsqltype="#CF_SQL_VARCHAR#" value="#arguments.new_Tag1#" maxlength=1000 null="#NOT len(trim(arguments.new_Tag1))#" />,
                <cfquery result="result" param cfsqltype="#CF_SQL_VARCHAR#" value="#arguments.new_Tag2#" maxlength=1000 null="#NOT len(trim(arguments.new_Tag2))#" />,
                <cfquery result="result" param cfsqltype="#CF_SQL_VARCHAR#" value="#arguments.new_Tag3#" maxlength=1000 null="#NOT len(trim(arguments.new_Tag3))#" />,
                <cfquery result="result" param cfsqltype="#CF_SQL_VARCHAR#" value="#arguments.new_BusinessEmail#" maxlength=1000 null="#NOT len(trim(arguments.new_BusinessEmail))#" />,
                <cfquery result="result" param cfsqltype="#CF_SQL_VARCHAR#" value="#arguments.new_PersonalEmail#" maxlength=1000 null="#NOT len(trim(arguments.new_PersonalEmail))#" />,
                <cfquery result="result" param cfsqltype="#CF_SQL_VARCHAR#" value="#arguments.new_WorkPhone#" maxlength=1000 null="#NOT len(trim(arguments.new_WorkPhone))#" />,
                <cfquery result="result" param cfsqltype="#CF_SQL_VARCHAR#" value="#arguments.new_MobilePhone#" maxlength=1000 null="#NOT len(trim(arguments.new_MobilePhone))#" />,
                <cfquery result="result" param cfsqltype="#CF_SQL_VARCHAR#" value="#arguments.new_HomePhone#" maxlength=1000 null="#NOT len(trim(arguments.new_HomePhone))#" />,
                <cfquery result="result" param cfsqltype="#CF_SQL_VARCHAR#" value="#arguments.new_Company#" maxlength=1000 null="#NOT len(trim(arguments.new_Company))#" />,
                <cfquery result="result" param cfsqltype="#CF_SQL_VARCHAR#" value="#arguments.new_Address#" maxlength=1000 null="#NOT len(trim(arguments.new_Address))#" />,
                <cfquery result="result" param cfsqltype="#CF_SQL_VARCHAR#" value="#arguments.new_Address2#" maxlength=1000 null="#NOT len(trim(arguments.new_Address2))#" />,
                <cfquery result="result" param cfsqltype="#CF_SQL_VARCHAR#" value="#arguments.new_City#" maxlength=1000 null="#NOT len(trim(arguments.new_City))#" />,
                <cfquery result="result" param cfsqltype="#CF_SQL_VARCHAR#" value="#arguments.new_State#" maxlength=1000 null="#NOT len(trim(arguments.new_State))#" />,
                <cfquery result="result" param cfsqltype="#CF_SQL_VARCHAR#" value="#arguments.new_Zip#" maxlength=1000 null="#NOT len(trim(arguments.new_Zip))#" />,
                <cfquery result="result" param cfsqltype="#CF_SQL_VARCHAR#" value="#arguments.new_Country#" maxlength=1000 null="#NOT len(trim(arguments.new_Country))#" />,
                <cfquery result="result" param cfsqltype="#CF_SQL_DATE#" value="#arguments.new_ContactMeetingDate#"
                    null = "#NOT isDate(arguments.new_ContactMeetingDate)#"/>,
                <cfquery result="result" param cfsqltype = "#CF_SQL_VARCHAR#"
                    value = "#arguments.new_ContactMeetingLoc#"
                    maxlength = 1000
                    null = "#NOT len(trim(arguments.new_ContactMeetingLoc))#"/>,
                <cfquery result="result" param cfsqltype = "#CF_SQL_DATE#"
                    value = "#arguments.new_contactBirthday#"
                    null = "#NOT isDate(arguments.new_contactBirthday)#"/>,
                <cfquery result="result" param cfsqltype = "#CF_SQL_VARCHAR#"
                    value = "#arguments.new_Website#"
                    maxlength = 1000
                    null = "#NOT len(trim(arguments.new_Website))#"/>
            )
        </cfquery>
     
</cffunction>

<cffunction name="SELexportitems" access="public" returntype="query">
    <cfargument name="exportID" type="numeric" required="true">
    
    <cfset var result = "">
    
        <cfquery name="result" datasource="abod">
            SELECT 
                contactid AS ID, 
                FirstName, 
                lastname, 
                Tag1, 
                Tag2, 
                Tag3, 
                BusinessEmail, 
                PersonalEmail, 
                WorkPhone, 
                MobilePhone, 
                HomePhone, 
                Company, 
                Address, 
                Address2, 
                City, 
                State, 
                Zip, 
                Country, 
                ContactMeetingDate, 
                ContactMeetingLoc, 
                ContactBirthday, 
                Website
            FROM exportitems
            WHERE exportid = <cfquery result="result" param cfsqltype="cf_sql_integer" value="#arguments.exportID#" />
        </cfquery>
    
    <cfreturn result>
</cffunction>
</cfcomponent>
