<CFINCLUDE template="/include/remote_load.cfm" />

<cfparam name="IsDeleted" default="0" />

   <cfquery datasource="#dsn#" name="subsites">
        SELECT submitsiteid,submitsitename, catlist
        FROM audsubmitsites_user 
        WHERE userid = #userid# and submitsitename <> ''
        order by submitsitename
    </cfquery>

<cfif #catlist# is not "">
    <cfset sortedCatList = listSort(catlist, "numeric", "asc")>
</cfif>

    <cfquery name="update" datasource="#dsn#" >   
        UPDATE `audsubmitsites_user` 
        set submitsitename = '#new_submitsitename#'
        ,isDeleted = #isdeleted#
        
<cfif #catlist# is not "">
        ,catlist = '#sortedCatList#'
        <cfelse>

        ,catlist =NULL
        </cfif>
        where submitsiteid = #submitsiteid#
    </cfquery>
    

    <cflocation url="/app/myaccount/?t4=1&tab4_expand=true" /> 
    
 