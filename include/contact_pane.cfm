<cfset dbug = "Y" />     

<div id="contact-card-view2" style="flex: 1 1 auto; display: flex; flex-flow: row wrap; margin: 30px auto 0px; padding: 0px 10px; ">

          <cfloop query="ActiveCategories">
              


          
              <!--- end if catid is 0 --->


              
              
              
              
              
              



              <cfif #catid# is not "0">

                  <cfinclude template="/include/qry/itemsbycatActive.cfm" />

                  <div class="flexit">

                      <div class="contact-info-section" style="margin-bottom: 35px;position: relative;padding-left: 50px;">

                          <cfoutput>

                              <cfif #itemsbycatActive.recordcount# is not "0">

                                  <i class="#ActiveCategories.caticon# font-26" style="position: absolute;left: 0;top: 0;"></i>

                              </cfif>
                              <!--- if itemsbycatactive.recordcount is not 0 --->

                              <cfif #itemsbycatActive.recordcount# is "0">

                                  <i class="#ActiveCategories.caticon# text-muted font-weight-lighter font-26" style="position: absolute;left: 0;top: 0;"></i>

                              </cfif>
                              <!--- if itemsbycatactive.recordcount is 0 --->

                          </cfoutput>

                          <cfif #itemsbycatActive.recordcount# is not "0">


                              <cfloop query="itemsbycatActive">

                                  <cfif #ActiveCategories.catfieldset# is "address">

                                      <cfoutput>

                                          <h5 style="#h5style#">

                                              #itemsbycatActive.valuestreetaddress#

                                              <a href="javascript:;" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##remoteUpdateC#itemsbycatActive.itemid#" toggle="tooltip" data-bs-placement="top" title="Update" #ActiveCategories.valueCategory# data-bs-original-title="Update #ActiveCategories.valueCategory#">

                                                  <i class="mdi mdi-square-edit-outline"></i>

                                              </a>

                                              <cfif #itemsbycatActive.valueExtendedaddress# is not "">

                                                  <BR />#itemsbycatActive.valueExtendedaddress#

                                                  <a href="javascript:;" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##remoteUpdateC#itemsbycatActive.itemid#" toggle="tooltip" data-bs-placement="top" title="Update #ActiveCategories.valueCategory#" data-bs-original-title="Update #ActiveCategories.valueCategory#">

                                                      <i class="mdi mdi-square-edit-outline"></i>

                                                  </a>

                                              </cfif>
                                              <!--- end if itemsbycatActive.valueExtendedaddress is not blank --->

                                              <cfif #itemsbycatActive.valuecity# is not "">

                                                  <br />#itemsbycatActive.valuecity#

                                                  <cfif #itemsbycatActive.valueExtendedaddress# is "">

                                                      <a href="javascript:;" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##remoteUpdateC#itemsbycatActive.itemid#" data-bs-placement="top" title="Update #ActiveCategories.valueCategory#" data-bs-original-title="Update #ActiveCategories.valueCategory#">

                                                          <i class="mdi mdi-square-edit-outline"></i>

                                                      </a>

                                                  </cfif>
                                                  <!--- end if itemsbycatActive.valueExtendedaddress is blank --->

                                              </cfif>
                                              <!--- end if itemsbycatActive.valuecity is not blank --->

                                              <cfif #itemsbycatActive.valuecity# is not "" and #itemsbycatActive.valueRegion# is not "">

                                                  ,#itemsbycatActive.valueRegion#

                                                  <cfif #itemsbycatActive.valueExtendedaddress# is "">

                                                      <a href="javascript:;" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##remoteUpdateC#itemsbycatActive.itemid#" data-bs-placement="top" title="Update #ActiveCategories.valueCategory#" data-bs-original-title="Update #ActiveCategories.valueCategory#">

                                                          <i class="mdi mdi-square-edit-outline"></i>

                                                      </a>

                                                  </cfif>
                                                  <!--- end if itemsbycatActive.valueExtendedaddress is blank --->

                                              </cfif>
                                              <!--- end if itemsbycatActive.valuecity is not blank and itemsbycatActive.valueRegion is not blank --->

                                              <cfif #itemsbycatActive.valuepostalcode# is not "">

                                                  &nbsp; #itemsbycatActive.valuepostalcode#

                                              </cfif>
                                              <!--- end if itemsbycatActive.valuepostalcode is NOT blank --->

                                          </h5>

                                          <div style="font-13 text-uppercase mb-1;text-align:left;">

                                              #itemsbycatActive.valuetype#

                                          </div>

                                      </cfoutput>

                                  </cfif>
                                  <!--- end if ActiveCategories.catfieldset is address --->

                                  <cfif #ActiveCategories.catfieldset# is "company">

                                      <cfoutput>

                                          <h5 style="#h5style#">

                                              #itemsbycatActive.valueCompany#

                                              <a href="javascript:;" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##remoteUpdateC#itemsbycatActive.itemid#" data-bs-placement="top" title="Update #ActiveCategories.valueCategory#" data-bs-original-title="Update #ActiveCategories.valueCategory#">

                                                  <i class="mdi mdi-square-edit-outline"></i>

                                              </a>

                                              <cfif #itemsbycatActive.valueTitle# is not "">

                                                  <br />#itemsbycatActive.valueTitle#

                                              </cfif>
                                              <!--- end if itemsbycatActive.valueTitle is not blank --->

                                              <cfif #itemsbycatActive.valueDepartment# is not "">

                                                  <br />#itemsbycatActive.valueDepartment#

                                              </cfif>
                                              <!--- end if itemsbycatActive.valueDepartment is not blank --->

                                          </h5>

                                          <div style="font-13  text-uppercase mb-1;text-align:left;">

                                              #itemsbycatActive.valuetype#

                                          </div>

                                      </cfoutput>

                                  </cfif>
                                  <!--- end if ActiveCategories.catfieldset is company --->

                                  <cfif #ActiveCategories.catfieldset# is "date">

                                      <cfoutput>

                                          <h5 style="#h5style#">#dateformat('#itemsbycatActive.itemdate#','mm-dd-YYYY')#

                                              <a href="javascript:;" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##remoteUpdateC#itemsbycatActive.itemid#" data-bs-placement="top" title="Update #ActiveCategories.valueCategory#" data-bs-original-title="Update #ActiveCategories.valueCategory#">

                                                  <i class="mdi mdi-square-edit-outline"></i>

                                              </a>

                                          </h5>

                                          <div style="font-13  text-uppercase mb-1;text-align:left;">

                                              #itemsbycatActive.valuetype#

                                          </div>

                                      </cfoutput>

                                  </cfif>
                                  <!--- end if ActiveCategories.catfieldset is date --->

                                  <cfif #ActiveCategories.catfieldset# is "long">

                                      <cfoutput>

                                          <h5 style="#h5style#">

                                              #itemsbycatActive.itemnotes#

                                          </h5>

                                          <div style="font-13   text-uppercase mb-1;text-align:left;">

                                              #itemsbycatActive.valuetype#

                                          </div>

                                      </cfoutput>

                                  </cfif>
                                  <!--- end if ActiveCategories.catfieldset is long --->

                                  <cfif #ActiveCategories.catfieldset# is "text">

                                      <cfif #ActiveCategories.valueCategory# is "Phone">

                                          <cfset phonenumber=itemsbycatActive.valuetext />

                                          <cfinclude template="formatPhoneNumber.cfm" />

                                          <cfoutput>

                                              <h5 style="#h5style#">#formatPhoneNumber#

                                                  <a href="javascript:;" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##remoteUpdateC#itemsbycatActive.itemid#" data-bs-placement="top" title="Update Phone" data-bs-original-title="Update #ActiveCategories.valueCategory#">

                                                      <i class="mdi mdi-square-edit-outline"></i>

                                                  </a>

                                              </h5>

                                              <div style="font-13 text-uppercase mb-1;text-align:left;">

                                                  #itemsbycatActive.valuetype#

                                              </div>

                                          </cfoutput>

                                      </cfif>
                                      <!--- end if ActiveCategories.valueCategory is Phone --->

                                      <cfif #ActiveCategories.valueCategory# is "Email">

                                          <cfoutput>

                                              <h5 style="#h5style#">

                                                  <a HREF="mailto:#itemsbycatActive.valuetext#" target="_blank">#itemsbycatActive.valuetext#</a>

                                                  <a href="javascript:;" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##remoteUpdateC#itemsbycatActive.itemid#" toggle="tooltip" data-bs-placement="top" title="Update #ActiveCategories.valueCategory#" data-bs-original-title="Update #ActiveCategories.valueCategory#">

                                                      <i class="mdi mdi-square-edit-outline"></i>

                                                  </a>

                                              </h5>

                                              <div style="font-13 text-uppercase mb-1;text-align:left;">

                                                  #itemsbycatActive.valuetype#

                                              </div>

                                          </cfoutput>

                                      </cfif>
                                      <!--- end if ActiveCategories.valueCategory is Email --->

                                      <cfif #ActiveCategories.valueCategory# is not "Email" and #ActiveCategories.valueCategory# is not "Phone" and #ActiveCategories.valueCategory# is not "Tag">

                                          <cfoutput>

                                              <h5 style="#h5style#">

                                                  <cfif #left(itemsbycatActive.valuetext,4)# is "http">

                                                      <a href="#itemsbycatActive.valuetext#" target="_blank">

                                                          #itemsbycatActive.valuetext#

                                                      </a>

                                                  </cfif><!-- end if left(itemsbycatActive.valuetext,4) is http --->

                                                  <cfif #left(itemsbycatActive.valuetext,4)# is not "http">

                                                      #itemsbycatActive.valuetext#

                                                  </cfif>
                                                  <!--- end if left(itemsbycatActive.valuetext,4) is NOT http --->

                                                  <a href="javascript:;" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##remoteUpdateC#itemsbycatActive.itemid#" toggle="tooltip" data-bs-placement="top" title="Update #ActiveCategories.valueCategory#" data-bs-original-title="Update #ActiveCategories.valueCategory#">

                                                      <i class="mdi mdi-square-edit-outline"></i>

                                                  </a>

                                              </h5>

                                              <div style="font-13 text-uppercase mb-1;text-align:left;">

                                                  #itemsbycatActive.valuetype#

                                              </div>

                                          </cfoutput>

                                      </cfif>
                                      <!--- end if ActiveCategories.valueCategory is not Email and ActiveCategories.valueCategory is not Phone and ActiveCategories.valueCategory is not Tag --->

                                  </cfif>
                                  <!--- end if ActiveCategories.catfieldset is text --->

                              </cfloop>

                          </cfif>
                          <!--- end itemsbycatActive.recordcount is not 0 --->

                          <cfif #itemsbycatActive.recordcount# is "0">

                              <h5 class="text-muted font-weight-lighter">Add <cfoutput> #ActiveCategories.valueCategory#</cfoutput>

                              </h5>

                          </cfif>
                          <!--- end itemsbycatActive.recordcount is  0 --->

                          <cfoutput>

                              <a href="javascript:;" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##remoteAddC#ActiveCategories.catid#" data-bs-placement="top" title="Add #ActiveCategories.valueCategory#" data-bs-original-title="Add #ActiveCategories.valueCategory#">

                                  <i class="fe-plus-circle"></i>
                              </a>
                             

                          </cfoutput>

                      </div>

                  </div>

              </cfif>
              <!--- end if catid is not 0 --->

          </cfloop>

      </div>
    <cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), " \")#" />
    <cfinclude template="/include/bigbrotherinclude.cfm" />