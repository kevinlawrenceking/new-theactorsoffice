<!--- Define the query before using it --->
<cfquery name="systemNAMES" datasource="yourDataSource">
    SELECT id, systemname FROM yourTable
</cfquery>

<select id="select-system" name="new_systemid" class="form-control" data-parsley-required="" data-parsley-error-message="System is required">
    <option value="">Select a System...</option>
    <cfoutput query="systemNAMES">
        <option value="#systemNAMES.id#">#systemNAMES.systemname#</option>
    </cfoutput>
</select>

