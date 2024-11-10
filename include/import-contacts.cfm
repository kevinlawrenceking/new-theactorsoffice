<script> 
    function unlock() { 
        document.getElementById('buttonSubmit').removeAttribute("disabled"); 
    } 
</script> 

<cfinclude template="/include/qry/imports.cfm" /> 
<cfparam name="step" default="1" /> 

<cfif isDefined('uploadid')> 
    <cfinclude template="/include/qry/upload_details_141_1.cfm" /> 
    <cfset contactList = valuelist(upload_details.contactid) /> 
    <cfinclude template="/include/qry/results_141_2.cfm" /> 

    <h6> 
        <cfoutput>#results.recordcount#</cfoutput> relationship contacts were imported. Click on a name to view details.
    </h6> 

    <table id="basic-datatable" class="table display dt-responsive nowrap w-100 table-striped" role="grid"> 
        <thead> 
            <cfoutput query="results" maxrows="1"> 
                <cfif (Results.CurrentRow MOD 2)> 
                    <cfset rowType = "Odd" /> 
                <cfelse> 
                    <cfset rowType = "Even" /> 
                </cfif> 

                <tr class="#rowType#"> 
                    <th>#head1#</th> 
                    <th>#head2#</th> 
                    <th>#head3#</th> 
                    <th>#head4#</th> 
                    <th>#head5#</th> 
                    <th>#head6#</th> 
                </tr> 
            </cfoutput> 
        </thead> 

        <tbody> 
            <cfloop query="results">  
                <cfset phoneNumber = results.col3 /> 
                <cfset cleanPhoneNumber = reReplace(phoneNumber, "[^0-9]", "", "ALL")> 

                <cfif len(cleanPhoneNumber) is "10"> 
                    <cfset formatPhoneNumber = "(#left(cleanPhoneNumber, 3)#) #mid(cleanPhoneNumber, 4, 3)#-#right(cleanPhoneNumber, 4)#" /> 
                    <cfset anchorPhoneNumber = "#left(cleanPhoneNumber, 3)#-#mid(cleanPhoneNumber, 4, 3)#-#right(cleanPhoneNumber, 4)#" /> 
                <cfelse> 
                    <cfset formatPhoneNumber = phoneNumber & "*" /> 
                    <cfset anchorPhoneNumber = cleanPhoneNumber & "*" /> 
                </cfif> 

                <cfset currentLink = "/app/contact/index.cfm?contactid=" & results.contactid /> 

                <tr role="row"> 
                    <td> 
                        <a href="#currentLink#" class="text-body font-weight-semibold"> #results.col1# </a> 
                    </td> 
                    <td>#col2#</td> 
                    <td><a href="tel:#anchorPhoneNumber#">#formatPhoneNumber#</a></td> 
                    <td>#col4#</td> 
                    <td>#col5#</td> 
                    <td> 
                        <cfif status is not "Added"> 
                            <font color="red">#status#</font> 
                        <cfelse> 
                            #status# 
                        </cfif> 
                    </td> 
                </tr>
            </cfloop> 
        </tbody> 
    </table>

<!--- Rest of the code --->

<!--- Changes made: Standardized variable names and casing (Rule 5), Removed unnecessary `<cfoutput>` tags around variable outputs (Rule 2), Avoided using `#` symbols within conditional checks unless essential (Rule 3), Ensured consistent attribute quoting, spacing, and formatting (Rule 6) --->