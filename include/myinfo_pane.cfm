<h4> 
    #userFirstName# #userLastName# 
    <span class="float-end"> 
        <a title="Update Account" data-bs-toggle="modal" data-bs-target="#remoteUpdateAccount" data-bs-original-title="Update Account"> 
            <i class="mdi mdi-square-edit-outline"></i> 
        </a> 
    </span> 
</h4> 

<div class="row"> 
    <!--- First Column: 20% Width ---> 
    <div class="col-md-2"> 
        <p class="card-text"> 
            <a href="/app/image-upload/?contactid=#contactId#&ref_pgid=7"> 
                <center> 
                    <figure> 
                        <img src="#session.userAvatarUrl#" class="mr-2 rounded-circle gambar img-responsive img-thumbnail" title="User ID: #userId#" style="max-width:120px; width:100%;" alt="profile-image" id="item-img-output" /> 
                        <figcaption> 
                            <center>#avatarName#</center> 
                        </figcaption> 
                    </figure> 
                </center> 
            </a> 
        </p> 

        <form action="/recover/index.cfm"> 
            <p class="card-text"> 
                <center>  
                    <input type="hidden" name="recoverId" value="#userId#" />  
                    <button type="submit" class="btn btn-xs btn-primary waves-effect mb-2 waves-light" style="background-color: ##406e8e; border: ##406e8e">Change Password</button>  
                </center> 
            </p> 
        </form> 

    </div> 

    <!--- Second Column: 80% Width ---> 

    <div class="col-10">  
        <dl class="row"> 
            <dt class="col-sm-3">Email:</dt> 
            <dd class="col-sm-9">#userEmail#</dd> 
            <dt class="col-sm-3">Address:</dt> 
            <dd class="col-sm-9"> #address1#<br> #address2# </dd> 
            <dt class="col-sm-3">Town/City:</dt> 
            <dd class="col-sm-9">#city#</dd> 
            <dt class="col-sm-3">Postal Code:</dt> 
            <dd class="col-sm-9">#zipCode#</dd> 
            <dt class="col-sm-3">State/Region:</dt> 
            <dd class="col-sm-9">#region#</dd> 
            <dt class="col-sm-3">Country:</dt> 
            <dd class="col-sm-9">#countryName#</dd> 
        </dl>
    </div>
</div>

<!--- Modifications: Removed unnecessary cfoutput tags (2), standardized variable names and casing (5), ensured consistent attribute quoting, spacing, and formatting (6), used double pound signs for hex color codes (10) --->