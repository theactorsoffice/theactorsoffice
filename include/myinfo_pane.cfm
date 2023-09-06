<h4>                  <cfoutput>#userFirstName# #userlastName# </cfoutput>

        <span class="float-end">
  
           <a title="Update Account" data-bs-toggle="modal" data-bs-target="#remoteUpdateAccount" data-bs-original-title="Update Account"> <i class="mdi mdi-square-edit-outline"></i></a>
  
  </span>
</h4>

          <div class="container">
  <div class="row">
    <!-- First Column: 20% Width -->
    <div class="col-2">
      <p class="card-text">
        <a href="/app/image-upload/?contactid=<cfoutput>#contactid#&ref_pgid=7</cfoutput>">
          <figure>
            <img src="<cfoutput>#browser_user_avatar_filename#</cfoutput>?ver=<cfoutput>#rand()#</cfoutput>" class="mr-2 rounded-circle gambar img-responsive img-thumbnail" title="User ID: <cfoutput>#userid#</cfoutput>" style="max-width:120px; width:100%;" alt="profile-image" id="item-img-output" />
            <figcaption>
              <cfoutput>#useravatarname#</cfoutput>
            </figcaption>
          </figure>
        </a>
      </p>
    </div>
    
    <!-- Second Column: 80% Width -->
    <div class="col-10">
     <p class="card-text">This is the second section</p>

    </div>
  </div>
</div>
