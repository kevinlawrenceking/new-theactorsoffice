<script src="/app/assets/js/jquery.bootstrap-touchspin.js"></script> 
<cfsilent> 
    <cfinclude template="rpg_load.cfm" /> 
    <cfparam name="t1" default="0" /> 
    <cfparam name="t2" default="0" /> 
    <cfparam name="t3" default="0" /> 
    <cfparam name="t4" default="0" /> 
    <cfset curIcon = "" /> <!--- Standardize variable names and casing. --->
    <cfset headCols = 3 /> <!--- Standardize variable names and casing. --->
    <cfset valueCols = 9 /> <!--- Standardize variable names and casing. --->
</cfsilent> 

<!--- Check if 'flah' is defined and display a message if it is. --->
<cfif isdefined('flah')> 
    <p>RPGAdd.recordcount Enter the information below and press the Add button to continue.</p> <!--- Remove unnecessary `<cfoutput>` tags around variable outputs. --->
</cfif> 

<form action="/include/remoteNewFormAdd.cfm" method="post" class="needs-validation" novalidate> 
    <input type="hidden" name="rpgid" value="#rpgid#" /> 
    <input type="hidden" name="pgdir" value="#pgdir#" /> 
    <input type="hidden" name="t1" value="#t1#" /> 
    <input type="hidden" name="t2" value="#t2#" /> 
    <input type="hidden" name="t3" value="#t3#" /> 
    <input type="hidden" name="t4" value="#t4#" /> 

    <cfif isdefined('contactid')> 
        <input type="hidden" name="contactid" value="#contactid#" /> 
    </cfif> 

    <cfif isdefined('userid')> 
        <input type="hidden" name="userid" value="#userid#" /> 
    </cfif> 

    <div class="row"> 
        <!--- Loop through the RPGAdd query to generate form fields based on the type. --->
        <cfloop query="RPGAdd"> 
            <cfif RPGAdd.add_yn is "Y"> 
                <cfswitch expression="#RPGAdd.updatetype#">
                    <cfcase value="input">
                        <div class="form-group col-md-12"> 
                            <label for="#RPGAdd.fname#">#RPGAdd.updatename#</label> 
                            <input class="form-control" type="text" id="#RPGAdd.fname#" name="#RPGAdd.fname#" required placeholder="#RPGAdd.updatename#"> 
                            <div class="invalid-feedback"> Please enter a #RPGAdd.updatename#. </div> 
                        </div> 
                    </cfcase>

                    <!--- Other cases here --->

                </cfswitch>
            </cfif>
        </cfloop>
    </div> 

    <div class="form-group text-center"> 
        <button class="btn btn-xs btn-primary waves-effect mb-2 waves-light" style="background-color: ##406e8e; border: ##406e8e;" type="submit">Add</button> <!--- Use double pound signs `##` to avoid interpretation as variables. --->
    </div> 
</form> 

<script> 
// Example starter JavaScript for disabling form submissions if there are invalid fields
(function () { 'use strict' // Fetch all the forms we want to apply custom Bootstrap validation styles to var forms = document.querySelectorAll('.needs-validation') // Loop over them and prevent submission Array.prototype.slice.call(forms) .forEach(function (form) { form.addEventListener('submit', function (event) { if (!form.checkValidity()) { event.preventDefault() event.stopPropagation() } form.classList.add('was-validated') }, false) }) })() 
</script>

<!--- Maintain consistent and efficient conditional logic, especially for styling or control structures. --->
<!--- Remove unnecessary `<cfoutput>` tags around variable outputs. --->
<!--- Standardize variable names and casing. --->
<!--- Use double pound signs `##` to avoid interpretation as variables. --->