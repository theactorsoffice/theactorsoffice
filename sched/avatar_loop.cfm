 

   <CFINCLUDE template="/include/remote_load.cfm" />



<cfquery name="x" datasource="#dsn#" maxrows="10">
SELECT distinct
d.contactid,
d.contactfullname,
d.userid,
i.valuetext as contactemail
FROM
contactdetails d INNER JOIN contactitems i ON i.contactid = d.contactid
INNER JOIN taousers u ON u.userid = d.userid
WHERE i.valuecategory = 'Email' AND i.valuetext <> '' AND i.valuetext NOT LIKE '%test%'
AND d.avatar_yn IS NULL
AND u.userid <> 30
ORDER BY d.contactid
</cfquery>

<cfloop query="x">

<cfquery name="find" datasource="#dsn#" >
select contactid from contactdetails where contactid = #x.contactid# and avatar_yn is null
</cfquery>

<cfif #find.recordcount# is "1">
 
        <cfset contact_avatar_filename = "C:\home\theactorsoffice.com\media-#host#\users\#x.userid#\contacts\#x.contactid#\avatar.jpg" />

        <cfif  isimagefile(contact_avatar_filename)>

<cfquery name="update" datasource="#dsn#" >
update contactdetails set avatar_yn = 'Y' where contactid = #x.contactid# 
</cfquery>


        <cfelse>


   
<cfset emailHash = LCase(Hash(Trim(x.contactemail), "MD5"))>




<cfset gravatarURL = "https://www.gravatar.com/avatar/#emailHash#?s=200">



<!--- Make HTTP Request to Gravatar --->
<cfhttp url="#gravatarURL#" method="get" result="httpResponse">
</cfhttp>

<!--- Check if Gravatar exists (HTTP status code 200) --->
<cfif httpResponse.StatusCode eq "200 OK">
    <!--- Download and save the image --->
    <cfhttp url="#gravatarURL#" method="get" path="C:\home\theactorsoffice.com\media-#host#\users\#x.userid#\contacts\#x.contactid#" file="avatar.jpg">
    </cfhttp>
    <cfoutput>
       #x.contactfullname#: Gravatar exists and has been saved.<BR>
    </cfoutput>

        <cfquery name="update" datasource="#dsn#" >
update contactdetails set avatar_yn = 'Y' where contactid = #x.contactid# 
</cfquery>


<cfelse>
    <!--- Gravatar doesn't exist. Ignore --->
    <cfoutput>
    <span style="color:red;">    #x.contactfullname#: No Gravatar found. Ignoring.</span><BR>
    </cfoutput>






</cfif>







        </cfif>













</cfif>

</cfloop>