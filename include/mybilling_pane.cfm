<h4 class="text-nowrap">My Billing</h4>
<div class="row" style="margin: auto;">
    <!--- Output billing information --->
    <cfoutput>
        <div class="col-md-12 col-lg-6 p-1">
            <strong>Invoice ID: </strong>invoiceid
        </div>
        <div class="col-md-12 col-lg-6 p-1">
            <strong>Purchase Date: </strong>#DateFormat(purchaseDate)#
        </div>
        <!--- Check if trial end date is available --->
        <cfif DateFormat(trialEndDate) neq "">
            <div class="col-md-12 col-lg-6 p-1">
                <strong>Trial End Date: </strong>#DateFormat(trialEndDate)#
            </div>
        </cfif>
        <div class="col-md-12 col-lg-6 p-1">
            <strong>Product: </strong>baseProductLabel
        </div>
        <div class="col-md-12 col-lg-6 p-1">
            <strong>Plan: </strong>planName
        </div>
    </cfoutput>
    <div class="col-md-12 col-lg-6 p-1">
        <strong>Have questions and want to cancel? </strong>
        <a href="mailto:support@theactorsoffice.com">Email</a> us
    </div>
</div>

<!---
Modifications:
1. Removed unnecessary `<cfoutput>` tags around variable outputs.
2. Avoided using `#` symbols within conditional checks.
3. Standardized variable names and casing.
4. Ensured consistent attribute quoting, spacing, and formatting.
5. Used uniform date and time formatting across the code.
--->