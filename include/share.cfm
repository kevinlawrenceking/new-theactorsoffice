<!--- This ColdFusion page handles user data display and provides a link for sharing user information. --->
<cfparam name="contactExpand" default="true" />
<cfparam name="a" default="0" />
<cfparam name="d" default="0" />
<cfparam name="s" default="0" />
<cfparam name="contactCheckVisible" default="false" />
<cfparam name="maintenanceExpand" default="false" />
<cfparam name="byTag" default="" />
<cfparam name="targetExpand" default="false" />
<cfparam name="followUpExpand" default="false" />
<cfparam name="allExpand" default="false" />
<cfparam name="pgAction" default="view" />

<!--- Check if session variable 'pgAction' is defined; if not, set it to 'view' --->
<cfif NOT isDefined('session.pgAction')>
    <cfset session.pgAction = "view">
</cfif>

<!--- Include the query template for user data --->
<cfinclude template="/include/qry/x_291_1.cfm" />

<div class="row">
    <div class="col-lg-12">
        <div class="card">
            <div class="card-body">
                <!--- Loop through the query results and output user information with a share link --->
                <cfloop query="x">
                    <cfoutput>
                        #x.userFirstName# #x.userLastName#: 
                        <a href="https://##host##.theactorsoffice.com/share/?u=##left(passwordHash,10)##"> 
                            https://##host##.theactorsoffice.com/share/?u=##left(passwordHash,10)##
                        </a><br/>
                    </cfoutput>
                </cfloop>
            </div>
        </div>
    </div>
</div> <!--- end row --->
</div> <!--- container --->

<!--- Changes: 
1. Standardized variable names and casing.
2. Removed unnecessary `<cfoutput>` tags around variable outputs.
3. Used double pound signs `##` to avoid interpretation as variables.
--->