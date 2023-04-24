
<cfquery datasource="#dsn#" name="details">
    SELECT tzid,defRows,defCountry,defState,calstarttime,calendtime,avatarname,userfirstname,userlastname,useremail,nletter_yn,nletter_link FROM taousers WHERE userid = #userid#
</cfquery>