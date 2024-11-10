<!--- This ColdFusion page handles the submission of a form for adding an audio link. --->

<cfparam name="placeholder" default="" />
<cfparam name="contactid" default="0" />

<form action="/include/audlinkadd2.cfm" method="post" class="parsley-examples" id="linkadd" 
      data-parsley-excluded="input[type=button], input[type=submit], input[type=reset], input[type=hidden], [disabled], :hidden"
      data-parsley-trigger="keyup" data-parsley-validate>
    
    <cfoutput>
        <input type="hidden" name="audroleid" value="#audroleid#">
        <input type="hidden" name="eventid" value="#eventid#">
        <input type="hidden" name="audprojectid" value="#audprojectid#">
    </cfoutput>

    <cfset placeholder="https://" />
    <cfset minlength="3" />

    <div class="row">
        
        <div class="form-group col-md-12">
            <label for="linkname">Name <span class="text-danger">*</span></label>
            <input class="form-control" type="text" id="linkname" name="linkname" 
                   data-parsley-maxlength="800" 
                   data-parsley-maxlength-message="Max length 800 characters"  
                   data-parsley-required="true" 
                   placeholder="Enter Name or Title">
        </div>

        <div class="form-group col-md-12">
            <label for="linkurl">URL <span class="text-danger">*</span></label>
            <input class="form-control" type="text" id="linkurl" name="linkurl" 
                   data-parsley-maxlength="800" 
                   data-parsley-maxlength-message="Max length 800 characters" 
                   data-parsley-required="true" 
                   placeholder="Enter URL">
        </div>

        <div class="form-group text-center col-md-12">
            <button class="btn btn-primary editable-submit btn-sm waves-effect waves-light" 
                    type="submit" 
                    style="background-color: #406e8e; border: #406e8e;">Add</button>
        </div>

    </div>
</form>

<script>      
    $(document).ready(function() {
        $(".parsley-examples").parsley();
    });
</script>
