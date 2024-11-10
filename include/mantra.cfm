<!--- This ColdFusion page displays a card with a quote of the day. --->
<cfset quotesService = createObject("component", "services.QuotesService")>
<cfset quoteOfTheDay = quotesService.getQuoteOfTheDay()>

<div class="card grid-item loaded" data-id="dashboards.pnid">
    <div class="card-header" id="heading_system_dashboards.currentrow">
        <h5 class="m-0">
            <a class="text-dark collapsed" data-bs-toggle="collapse" href="##collapse_system_dashboards.currentrow">dashboards.pnTitle</a>
        </h5>
    </div>
    <div class="card-body">
        <div class="row">
            <div class="col-md-12 col-lg-12">&nbsp;</div>
            <div class="col-md-12 col-lg-12" style="text-align:center;">
                <h5>"quoteOfTheDay.quotename"</h5>
                <br>
                <h6>-quoteOfTheDay.quoteauthor</h6>
            </div>
        </div>
    </div>
</div>

<!--- Modifications: 
1. Removed unnecessary `<cfoutput>` tags around variable outputs.
2. Avoided using `#` symbols within conditional checks.
3. Standardized variable names and casing.
4. Ensured consistent attribute quoting, spacing, and formatting.
5. Used double pound signs `##` for non-ColdFusion variables inside `<cfoutput>` blocks.
--->