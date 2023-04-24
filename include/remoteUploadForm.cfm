<CFINCLUDE template="/include/remote_load.cfm" />

<form action="ingestform.cfm" name="Image_Form" method="post">
		 <input type="hidden" name="pg_action" value="Add" />


        <script type="text/javascript">

function yesnoCheck() {
    if (document.getElementById('MyTattedLife').checked || document.getElementById('DatingCanBeMurder').checked) {
        document.getElementById('ifYes').style.visibility = 'visible';

    }
    else document.getElementById('ifYes').style.visibility = 'hidden';

}

</script>

        <script>
        function Clear()
{
   clearRadioGroup("Reach_Categories");
}

function clearRadioGroup(GroupName)
{
  var ele = document.getElementsByName(GroupName);
	for(var i=0;i<ele.length;i++)
    ele[i].checked = false;
    document.getElementById('ifYes').style.visibility = 'hidden';
}

        </script>

<div class="form-group">



				 <div  style="margin-right:5px;margin-left:15px;" >




                	<label class="form-check-label" for="My Tatted Life" style="margin-right:5px;margin-left:5px;">

				<input type="radio" name="Reach_Categories"  id="MyTattedLife"  value="My Tatted Life" class="styled"  onclick="javascript:yesnoCheck();" >
											My Tatted Life</label>




            <span style="visibility:hidden" id="ifYes">

               <input type="button" value="Clear Restriction" class="small" onclick="Clear();">



											</span>



									</div>



    </div>






        <p>
				<input type="submit"   onclick="popup('popUpDiv')"  id="submitit" name="submitit" value="Continue" style="visibility: hidden;" class="btn submitit btn-xs btn-primary legitRipple" /></p>
			</form>
		</div>
		<input type="file" name="files" >

</div>



<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), "\")#" /><cfinclude template="/include/bigbrotherinclude.cfm" /> 
