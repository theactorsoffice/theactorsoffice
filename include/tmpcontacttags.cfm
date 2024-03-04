<cfset dbug="N" />

<CFINCLUDE template="/include/remote_load.cfm" />

<cfparam name="contact_expand" default="true" />

<cfparam name="idlist" default="0" />

 <cfif #idlist# is "0" and #session.idlist# is not "0">
 <cfset idlist = session.idlist />

 </cfif>

 

<CFIF #dbug# is "N" >

<cfif #idlist# is "0">

    <cflocation url="/app/contacts/?bulk_no=0" />

</cfif>
    
</CFIF>

<cfparam name="contactcheckvisible" default="false" />

<cfparam name="maintenance_expand" default="false" />

<cfparam name="bytag" default="" />

<cfparam name="target_expand" default="false" />

<cfparam name="followup_expand" default="false" />

<cfparam name="all_expand" default="false" />

<cfparam name="pgaction" default="view" />

<cfparam name="systemID" default="0" />

<cfinclude template="/include/qry/lastupdates.cfm" />

<cfset session.idlist=idlist />

<cfset no_deleted=0 />

<cfset no_skipped=0 />

<cfset no_added=0 />

<cfset new_addremove = addremove />


<cfquery name="BatchDetails"  >
SELECT contactid,recordname FROM contactdetails  d 
    


WHERE d.contactid IN (#idlist#)
</cfquery>

 



<cfloop query="BatchDetails">

    <cfif #dbug# is "Y">
        <cfoutput>
            <h2>Contact: #batchdetails.recordname# (#batchdetails.contactid#) </h2>
        </cfoutput>
    </cfif>

    <cfset new_contactid=BatchDetails.contactid />

    <cfset new_tagname=new_tagname />

    <Cfset new_currentStartDate=dateFormat(Now(),'yyyy-mm-dd') />

             <cfquery datasource="#dsn#" name="findsame" maxrows="1">
                select * from CONTACTITEMS
                where contactid = #new_contactid#
                and VALUETYPE = 'Tags'
                and VALUETEXT = '#new_tagname#'
                and itemstatus = 'Active'
            </cfquery>
    
    

    <cfif #addremove# is "add">

        <cfif #findsame.recordcount# is "0">

            <cfquery datasource="#dsn#" name="insert">
                INSERT INTO CONTACTITEMS (CONTACTID,VALUETYPE,VALUECATEGORY,VALUETEXT,ITEMSTATUS)
                VALUES (#new_contactid#,'Tags','Tag','#new_tagname#','Active')
            </cfquery>

            <cfoutput>

            <cfset no_added=#no_added# + 1 />

            </cfoutput>
            
        </cfif>
            
        <cfif #findsame.recordcount# is "1">
            
            <cfoutput>

            <cfset no_skipped=#no_skipped# + 1 />

            </cfoutput>
            
        </cfif>

    </cfif>
    
    <cfif #addremove# is "remove">
    
        <cfif #findsame.recordcount# is "0">
                    
            <cfoutput>

            <cfset no_skipped=#no_skipped# + 1 />

            </cfoutput>
                    
        </cfif>
            
        <cfif #findsame.recordcount# is "1">
            
            <cfquery datasource="#dsn#" name="insert">
                update CONTACTITEMS_tbl  set isdeleted = 1
                ,itemnotes = 'Delete via Bulk Update - #new_currentStartDate#'
                where itemid = #findsame.itemid# 
            </cfquery>

            <cfoutput>

            <cfset no_deleted=#no_deleted# + 1 />

            </cfoutput>
            
        </cfif>
        
    </cfif>

</cfloop>

<cfoutput>
    
    <P>ID LIST: #session.idlist#<BR>Tag: #new_tagname#<BR>action: #addremove#</P>
    <p>no_skipped: #no_skipped#<BR>no_deleted: #no_deleted#<BR>no_added: #no_added#</p>

</cfoutput>

<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), " \")#" />
<cfinclude template="/include/bigbrotherinclude.cfm" />

<cfset session.pgaction="bulk" />

<cfif #dbug# is "N">

   <cflocation url="/app/contacts/?bt=tag&d=#no_deleted#&s=#no_skipped#&a=#no_added#&t=#new_tagname#" />


</cfif>
