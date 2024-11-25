<!--- This ColdFusion page handles the creation of an appointment with various input fields and validation. --->

<cfparam name="rcontactid" default="0"/>



<cfinclude template="/include/qry/relationships_13_1.cfm"/>
<cfinclude template="/include/qry/durations.cfm"/>
<cfinclude template="/include/qry/eventtypes_user_443_2.cfm"/>


    <div class="container mt-5">
        <div class="col-xl-6 col-lg-8 col-md-12 mx-auto">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title mb-4">Test Form</h5>
                    <form method="post" action="/test-submit.cfm">
                        <!-- Input Fields -->
                        <div class="mb-3">
                            <label for="input1" class="form-label">Label 1</label>
                            <input type="text" class="form-control" id="input1" name="input1" placeholder="Enter value for Label 1">
                        </div>
                        <div class="mb-3">
                            <label for="input2" class="form-label">Label 2</label>
                            <input type="text" class="form-control" id="input2" name="input2" placeholder="Enter value for Label 2">
                        </div>
                        <div class="mb-3">
                            <label for="input3" class="form-label">Label 3</label>
                            <input type="text" class="form-control" id="input3" name="input3" placeholder="Enter value for Label 3">
                        </div>
                        <div class="mb-3">
                            <label for="input4" class="form-label">Label 4</label>
                            <input type="text" class="form-control" id="input4" name="input4" placeholder="Enter value for Label 4">
                        </div>
                        <div class="mb-3">
                            <label for="input5" class="form-label">Label 5</label>
                            <input type="text" class="form-control" id="input5" name="input5" placeholder="Enter value for Label 5">
                        </div>
                        <div class="mb-3">
                            <label for="input6" class="form-label">Label 6</label>
                            <input type="text" class="form-control" id="input6" name="input6" placeholder="Enter value for Label 6">
                        </div>
                        <div class="mb-3">
                            <label for="input7" class="form-label">Label 7</label>
                            <input type="text" class="form-control" id="input7" name="input7" placeholder="Enter value for Label 7">
                        </div>
                        <div class="mb-3">
                            <label for="input8" class="form-label">Label 8</label>
                            <input type="text" class="form-control" id="input8" name="input8" placeholder="Enter value for Label 8">
                        </div>
                        <div class="mb-3">
                            <label for="input9" class="form-label">Label 9</label>
                            <input type="text" class="form-control" id="input9" name="input9" placeholder="Enter value for Label 9">
                        </div>
                        <div class="mb-3">
                            <label for="input10" class="form-label">Label 10</label>
                            <input type="text" class="form-control" id="input10" name="input10" placeholder="Enter value for Label 10">
                        </div>
                        <!-- Submit Button -->
                        <div class="text-end">
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>





<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), '\')#"/>
<cfinclude template="/include/bigbrotherinclude.cfm"/>
