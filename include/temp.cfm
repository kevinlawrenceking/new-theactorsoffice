<form class="app-search" action="/app/myaccount/?new_pgid=122" method="POST">
    <input type="hidden" name="ctaction" value="addmember" />
  
    <div class="row" style="margin: auto;">
    <div class="col-md-2 p-2">Add a new person to your team: </div>
  <div class="col-md-4 p-2"><a href="remoteAddContact.cfm?src=account" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="#remoteAddContact">
                    <button id="mybtns" type="submit" class="btn btn-xs btn-primary waves-effect mb-2 waves-light" style="background-color: #406e8e; border: #406e8e; height: 37px;">
                        Add 
                    </button></a>
                </div>

    </div>
    </div>
    <div class="row" style="margin: auto;">
        <div class="col-md-2 p-2">Or select an existing relationship:</div>
        <div class="col-md-4 p-2">
            <div class="input-group">
                <input type="text" class="form-control" required placeholder="Start typing to find name" name="topsearch_myteam" required id="autocomplete2" placeholder="Search..." autocomplete="off" />
                <div class="input-group-append">
                    <button id="mybtns" type="submit" class="btn btn-xs btn-primary waves-effect mb-2 waves-light" style="background-color: #406e8e; border: #406e8e; height: 37px;">
                        <i class="fe-plus"></i> Select 
                    </button>
                </div>
            </div>
        </div>
        </div>
</form>
