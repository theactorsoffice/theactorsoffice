 

 
 <cfhttp url="http://www.imdb.com/find?q=Harrison+ford" method="get" >
  </cfhttp>
  <cfset p = cfhttp.filecontent>
 <cfset mystring = "#left(cfhttp.filecontent,8500)#">



<cfoutput><cfset newfuck = "#replace(mystring,"*nm","nm","one")#">
#newfuck#
</cfoutput>
    https://www.imdb.com/search/name/?name=Amy+Russ
    
    <cfabort>
    
<CFINCLUDE template="/include/remote_load.cfm" />   


<CFQUERY name="x" datasource="#dsn#">

       
        SELECT concat(contactfirst,"%2B",contactlast) as search_word,contactfirst,contactlast, contactid 
       
       
       FROM contactdetails WHERE imdbid IS NULL AND contactfirst IS NOT NULL AND contactlast IS NOT null
       
       
       
</cfquery>
<cfloop query="x">
<cfset search_word_b = Replace(x.search_word, " ", "+", "ALL")>


<cfset this_url = "https://www.imdb.com/search/name/?name=#search_word_b#">

<cfoutput>#this_url#</cfoutput><BR>



<cfhttp 
          url="#this_url#"
         method="GET"
          redirect="no"
        resolveurl="true"
         timeout="30"
         userAgent="#cgi.HTTP_USER_AGENT#"
         charset="utf-8">
<cfhttpparam type="Header" name="Accept-Encoding" value="deflate;q=0">
<cfhttpparam type="Header" name="TE" value="deflate;q=0">
</cfhttp>
<cfif structkeyexists(cfhttp.responseheader,"status_code") and
         listfindnocase("301,302",cfhttp.responseheader.status_code) 
         and structkeyexists(cfhttp.responseheader,"location") 
        and len(trim(cfhttp.responseheader.location))>
  <cfset this_url_a = cfhttp.responseheader.location>
    <cfelse>
	  <cfset this_url_a = this_url>	
</cfif>

<cfhttp 
          url="#this_url_a#"
         method="GET"
          redirect="no"
        resolveurl="true"
         timeout="30"
         userAgent="#cgi.HTTP_USER_AGENT#"
         charset="utf-8">
<cfhttpparam type="Header" name="Accept-Encoding" value="deflate;q=0">
<cfhttpparam type="Header" name="TE" value="deflate;q=0">
</cfhttp>
<cfif structkeyexists(cfhttp.responseheader,"status_code") and
         listfindnocase("301,302",cfhttp.responseheader.status_code) 
         and structkeyexists(cfhttp.responseheader,"location") 
        and len(trim(cfhttp.responseheader.location))>
  <cfset this_url = cfhttp.responseheader.location>
   
<cfoutput>
<cfset MyString_A = Replace(this_url, "<a href=""/name/", "", "ALL")>
<cfset MyString_B = Replace(MyString_A, "/", "", "ALL")>
</cfoutput>
<cfif LEN(Mystring_B) is "9" and LEFT(Mystring_B,2) is "NM">
  <CFQUERY name="INSERT" datasource="#dsn#">
UPDATE contactdetails 
SET imdbid = '#TRIM(MyString_B)#' where contactid = #x.contactid#
</cfquery>
<cfoutput>'#TRIM(MyString_B)#' found!</cfoutput><BR>
</cfif>
<cfelse>
	 <CFQUERY name="INSERT" datasource="#dsn#">
UPDATE contactdetails 
SET imdbid = 'UNKNOWN' where contactid = #x.contactid#
</cfquery>
</cfif>

</cfloop>