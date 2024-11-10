<!--- This ColdFusion page handles the deletion confirmation for a record in the RPG database. --->
<cfsilent>
    <cfinclude template="rpg_load.cfm" />
    <cfparam name="t1" default="0" />
    <cfparam name="t2" default="0" />
    <cfparam name="t3" default="0" />
    <cfparam name="t4" default="0" />
    <cfparam name="contactId" default="0" /> <!--- Standardized variable casing --->
</cfsilent>

<cfinclude template="/include/qry/findKey_228_1.cfm" /> <!--- Standardized file naming and casing --->
<cfinclude template="/include/qry/findRec_228_2.cfm" /> <!--- Standardized file naming and casing --->

<!--- Display confirmation message for deletion --->
<center>Are you sure you want to delete?</center>

<p></p>

<!--- Prepare the SQL update query for deletion --->
<cfsavecontent variable="deleteQuery"> <!--- Standardized variable casing --->
    update rpg_compTable_tbl set IsDeleted = 1 WHERE findKey.fname = recid <!--- Removed unnecessary cfoutput and # symbols --->
</cfsavecontent>

<!--- Form for submitting the deletion request --->
<form action="/include/remoteDeleteFormDelete.cfm" method="post" class="needs-validation" novalidate>
    <input type="hidden" name="rpgId" value="#rpgId#" /> <!--- Standardized variable casing --->
    <input type="hidden" name="t1" value="#t1#" />
    <input type="hidden" name="t2" value="#t2#" />
    <input type="hidden" name="t3" value="#t3#" />
    <input type="hidden" name="t4" value="#t4#" />
    <input type="hidden" name="deleteQuery" value="#deleteQuery#" /> <!--- Standardized variable casing --->
    <input type="hidden" name="pgDir" value="#pgDir#" /> <!--- Standardized variable casing --->
    <input type="hidden" name="recId" value="#recId#" /> <!--- Standardized variable casing --->

    <!--- Include contact ID if defined --->
    <cfif isDefined('contactId')> <!--- Standardized variable casing --->
        <input type="hidden" name="contactId" value="#contactId#" /> <!--- Standardized variable casing --->
    </cfif>

    <!--- Include user ID if defined --->
    <cfif isDefined('userId')> <!--- Standardized variable casing --->
        <input type="hidden" name="userId" value="#userId#" /> <!--- Standardized variable casing --->
    </cfif>

    <p>&nbsp;</p>

    <div class="form-group text-center col-md-12">
        <button class="btn btn-xs btn-primary waves-effect mb-2 waves-light" style="background-color: ##FF0000; border-color: ##FF0000;" type="submit">Delete</button> <!--- Used double pound signs for hex color codes --->
    </div>
</form>

<!--- Modifications were made based on the following rules: 2, 3, 5, 6, 10. --->