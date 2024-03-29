<style>
@media (max-width: 768px) {
  .packery-grid .grid-item {
    width: 100%;
  }
}

</style>

<script>
$(document).ready(function(){
    // Wait for a moment before triggering the animation
    setTimeout(function(){
        $(".card").addClass("loaded");
    }, 100); // The delay in milliseconds
});
</script>


<cfparam name="batchlist" default="0" />

<cfparam name="NEW_SITETYPEID" default="0" /> 



<cfparam name="pgaction" default="View" />
<cfparam name="nots_total" default="0" />
<cfparam name="batchlist" default="0" />

<cfif #pgaction# is "batch">
<cfif #batchlist# is not "0">
    
    
    
    
    
    
    
    
    
    <cfquery datasource="#dsn#" name="cnotsconfirm">
SELECT
                n.notID
          
                
                FROM funotifications n

    
                WHERE n.notid in (#batchlist#)
 
 
            </cfquery>

        
        
        
        
        

    <script type="text/javascript">
    $(window).on('load', function() {
        $('#batchconfirm').modal('show');
    });
</script>
    
    <div id="batchconfirm" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">

    <div class="modal-dialog">

        <div class="modal-content">

            <div class="modal-header">

                <h4 class="modal-title">

                    <cfoutput>Batch #batchtype# confirmation</cfoutput>

                </h4>
                
           

                <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"><i class="mdi mdi-close-thick"></i></button>

            </div>

            <div class="modal-body">
             
                <cfoutput>
                      <form action="/include/batch#batchtype#.cfm">
                          <input type="hidden" name="batchlist" value="#batchlist#" />
                    <center>You are about to #batchtype# #numberformat(cnotsconfirm.recordcount)# reminders.</center>
                          <p>&nbsp;</p>
                            <center><input type="submit" value="Confirm" class="btn btn-primary btn-sm" /></center> 
                    </form>
                </cfoutput>

            </div>

        </div>

    </div>

</div>

</cfif>
    <cfset pgaction = "view" />
    </cfif>

    <div class="packery-grid" data-packery='{ "itemSelector": ".grid-item", "gutter": 10 }'>
  <cfloop query="dashboards">
    <cfinclude template="/include/#dashboards.pnFilename#" />
  </cfloop>
</div>






<script>
console.log("Before Packery");

function initializePackery() {
  var isMobile = window.matchMedia("(max-width: 768px)").matches;
  var packeryOptions = isMobile ? {
    itemSelector: '.grid-item',
    gutter: 10,
    percentPosition: true
  } : {
    itemSelector: '.grid-item',
    gutter: 10,
    fitWidth: true,
    resizable: true,
    columnWidth: '.grid-item',
    percentPosition: true
  };

  var $grid = $('.packery-grid').packery(packeryOptions);

  if (!isMobile) {
    // Make all items draggable only if not mobile
    $grid.find('.grid-item').each(function(i, gridItem) {
      var draggie = new Draggabilly(gridItem);
      $grid.packery('bindDraggabillyEvents', draggie);
    });

    $grid.on('dragItemPositioned', function() {
      // Create an array to store the new order
      var newOrder = [];

      // Iterate over each item and push its data-id to the array
      $grid.packery('getItemElements').forEach(function(itemElem) {
        var id = $(itemElem).attr('data-id');
        newOrder.push(id);
      });

      // Send the new order to the server via AJAX
      $.ajax({
        url: '/include/update_order.cfm', // your ColdFusion script
        type: 'POST',
        data: { order: newOrder.join(',') }, // send as comma-separated list
        success: function(response) {
          console.log('Updated successfully:', response);
        },
        error: function() {
          console.log('Failed to update order');
        }
      });
    });
  }
}

// Initialize Packery on page load
initializePackery();

// Re-initialize Packery on window resize
$(window).resize(function() {
  initializePackery();
});

console.log("After Packery");

</script>

 
 









<script>
function openAllUrls(siteurl_list) {
  const urls = siteurl_list.split(',');
  console.log(`Attempting to open ${urls.length} URLs`);

  urls.forEach((url, index) => {
    const trimmedUrl = url.trim();
    console.log(`Opening URL ${index + 1}: ${trimmedUrl}`);
    
    try {
      const newWindow = window.open(trimmedUrl, '_blank');
      
      if (newWindow === null) {
        console.warn(`Failed to open ${trimmedUrl}`);
      } else {
        console.log(`Successfully opened ${trimmedUrl}`);
      }
    } catch (e) {
      console.error(`An error occurred while trying to open ${trimmedUrl}: ${e.message}`);
    }
  });
}
</script>

<script>
  $(document).ready(function(){
    // Wait for a moment before triggering the animation
    setTimeout(function(){
      $(".card").addClass("loaded");
    }, 100); // The delay in milliseconds
  });
</script>




 