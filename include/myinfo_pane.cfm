<h4>                  <cfoutput>#userFirstName# #userlastName# </cfoutput>

        <span class="float-end">
  
           <a title="Update Account" data-bs-toggle="modal" data-bs-target="#remoteUpdateAccount" data-bs-original-title="Update Account"> <i class="mdi mdi-square-edit-outline"></i></a>
  
  </span>
</h4>

              <p class="card-text">





                    <A href="/app/image-upload/?contactid=<cfoutput>#contactid#&ref_pgid=7</cfoutput>">

                        <figure>

                            <img src="<Cfoutput>#browser_user_avatar_filename#</cfoutput>?ver=<Cfoutput>#rand()#</cfoutput>" class="mr-2 rounded-circle gambar img-responsive img-thumbnail" title="User ID: <cfoutput>#userid#</cfoutput>" style="max-width:120px; width:100%;" alt="profile-image" id="item-img-output" />
                                <figcaption>
                                    <cfoutput>#useravatarname#</cfoutput>
                                </figcaption>
                    


                        </figure>

                    </A>



                </p>