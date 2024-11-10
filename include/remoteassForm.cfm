<!--- This ColdFusion page handles the display and submission of audit questions based on certain conditions. --->
<cfinclude template="/include/qry/aud_questions.cfm" />

<!--- Check if there are no questions available --->
<cfif questions.recordcount eq 0>
    <cfinclude template="/include/qry/x_214_1.cfm" />

    <!--- Loop through the query results for x --->
    <cfloop query="x">
        <cfinclude template="/include/qry/insert_41_3.cfm" />
    </cfloop>

    <cfinclude template="/include/qry/aud_questions.cfm" />
</cfif>

<!--- Form for submitting audit responses --->
<form action="/include/remoteassformUpdate.cfm" method="post" class="parsley-examples" id="remoteass" data-parsley-excluded="input[type=button], input[type=submit], input[type=reset], input[type=hidden], [disabled], :hidden" data-parsley-trigger="keyup" data-parsley-validate>
    <input type="hidden" name="eventid" value="#eventid#">
    <input type="hidden" name="audprojectid" value="#audprojectid#">

    <div class="row"></div>

    <!--- Loop through the questions query --->
    <cfloop query="questions">
        <div class="form-group col-md-12 p-1">
            <label for="q#questions.qid#">#questions.qtext#</label>

            <!--- Check if the question type is rating --->
            <cfif questions.qtype eq "rating">
                <select id="q#questions.qid#" name="q#questions.qid#">
                    <option value="0"></option>
                    <option value="1"<cfif questions.aRating eq 1> selected</cfif>>1</option>
                    <option value="2"<cfif questions.aRating eq 2> selected</cfif>>2</option>
                    <option value="3"<cfif questions.aRating eq 3> selected</cfif>>3</option>
                    <option value="4"<cfif questions.aRating eq 4> selected</cfif>>4</option>
                    <option value="5"<cfif questions.aRating eq 5> selected</cfif>>5</option>
                </select>
            </cfif>
        </div>

        <!--- Check if the question type is text --->
        <cfif questions.qtype eq "text">
            <div class="form-group col-md-12 pt-0 pb-0">
                <input class="form-control" type="text" id="q#questions.qid#" value="#questions.atext#" name="q#questions.qid#">
            </div>
        </cfif>

        <!--- Check if the question type is long text --->
        <cfif questions.qtype eq "long">
            <div class="form-group col-md-12 pt-0 pb-0">
                <textarea class="form-control" type="text" id="q#questions.qid#" name="q#questions.qid#" rows="4">#questions.amemo#</textarea>
            </div>
        </cfif>
    </cfloop>

    <div class="form-group text-center col-md-12">
        <button class="btn btn-primary editable-submit btn-sm waves-effect waves-light" value="Update" type="submit" style="background-color: ##406e8e; border: ##406e8e;">Submit</button>
    </div>
</form>

<script>
    $(document).ready(function() {
        $(".parsley-examples").parsley();
    });
</script>

<!--- Modifications: 
1. Removed unnecessary # symbols in conditional checks.
2. Removed unnecessary cfoutput tags around variable outputs.
3. Standardized variable names and casing.
4. Ensured consistent attribute quoting, spacing, and formatting.
5. Used double pound signs for hex color codes to avoid interpretation as variables.
--->