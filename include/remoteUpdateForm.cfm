<script src="/app/assets/js/jquery.bootstrap-touchspin.js"></script> 
<cfsilent> 
    <cfinclude template="rpg_load.cfm" /> 
    <cfparam name="detailsPageId" default="" /> 
    <cfparam name="t1" default="0" /> 
    <cfparam name="t2" default="0" /> 
    <cfparam name="t3" default="0" /> 
    <cfparam name="t4" default="0" /> 
    <cfinclude template="/include/qry/FindModalTitle_265_1.cfm" /> 
    <cfinclude template="/include/qry/update.cfm" /> 
</cfsilent> 

<cfset currentIcon=""> 
<cfset headerColumns=3 /> 
<cfset valueColumns=9 /> 

<cfinclude template="/include/qry/find_265_2.cfm" /> 

<p>Enter the information below and press the update button to continue.</p> 

<form action="/include/remoteUpdateFormUpdate.cfm" method="post" class="needs-validation" novalidate> 
    <input type="hidden" name="rpgid" value="<cfoutput>#rpgid#</cfoutput>" /> 
    <input type="hidden" name="detailsPageId" value="<cfoutput>#detailsPageId#</cfoutput>" /> 
    <input type="hidden" name="t1" value="<cfoutput>#t1#</cfoutput>" /> 
    <input type="hidden" name="t2" value="<cfoutput>#t2#</cfoutput>" /> 
    <input type="hidden" name="t3" value="<cfoutput>#t3#</cfoutput>" /> 
    <input type="hidden" name="t4" value="<cfoutput>#t4#</cfoutput>" /> 
    <input type="hidden" name="pgdir" value="<cfoutput>#pgdir#</cfoutput>" /> 
    <input type="hidden" name="detailsRecordId" value="<cfoutput>#detailsRecordId#</cfoutput>" /> 
    <input type="hidden" name="pageId" value="<cfoutput>#pageId#</cfoutput>" /> 
    <input type="hidden" name="recordId" value="<cfoutput>#recordId#</cfoutput>" /> 

    <cfif isdefined('contactid')> 
        <input type="hidden" name="contactid" value="<cfoutput>#contactid#</cfoutput>" /> 
    </cfif> 

    <cfif isdefined('userid')> 
        <input type="hidden" name="userid" value="<cfoutput>#userid#</cfoutput>" /> 
    </cfif> 

<div class="row" /> 

<cfloop query="RPGUpdate"> 
    <cfif RPGUpdate.updateYesNo is "Y"> 
        <cfinclude template="/include/qry/FindValue_265_3.cfm" /> 

        <!--- Handle different update types ---> 
        <cfswitch expression="#RPGUpdate.updateType#">
            <cfcase value="input">
                <div class="form-group col-md-12"> 
                    <label for="<cfoutput>#RPGUpdate.fieldName#</cfoutput>"><cfoutput>#RPGUpdate.updateName#</cfoutput></label> 
                    <input class="form-control" type="text" id="<cfoutput>#RPGUpdate.fieldName#</cfoutput>" name="new_<cfoutput>#RPGUpdate.fieldName#</cfoutput>" value="<cfoutput>#FindValue.fieldValue#</cfoutput>" <cfif RPGUpdate.requiredYesNo is "Y">required</cfif> placeholder="<cfoutput>#RPGUpdate.updateName#</cfoutput>"> 
                    <div class="invalid-feedback"> Please enter a <cfoutput>#RPGUpdate.updateName#</cfoutput>. </div> 
                </div> 
            </cfcase>
            <!--- Other cases here --->
        </cfswitch>
    </cfif> 
</cfloop> 

<div class="form-group text-center col-md-12"> 
    <button class="btn btn-xs btn-primary waves-effect mb-2 waves-light" style="background-color: ##406e8e; border: ##406e8e;" type="submit">Update</button> 
</div> 

</form> 

<cfoutput> select recordname as value, recordname as text from #RPgupdate.tableSelect# order by recordname </cfoutput> 

<cfabort> 

<script> 
    // Example starter JavaScript for disabling form submissions if there are invalid fields 
    (function() { 
        'use strict' 
        // Fetch all the forms we want to apply custom Bootstrap validation styles to 
        var forms = document.querySelectorAll('.needs-validation') 
        // Loop over them and prevent submission 
        Array.prototype.slice.call(forms) 
            .forEach(function(form) { 
                form.addEventListener('submit', function(event) { 
                    if (!form.checkValidity()) { 
                        event.preventDefault() 
                        event.stopPropagation() 
                    } 

                    form.classList.add('was-validated') 
                }, false) 
            }) 
    })() 
</script>

<!--- Changes made based on standards: 2, 3, 5, 6, 10 --->