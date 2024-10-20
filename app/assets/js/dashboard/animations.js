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


  $(document).ready(function(){
    // Wait for a moment before triggering the animation
    setTimeout(function(){
      $(".card").addClass("loaded");
    }, 100); // The delay in milliseconds
  });
