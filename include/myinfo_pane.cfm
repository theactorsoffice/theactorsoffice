<center><h4>                  <cfoutput>#userFirstName# #userlastName# </cfoutput>

        <span class="float-end">
  
           <a title="Update Account" data-bs-toggle="modal" data-bs-target="#remoteUpdateAccount" data-bs-original-title="Update Account"> <i class="mdi mdi-square-edit-outline"></i></a>
  
  </span>
</h4></center>

          <div class="container">
  <div class="row">
    <!-- First Column: 20% Width -->
    <div class="col-2">
      <p class="card-text">
        <a href="/app/image-upload/?contactid=<cfoutput>#contactid#&ref_pgid=7</cfoutput>">
          <figure>
            <img src="<cfoutput>#browser_user_avatar_filename#</cfoutput>?ver=<cfoutput>#rand()#</cfoutput>" class="mr-2 rounded-circle gambar img-responsive img-thumbnail" title="User ID: <cfoutput>#userid#</cfoutput>" style="max-width:120px; width:100%;" alt="profile-image" id="item-img-output" />
            <figcaption>
              <Center><cfoutput>#useravatarname#</cfoutput></center>
            </figcaption>
          </figure>
        </a>
      </p>
    </div>
    
    <!-- Second Column: 80% Width -->
    <div class="col-10">
     <p class="card-text">  <div class="container mt-5">
    <div class="row">
      <div class="col-md-6 offset-md-3">
        <h2>Contact Information</h2>
        <dl class="row">
          <dt class="col-sm-3">Name:</dt>
          <dd class="col-sm-9">#userfirstname# #userlastname#</dd>

          <dt class="col-sm-3">Avatar Name:</dt>
          <dd class="col-sm-9">#AvatarName#</dd>

          <dt class="col-sm-3">Email:</dt>
          <dd class="col-sm-9">#useremail#</dd>

          <dt class="col-sm-3">Address:</dt>
          <dd class="col-sm-9">
            #add1#<br>
            #add2#
          </dd>

          <dt class="col-sm-3">Town/City:</dt>
          <dd class="col-sm-9">#city#</dd>

          <dt class="col-sm-3">Postal Code:</dt>
          <dd class="col-sm-9">#zip#</dd>

          <dt class="col-sm-3">State/Region:</dt>
          <dd class="col-sm-9">#state#</dd>

          <dt class="col-sm-3">Country:</dt>
          <dd class="col-sm-9">#country#</dd>
        </dl>
      </div>
    </div>
  </div>


</p>

    </div>
  </div>
</div>
