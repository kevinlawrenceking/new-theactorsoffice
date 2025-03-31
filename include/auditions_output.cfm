


<!DOCTYPE html>

<html lang="en">
  <head>
    
      <meta charset="utf-8"/>
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <title>Admin | Auditions</title>
        <meta content="TAO Administration" name="description"/>
        <meta content="Kevin King" name="author"/>
        <meta name="robots" content="noindex">
        
              <link href="/app/assets/images/favicon.ico?ver=13.3.1.20.945652920637" rel="shortcut icon"  type="text/css" />
            
              <script src="/app/assets/js/jquery-3.6.0.min.js?ver=13.4.0.0451882940027"></script>
            
              <link href="/app/assets/css/icons.min.css?ver=13.3.1.20.535485092956" rel="stylesheet"  type="text/css" />
            
              <link href="/assets/css/utilityclasses.css?ver=13.3.1.20.34298511146" rel="stylesheet"  type="text/css" />
            
              <link href="/app/assets/css/app.min.css?ver=13.3.1.20.601196304729" rel="stylesheet"  type="text/css" id="app-style"/>
            
              <link href="/app/assets/css/datatables.min.css?ver=13.3.1.20.659851987129" rel="stylesheet"  type="text/css" />
            
              <link href="/app/assets/css/dataTables.checkboxes.css?ver=13.3.1.20.221382824962"  type="text/css" />
            
              <script src="/app/assets/js/jquery.chained.js?ver=13.4.0.466257728351"></script>
            

        <style>
          body.authentication-bg {
            background-color: #406E8E;
            background-size: cover;
            background-position: center;
          }
          .navbar-custom {
            background-color: #406E8E;
          }
        </style>
      </head>

      <body style="overflow-y: scroll!important;">
        <div id="wrapper">
          

<div class="navbar-custom">
    <div class="container-fluid">
        <ul class="list-unstyled topnav-menu float-end mb-0">
<li class="d-none d-lg-block">
    
    <form class="app-search" id="submitform" action="/include/process.cfm" method="POST">
        <div class="app-search-box dropdown">
            <div class="input-group">
                
                <input 
                    type="text" 
                    required="required" 
                    class="form-control" 
                    name="topsearch" 
                    id="autocomplete" 
                    placeholder="Search..." 
                    autocomplete="off" 
                />
                
                <input type="hidden" name="selectedId" id="selectedId" />
                <input type="hidden" name="category" id="category" />
                <div class="input-group-append">
                    <button class="btn" id="mybtn" type="submit">
                        <i class="fe-search"></i>
                    </button>
                </div>
            </div>
            
            <ul id="contact-suggestions" class="dropdown-menu"></ul>
        </div>
    </form>
</li>


            <li class="dropdown d-inline-block d-lg-none">
                
                <a class="nav-link dropdown-toggle arrow-none waves-effect waves-light" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                    <i class="fe-search noti-icon"></i>
                </a>
                <div class="dropdown-menu dropdown-lg dropdown-menu-end p-0">
                    <form class="p-3" id="submitform_mobile" action="/include/process.cfm" method="POST">
                        <input type="search" class="form-control" name="topsearch" id="autocomplete_mobile" placeholder="Search..." />
                    </form>
                </div>
            </li>

            <li class="dropdown d-none d-lg-inline-block topbar-dropdown">
                
                <a class="nav-link dropdown-toggle arrow-none waves-effect waves-light" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                    <i class="fe-help-circle noti-icon"></i>
                </a>
                <div class="dropdown-menu dropdown-lg dropdown-menu-end">
                    <div class="p-lg-1">
                        <div class="row no-gutters">
                            <div class="col">
                                
                                    <a class="dropdown-icon-item" href="https://theactorsoffice.helpwise.help/" target="FAQ">
                                        <img src="/media-abo/images/faq.png?ver=3" alt="FAQ" />
                                        <span>FAQ</span>
                                    </a>
                                
                            </div>
                            <div class="col">
                                
                                    <a class="dropdown-icon-item" href="https://www.facebook.com/groups/taousercommunity" target="usercommunity">
                                        <img src="/media-abo/images/usercom.png?ver=3" alt="User Community" />
                                        <span>User Community</span>
                                    </a>
                                
                            </div>
                            
                                <div class="col">
                                    
                                        <a href="remoteSupportForm.cfm" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="#remoteSupportForm" class="dropdown-icon-item">
                                            <img src="/media-abo/images/feedback.png?ver=3" alt="Feedback" />
                                            <span>Create a Ticket</span>
                                        </a>
                                    
                                </div>
                            
                            <div class="col">
                                
                                    <a class="dropdown-icon-item" href="mailto:support@theactorsoffice.com?subject=I%20Need%20Some%20Support%20with%20TAO">
                                        <img src="/media-abo/images/contact.png?ver=3" alt="Contact Support" />
                                        <span>Contact Support</span>
                                    </a>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </li>

            <li class="dropdown notification-list topbar-dropdown">
                
                <a class="nav-link dropdown-toggle nav-user me-0 waves-effect waves-light" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                    <i class="fe-user noti-icon"></i>
                </a>
                <div class="dropdown-menu dropdown-menu-end profile-dropdown">
                    <div class="dropdown-header noti-title">
                        <h6 class="text-overflow m-0">Welcome!</h6>
                    </div>
                    <a href="/app/myaccount/" class="dropdown-item notify-item">
                        <i class="fe-user"></i>
                        <span>My Account</span>
                    </a>
                    <a href="/app/logout.cfm" class="dropdown-item notify-item">
                        <i class="fe-log-out"></i>
                        <span>Logout</span>
                    </a>
                </div>
            </li>
        </ul>

        
                <div class="logo-box">
            <a href="/app/" class="logo logo-dark text-center">
                <span class="logo-sm">
               <img src="/media-abo/images/logo-sm.png" alt="" height="30" />
              
                </span>
                <span class="logo-lg">
                 <img src="/media-abo/images/logo-sm.png" alt="" height="30" />
          
                </span>
            </a>
    
            <a href="/app/" class="logo logo-light text-center">
                <span class="logo-sm">
                     <img src="/media-abo/images/logo-sm.png" alt="" height="30" />
                </span>
                <span class="logo-lg">
                   <img src="/media-abo/images/logo-light.png" alt="" height="30" />
                </span>
            </a>
        </div>
        

        <ul class="list-unstyled topnav-menu topnav-menu-left m-0">
            <li>
                
                <button class="button-menu-mobile waves-effect waves-light">
                    <i class="fe-menu"></i>
                </button>
            </li>
            <li>
                
                <a class="navbar-toggle nav-link" data-bs-toggle="collapse" data-bs-target="#topnav-menu-content">
                    <div class="lines">
                        <span></span>
                        <span></span>
                        <span></span>
                    </div>
                </a>
            </li>
        </ul>

        <div class="clearfix"></div>
    </div>
</div>


<div class="left-side-menu">

    <div class="h-100" data-simplebar>


        <div id="sidebar-menu">

                <ul id="side-menu">
                <li>
                    <div class="user-lg text-center">
                       <center> <a href="/app/image-upload/?ref_pgid=7" style="text-align:center;">
                            
                                <img src="/media-abo/users/30/avatar.jpg?ver=0.83622688744" alt="user-image" id="mobile" class="rounded-circle avatar-md text-center" />
                                <br />
                                <span class="pro-user-name ml-1 text-center">KEVIN</span>
                            
                        </a></center>
                    </div>
                </li>
                
                
                    <li>
                        <a href="/app/dashboard/">
                            <i data-feather="airplay"></i>
                            <span>Dashboard </span>
                        </a>
                    </li>

                
                    <li>
                        <a href="/app/contacts/">
                            <i data-feather="users"></i>
                            <span>Relationships </span>
                        </a>
                    </li>

                
                    <li>
                        <a href="/app/calendar-appoint/">
                            <i data-feather="calendar"></i>
                            <span>Calendar </span>
                        </a>
                    </li>

                
                    <li>
                        <a href="/app/auditions/">
                            <i data-feather="film"></i>
                            <span>Auditions </span>
                        </a>
                    </li>

                
                    <li>
                        <a href="/app/reports/">
                            <i data-feather="code"></i>
                            <span>Reports </span>
                        </a>
                    </li>

                
                    <li>
                        <a href="/app/myaccount/">
                            <i data-feather="stop-circle"></i>
                            <span>My Account </span>
                        </a>
                    </li>

                

<li>
                                <a href="#sidebara" data-bs-toggle="collapse">
                                <i data-feather="sliders"></i>
                                    <span> Relationships - Admin </span>
                                    <span class="menu-arrow"></span>
                                </a>
                                <div class="collapse" id="sidebara">
                                    <ul class="nav-second-level">
                                        
                                              
                                             <li>
                            <a href="/app/admin-support/">
             
                                <span> Admin Support </span>
                            </a>
                        </li>
                                            
                                             <li>
                            <a href="/app/admin-users/">
             
                                <span> Users </span>
                            </a>
                        </li>
                                            
                                             <li>
                            <a href="/app/systems/">
             
                                <span> Follow up Systems </span>
                            </a>
                        </li>
                                            
                                             <li>
                            <a href="/app/admin-update-log/">
             
                                <span> Updates </span>
                            </a>
                        </li>
                                            
                                             <li>
                            <a href="/app/applications/">
             
                                <span> Applications </span>
                            </a>
                        </li>
                                            
                                             <li>
                            <a href="/app/components/">
             
                                <span> Components </span>
                            </a>
                        </li>
                                            
                                             <li>
                            <a href="/app/pages/">
             
                                <span> Pages </span>
                            </a>
                        </li>
                                            
                                             <li>
                            <a href="/app/fields/">
             
                                <span> Fields </span>
                            </a>
                        </li>
                                            
                                             <li>
                            <a href="/app/appointment-types/">
             
                                <span> Appointment Types </span>
                            </a>
                        </li>
                                            
                                             <li>
                            <a href="/app/notifications/">
             
                                <span> Relationship Reminders </span>
                            </a>
                        </li>
                                            
                                             <li>
                            <a href="/app/system-types/">
             
                                <span> Follow up System Types </span>
                            </a>
                        </li>
                                            
                                             <li>
                            <a href="/app/categories/">
             
                                <span> Item Categories </span>
                            </a>
                        </li>
                                            
                                             <li>
                            <a href="/app/types/">
             
                                <span> Item Types </span>
                            </a>
                        </li>
                                            
                                             <li>
                            <a href="/app/notes/">
             
                                <span> Notes </span>
                            </a>
                        </li>
                                            
                                             <li>
                            <a href="/app/auditlog/">
             
                                <span> Audit Log </span>
                            </a>
                        </li>
                                            
                                             <li>
                            <a href="/app/versions/">
             
                                <span> Version </span>
                            </a>
                        </li>
                                            
                                             <li>
                            <a href="/app/cancellations/">
             
                                <span> Cancellations </span>
                            </a>
                        </li>
                                            
                                             <li>
                            <a href="/app/imports/">
             
                                <span> Import History </span>
                            </a>
                        </li>
                                            
                                             <li>
                            <a href="/app/share/">
             
                                <span> Team Share </span>
                            </a>
                        </li>
                                        

</ul>
                                </div>
                            </li>

<li>
                                <a href="#sidebarEmail" data-bs-toggle="collapse">
                                      <i data-feather="sliders"></i>
                                    <span> Audition - Admin </span>
                                    <span class="menu-arrow"></span>
                                </a>
                                <div class="collapse" id="sidebarEmail">
                                    <ul class="nav-second-level">
                                        
                                              
                                             <li>
                            <a href="/app/aud-ageranges-results/">
                      
                                <span> Age Ranges </span>
                            </a>
                        </li>
                                            
                                             <li>
                            <a href="/app/aud-categories-results/">
                      
                                <span> Categories </span>
                            </a>
                        </li>
                                            
                                             <li>
                            <a href="/app/aud-contracttypes-results/">
                      
                                <span> Contract Types </span>
                            </a>
                        </li>
                                            
                                             <li>
                            <a href="/app/aud-dialects-results/">
                      
                                <span> Dialects </span>
                            </a>
                        </li>
                                            
                                             <li>
                            <a href="/app/aud-genres-results/">
                      
                                <span> Genres </span>
                            </a>
                        </li>
                                            
                                             <li>
                            <a href="/app/aud-mediatypes-results/">
                      
                                <span> Media Types </span>
                            </a>
                        </li>
                                            
                                             <li>
                            <a href="/app/aud-networks-results/">
                      
                                <span> Networks </span>
                            </a>
                        </li>
                                            
                                             <li>
                            <a href="/app/aud-platforms-results/">
                      
                                <span> Platforms </span>
                            </a>
                        </li>
                                            
                                             <li>
                            <a href="/app/aud-qtypes-results/">
                      
                                <span> Question Types </span>
                            </a>
                        </li>
                                            
                                             <li>
                            <a href="/app/aud-questions-default-results/">
                      
                                <span> Questions Default </span>
                            </a>
                        </li>
                                            
                                             <li>
                            <a href="/app/aud-roletypes-results/">
                      
                                <span> Role Types </span>
                            </a>
                        </li>
                                            
                                             <li>
                            <a href="/app/aud-sources-results/">
                      
                                <span> Sources </span>
                            </a>
                        </li>
                                            
                                             <li>
                            <a href="/app/aud-subcategories-results/">
                      
                                <span> Subcategories </span>
                            </a>
                        </li>
                                            
                                             <li>
                            <a href="/app/aud-tones-results/">
                      
                                <span> Tones </span>
                            </a>
                        </li>
                                            
                                             <li>
                            <a href="/app/aud-types-results/">
                      
                                <span> Types </span>
                            </a>
                        </li>
                                            
                                             <li>
                            <a href="/app/aud-unions-results/">
                      
                                <span> Unions </span>
                            </a>
                        </li>
                                            
                                             <li>
                            <a href="/app/aud-vocaltypes-results/">
                      
                                <span> Vocal Types </span>
                            </a>
                        </li>
                                            
                                             <li>
                            <a href="/app/aud-steps-results/">
                      
                                <span> Audition Steps </span>
                            </a>
                        </li>
                                        

</ul>
                                </div>
                            </li>



</ul>

        </div>

<div class="clearfix"></div>

    </div>
    

</div>

          <div class="content-page">
            <div class="content">
              
              <div class="container-fluid">
                
                <div class="row">
                  

<div class="col-12">
    <div class="page-title-box">
        <div class="page-title-right">
            <ol class="breadcrumb m-0">
                <li class="breadcrumb-item">
                    <a href="/app/dashboard">
                        Admin
                    </a>
                </li>
                <li class="breadcrumb-item">
                    <a href="javascript:void(0);" onclick="history.back();">
                        Auditions
                    </a>
                </li>
                <li class="breadcrumb-item active">
                    Auditions
                </li>
            </ol>
        </div>

        <h4 class="page-title">
            Auditions 
        </h4>
    </div>
</div>

                </div>

                

<script>
    $(document).ready(function () {

        $("#remoteaudadd").on("show.bs.modal", function (event) {
            var $modal = $(this);
            var cacheBuster = new Date().getTime(); 
            var loadUrl = "/include/remoteaudadd.cfm?userid=30&isdirect=0&_=" + cacheBuster;

            $modal.find(".modal-body").html("<p>Loading...</p>");

           $modal.find(".modal-body").load(loadUrl, function (response, status, xhr) {
                if (status === "error") {
                     $modal.find(".modal-body").html("<p>Error loading content. Please try again.</p>");
                } else {
                 
                    $modal.find(".modal-body").focus();
                }
            });
        });
    });
</script>

<div id="remoteaudadd" class="modal fade" tabindex="-1" aria-labelledby="standard-modalLabel" >

    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" >
                <h4 class="modal-title" id="standard-modalLabel">Audition Type</h4>
                <button type="button" class="close" data-bs-dismiss="modal" >

                    <i class="mdi mdi-close-thick"></i>
                </button>
            </div>
            <div class="modal-body"></div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        
        $("#remoteaudadddirect").on("show.bs.modal", function (event) {
            
            $(this).find(".modal-body").load("/include/remoteaudadd.cfm?userid=30&isdirect=1");
        });
    });
</script>

<div id="remoteaudadddirect" class="modal fade" tabindex="-1" aria-labelledby="standard-modalLabel" >

    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" >
                <h4 class="modal-title" id="standard-modalLabel">Direct Booking Type</h4>
                <button type="button" class="close" data-bs-dismiss="modal" >

                    <i class="mdi mdi-close-thick"></i>
                </button>
            </div>
            <div class="modal-body"></div>
        </div>
    </div>
</div>




<div class="container px-1">
    <div class="row">
        <div class="col-12">
            <div class="card mb-3">
                <div class="card-body">

                    

                    <form action="/app/auditions/">

                        
                            <input type="hidden" name="view" value="glry"/>
                        

                        <div class="row">
                            <div class="col-lg-4 pb-1">
                                <a href="" class="btn btn-primary waves-effect waves-light" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="#remoteaudadd" data-bs-placement="top" title="Add Audition" data-bs-original-title="Add Audition">
                                    Add Audition
                                </a>

                                <a href="" class="btn btn-success waves-effect waves-light" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="#remoteaudadddirect" data-bs-placement="top" title="Add Direct booking" data-bs-original-title="Add Direct Booking">
                                    Direct Booking
                                </a>
                            </div>

                            <div class="col-lg-4 pb-1">
                                <select id="audstepid" name="sel_audstepid" class="form-control" onchange="this.form.submit()">
                                    <option value="%">All Statuses</option>
                                    <option value="1" >Audition</option>
                                    <option value="2" >Callback</option>
                                    <option value="3" >Redirect</option>
                                    <option value="4" >Pin/Avail</option>
                                    <option value="5" >Booking</option>
                                    <option value="999" >Direct Booking</option>
                                </select>
                            </div>

                            <div class="col-lg-4 pb-1">
                                <select id="audcatid" class="form-control" name="sel_audcatid" onchange="this.form.submit()">
                                    <option value="%">All Categories</option>
                                    
                                            <option value="6">Commercial</option>
                                        
                                            <option value="1">Film</option>
                                        
                                            <option value="4">Musical Theater</option>
                                        
                                            <option value="7">New Media</option>
                                        
                                            <option value="3">Theater</option>
                                        
                                            <option value="2">TV</option>
                                        
                                            <option value="5">VO</option>
                                        
                                </select>
                            </div>

                            <div class="col-lg-4 d-flex">
                                <span>
                                    

                                    <a href="/app/auditions/?sel_audstepid=0&sel_audtype=%&sel_contactid=%&sel_coname=%&auddate=%&audsearch=&view=tbl&materials=%" class="btn btn-xs btn-outline-secondary waves-effect waves-light">
                                        <i class="mdi mdi-menu fa-2x"></i>
                                    </a>
                                    &nbsp;

                                    <a href="/app/auditions/?sel_audstepid=0&sel_audtype=%&sel_contactid=%&sel_coname=%&auddate=%&audsearch=&view=glry&materials=%" class="btn btn-xs btn-secondary waves-effect waves-light">
                                        <i class="mdi mdi-drag fa-2x"></i>
                                    </a>

                                    &nbsp;&nbsp;

                                    <a href="/app/auditions/?sel_audstepid=0&sel_audtype=%&sel_contactid=%&sel_coname=%&auddate=%&audsearch=&view=glry&isexport=y&materials=%" class="btn btn-xs btn-outline-secondary waves-effect waves-light" title="Export Auditions">
                                        <i class="mdi mdi-export fa-2x"></i>
                                    </a>

                                    &nbsp;&nbsp;

                                    <a href="/app/auditions-import/" class="btn btn-xs btn-outline-secondary waves-effect waves-light" title="Import Auditions">
                                        <i class="mdi mdi-import fa-2x"></i>
                                    </a>
                                </span>
                            </div>

<input type="hidden" name="auddate" value="%"/>



                            <div class="col-lg-4 pb-1">
                                <select id="sel_contactid" name="sel_contactid" class="form-control" onchange="this.form.submit()">
                                    <option value="%">All Casting Directors</option>
                                    
                                        <option value="128892" >Anne Kroft</option>
                                    
                                        <option value="130998" >Annette Caton</option>
                                    
                                        <option value="130996" >Arne Berggren</option>
                                    
                                        <option value="128756" >Brad Cleason samit</option>
                                    
                                        <option value="129659" >Brankfy Smith</option>
                                    
                                        <option value="135702" >cdname</option>
                                    
                                        <option value="130655" >Christine Tarallo</option>
                                    
                                        <option value="128767" >Chronjob Mathhews Auto</option>
                                    
                                        <option value="129636" >esse ghh</option>
                                    
                                        <option value="128763" >Frank gg samit</option>
                                    
                                        <option value="128764" >Frank gg samit</option>
                                    
                                        <option value="140528" >Frank Marshall</option>
                                    
                                        <option value="128755" >Frank Middles samit</option>
                                    
                                        <option value="129642" >Georgie Lee</option>
                                    
                                        <option value="129648" >HajOOOnk Lee</option>
                                    
                                        <option value="128765" >Hank gg Doe</option>
                                    
                                        <option value="130650" >Heather Rosenfeld</option>
                                    
                                        <option value="129639" >Henry Lee</option>
                                    
                                        <option value="136196" >herewegoagain</option>
                                    
                                        <option value="131005" >Jeremy DeCarlos</option>
                                    
                                        <option value="136106" >Jon Majors</option>
                                    
                                        <option value="130949" >Kristen Bell</option>
                                    
                                        <option value="130997" >Kristine Berg</option>
                                    
                                        <option value="130881" >Lisa Smith</option>
                                    
                                        <option value="130981" >Mary Vernieu</option>
                                    
                                        <option value="130712" >Mimi Mayer</option>
                                    
                                        <option value="130954" >Robert Stone</option>
                                    
                                        <option value="130988" >Roya Dedeaux</option>
                                    
                                        <option value="129660" >Steph Lee</option>
                                    
                                        <option value="136609" >test tttest</option>
                                    
                                        <option value="130943" >U-Shin Kim</option>
                                    
                                        <option value="130940" >Ørjan Karlsen</option>
                                    
                                </select>
                            </div>

                            <div class="col-lg-4 pb-1">
                                <select id="sel_coname" name="sel_coname" class="form-control" onchange="this.form.submit()">
                                    <option value="%">All Companies</option>
                                    
                                        <option value="" ></option>
                                    
                                        <option value="Acme Company" >Acme Company</option>
                                    
                                        <option value="Betty Mae Casting" >Betty Mae Casting</option>
                                    
                                        <option value="C&J Casting" >C&J Casting</option>
                                    
                                        <option value="ITV" >ITV</option>
                                    
                                        <option value="Now Talent Group" >Now Talent Group</option>
                                    
                                        <option value="Shuuto" >Shuuto</option>
                                    
                                        <option value="Stone vs. Stone" >Stone vs. Stone</option>
                                    
                                </select>
                            </div>

                            <div class="col-lg-4 pb-1"></div>

                            <div class="col-lg-8 pb-1">
                                <div class="app-search-box dropdown">
                                    <div class="input-group">
                                        <input type="text" class="form-control" name="audsearch" value="" id="audsearch" placeholder="Search..." autocomplete="off">
                                        &nbsp;
                                        <div class="input-group-append">
                                            <button class="btn btn-xs btn-primary waves-effect waves-light" id="mybtn" style="height:100%;" type="submit">
                                                <i class="fe-search"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
<div class="container p-3">
                <div class="row">



        <p>
            
                <strong>133</strong> auditions found
            
        </p>

             
    
        
        <div class="container">
            <div class="row tao-card-row row-cols-1 row-cols-sm-2 row-cols-md-2 row-cols-lg-2 row-cols-xl-3 g-3">

                
                

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-2835">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=2835" title="View Details">
      
        <div class="ribbon-three ribbon-two-success"><span>Booked!</span></div>
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">Test new Cad 666</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/12-29.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2026</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Commercial 
                <br><span class="tao-card-subtitle">Host</span>
              
          </p>

          
          <p class="tao-card-company">
            Doctor
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-pin has-content"></i>
                Open Call
              </span>
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Frank Marshall
              </span>
            
          
          </p>
        </div>
      </div>
      

      
    <div class="ribbon-straight-box">

        
        
                <div class="ribbon-straight ribbon-straight-redirect">
                    <i class="mdi mdi-swap-horizontal"></i> &nbsp; Redirect
                </div>
            
                <div class="ribbon-straight ribbon-straight-callback">
                    <i class="mdi mdi-phone-incoming"></i> &nbsp; Callback
                </div>
            

    </div>





 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-2814">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=2814" title="View Details">
      
        <div class="ribbon-three ribbon-two-success"><span>Booked!</span></div>
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">Audition add</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/12-28.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2024</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Indie Feature</span>
              
          </p>

          
          <p class="tao-card-company">
            aud (Featured)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Steph Lee
              </span>
            
          
          </p>
        </div>
      </div>
      

      
    <div class="ribbon-straight-box">

        
        

    </div>





 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-2471">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=2471" title="View Details">
      
        <div class="ribbon-three ribbon-two-success"><span>Booked!</span></div>
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">no cdx</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/11-22.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2024</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            New Media 
                <br><span class="tao-card-subtitle">Internet</span>
              
          </p>

          
          <p class="tao-card-company">
            no cd (Featured)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-pin has-content"></i>
                My Team
              </span>
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Georgie Lee
              </span>
            
          
          </p>
        </div>
      </div>
      

      
    <div class="ribbon-straight-box">

        
        
                <div class="ribbon-straight ribbon-straight-callback">
                    <i class="mdi mdi-phone-incoming"></i> &nbsp; Callback
                </div>
            

    </div>





 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-2800">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=2800" title="View Details">
      
        <div class="ribbon-three ribbon-two-success"><span>Booked!</span></div>
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">steph lee</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/09-01.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2024</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Indie Feature</span>
              
          </p>

          
          <p class="tao-card-company">
            steph (Featured)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Steph Lee
              </span>
            
          
          </p>
        </div>
      </div>
      

      
    <div class="ribbon-straight-box">

        
        

    </div>





 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-2467">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=2467" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">x</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/08-30.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2024</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Commercial 
                <br><span class="tao-card-subtitle">Infomercial</span>
              
          </p>

          
          <p class="tao-card-company">
            x (Host)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                HajOOOnk Lee
              </span>
            
          
          </p>
        </div>
      </div>
      

      
    <div class="ribbon-straight-box">

        
        
                <div class="ribbon-straight ribbon-straight-callback">
                    <i class="mdi mdi-phone-incoming"></i> &nbsp; Callback
                </div>
            

    </div>





 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-2482">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=2482" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">TEST</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/08-16.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2024</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Indie Feature</span>
              
          </p>

          
          <p class="tao-card-company">
            TEST (Lead)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Brankfy Smith
              </span>
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-2464">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=2464" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">Same</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/08-02.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2024</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            New Media 
                <br><span class="tao-card-subtitle">Other</span>
              
          </p>

          
          <p class="tao-card-company">
            same (Featured)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Frank gg samit
              </span>
            
          
          </p>
        </div>
      </div>
      

      
    <div class="ribbon-straight-box">

        
        
                <div class="ribbon-straight ribbon-straight-callback">
                    <i class="mdi mdi-phone-incoming"></i> &nbsp; Callback
                </div>
            

    </div>





 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-1807">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=1807" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">REALLY new</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/06-01.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2024</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Commercial 
                <br><span class="tao-card-subtitle">Host</span>
              
          </p>

          
          <p class="tao-card-company">
            Cop
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-pin has-content"></i>
                Open Call
              </span>
            
          
          </p>
        </div>
      </div>
      

      
    <div class="ribbon-straight-box">

        
        
                <div class="ribbon-straight ribbon-straight-redirect">
                    <i class="mdi mdi-swap-horizontal"></i> &nbsp; Redirect
                </div>
            
                <div class="ribbon-straight ribbon-straight-callback">
                    <i class="mdi mdi-phone-incoming"></i> &nbsp; Callback
                </div>
            

    </div>





 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-1808">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=1808" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">sdafdsfdfs</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/06-01.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2024</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Commercial 
                <br><span class="tao-card-subtitle">Host</span>
              
          </p>

          
          <p class="tao-card-company">
            BLSLKDF (Background)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-pin has-content"></i>
                Open Call
              </span>
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                test tttest
              </span>
            
          
          </p>
        </div>
      </div>
      

      
    <div class="ribbon-straight-box">

        
        
                <div class="ribbon-straight ribbon-straight-redirect">
                    <i class="mdi mdi-swap-horizontal"></i> &nbsp; Redirect
                </div>
            
                <div class="ribbon-straight ribbon-straight-callback">
                    <i class="mdi mdi-phone-incoming"></i> &nbsp; Callback
                </div>
            

    </div>





 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-2231">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=2231" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">testttt</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/05-25.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2024</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Other</span>
              
          </p>

          
          <p class="tao-card-company">
            test (Lead)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Anne Kroft
              </span>
            
          
          </p>
        </div>
      </div>
      

      
    <div class="ribbon-straight-box">

        
        
                <div class="ribbon-straight ribbon-straight-callback">
                    <i class="mdi mdi-phone-incoming"></i> &nbsp; Callback
                </div>
            

    </div>





 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-869">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=869" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">test</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/05-06.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2024</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Indie Feature</span>
              
          </p>

          
          <p class="tao-card-company">
            test (Featured)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Georgie Lee
              </span>
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-130">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=130" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">test vo</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/01-26.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2024</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            VO 
                <br><span class="tao-card-subtitle">Explainer Videos</span>
              
          </p>

          
          <p class="tao-card-company">
            rws (N/A)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Robert Stone
              </span>
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-1122">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=1122" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">test</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/08-26.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2023</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Commercial 
                <br><span class="tao-card-subtitle">Internet</span>
              
          </p>

          
          <p class="tao-card-company">
            test (Host)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                esse ghh
              </span>
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-1090">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=1090" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">tests</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/08-19.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2023</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Other</span>
              
          </p>

          
          <p class="tao-card-company">
            test (Lead)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Georgie Lee
              </span>
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-1007">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=1007" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">test</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/07-28.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2023</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            New Media 
                <br><span class="tao-card-subtitle">Other</span>
              
          </p>

          
          <p class="tao-card-company">
            test (Background)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Frank Middles samit
              </span>
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-1035">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=1035" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">Test</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/07-27.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2023</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Other</span>
              
          </p>

          
          <p class="tao-card-company">
            test (Featured)
          </p>

          
          <p class="tao-card-contact">
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-1044">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=1044" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">aaaaa</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/07-27.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2023</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Commercial 
                <br><span class="tao-card-subtitle">Host</span>
              
          </p>

          
          <p class="tao-card-company">
            Doctor
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-pin has-content"></i>
                Open Call
              </span>
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Jon Majors
              </span>
            
          
          </p>
        </div>
      </div>
      

      
    <div class="ribbon-straight-box">

        
        
                <div class="ribbon-straight ribbon-straight-redirect">
                    <i class="mdi mdi-swap-horizontal"></i> &nbsp; Redirect
                </div>
            
                <div class="ribbon-straight ribbon-straight-callback">
                    <i class="mdi mdi-phone-incoming"></i> &nbsp; Callback
                </div>
            

    </div>





 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-1045">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=1045" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">aaaaa</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/07-26.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2023</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Commercial 
                <br><span class="tao-card-subtitle">Host</span>
              
          </p>

          
          <p class="tao-card-company">
            Doctor
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-pin has-content"></i>
                Open Call
              </span>
            
          
          </p>
        </div>
      </div>
      

      
    <div class="ribbon-straight-box">

        
        
                <div class="ribbon-straight ribbon-straight-redirect">
                    <i class="mdi mdi-swap-horizontal"></i> &nbsp; Redirect
                </div>
            
                <div class="ribbon-straight ribbon-straight-callback">
                    <i class="mdi mdi-phone-incoming"></i> &nbsp; Callback
                </div>
            

    </div>





 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-1055">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=1055" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">test</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/07-20.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2023</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Other</span>
              
          </p>

          
          <p class="tao-card-company">
            test (Lead)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-pin has-content"></i>
                Referral
              </span>
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Brankfy Smith
              </span>
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-1008">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=1008" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">test</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/07-14.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2023</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            TV 
                <br><span class="tao-card-subtitle">Other</span>
              
          </p>

          
          <p class="tao-card-company">
            test (Recurring)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Frank gg samit
              </span>
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-1006">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=1006" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">test</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/07-13.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2023</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Reading</span>
              
          </p>

          
          <p class="tao-card-company">
            test (Featured)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Brad Cleason samit
              </span>
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-1009">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=1009" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">rrr</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/07-13.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2023</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            New Media 
                <br><span class="tao-card-subtitle">Other</span>
              
          </p>

          
          <p class="tao-card-company">
            test (Background)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Georgie Lee
              </span>
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-1010">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=1010" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">rrr</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/07-13.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2023</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            New Media 
                <br><span class="tao-card-subtitle">Other</span>
              
          </p>

          
          <p class="tao-card-company">
            test (Background)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Georgie Lee
              </span>
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-1011">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=1011" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">rrr</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/07-13.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2023</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            New Media 
                <br><span class="tao-card-subtitle">Other</span>
              
          </p>

          
          <p class="tao-card-company">
            test (Background)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Georgie Lee
              </span>
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-946">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=946" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">cdname</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/07-01.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2023</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Other</span>
              
          </p>

          
          <p class="tao-card-company">
            cdname (Background)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                cdname
              </span>
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-964">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=964" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">tea</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/06-21.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2023</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Musical Theater 
                <br><span class="tao-card-subtitle">Cabaret</span>
              
          </p>

          
          <p class="tao-card-company">
            tt (Dance Captain)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Frank gg samit
              </span>
            
          
          </p>
        </div>
      </div>
      

      
    <div class="ribbon-straight-box">

        
        
                <div class="ribbon-straight ribbon-straight-callback">
                    <i class="mdi mdi-phone-incoming"></i> &nbsp; Callback
                </div>
            

    </div>





 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-877">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=877" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">Test</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/05-26.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2023</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Reading</span>
              
          </p>

          
          <p class="tao-card-company">
            test (Lead)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Hank gg Doe
              </span>
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-883">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=883" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">test</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/05-18.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2023</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Reading</span>
              
          </p>

          
          <p class="tao-card-company">
            test (Featured)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                HajOOOnk Lee
              </span>
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-884">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=884" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">test</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/05-17.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2023</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Musical Theater 
                <br><span class="tao-card-subtitle">Community</span>
              
          </p>

          
          <p class="tao-card-company">
            test (Dance Captain)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                HajOOOnk Lee
              </span>
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-831">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=831" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">test</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/04-29.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2023</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Reading</span>
              
          </p>

          
          <p class="tao-card-company">
            test (Lead)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Henry Lee
              </span>
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-824">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=824" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">test</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/04-28.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2023</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Indie Feature</span>
              
          </p>

          
          <p class="tao-card-company">
            te (Lead)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Chronjob Mathhews Auto
              </span>
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-823">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=823" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">test</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/04-01.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2023</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Commercial 
                <br><span class="tao-card-subtitle">Industrial</span>
              
          </p>

          
          <p class="tao-card-company">
            test (Background)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Frank gg samit
              </span>
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-731">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=731" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">test</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/03-22.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2023</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Commercial 
                <br><span class="tao-card-subtitle">Infomercial</span>
              
          </p>

          
          <p class="tao-card-company">
            test (Background)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Henry Lee
              </span>
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-579">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=579" title="View Details">
      
        <div class="ribbon-three ribbon-two-success"><span>Booked!</span></div>
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">Direct  Booking</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/02-09.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2023</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Musical Theater 
                <br><span class="tao-card-subtitle">Cabaret</span>
              
          </p>

          
          <p class="tao-card-company">
            Direct (Recurring)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Henry Lee
              </span>
            
          
          </p>
        </div>
      </div>
      

      
    <div class="ribbon-straight-box">

        
        

    </div>





 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-1078">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=1078" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">Blah3</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/02-05.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2023</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Commercial 
                <br><span class="tao-card-subtitle">Host</span>
              
          </p>

          
          <p class="tao-card-company">
            
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-pin has-content"></i>
                Open Call
              </span>
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Jon Majors
              </span>
            
          
          </p>
        </div>
      </div>
      

      
    <div class="ribbon-straight-box">

        
        
                <div class="ribbon-straight ribbon-straight-redirect">
                    <i class="mdi mdi-swap-horizontal"></i> &nbsp; Redirect
                </div>
            
                <div class="ribbon-straight ribbon-straight-callback">
                    <i class="mdi mdi-phone-incoming"></i> &nbsp; Callback
                </div>
            

    </div>





 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-1077">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=1077" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">Test new Cad</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/02-04.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2023</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Commercial 
                <br><span class="tao-card-subtitle">Host</span>
              
          </p>

          
          <p class="tao-card-company">
            Doctor
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-pin has-content"></i>
                Open Call
              </span>
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Jon Majors
              </span>
            
          
          </p>
        </div>
      </div>
      

      
    <div class="ribbon-straight-box">

        
        
                <div class="ribbon-straight ribbon-straight-redirect">
                    <i class="mdi mdi-swap-horizontal"></i> &nbsp; Redirect
                </div>
            
                <div class="ribbon-straight ribbon-straight-callback">
                    <i class="mdi mdi-phone-incoming"></i> &nbsp; Callback
                </div>
            

    </div>





 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-1096">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=1096" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">Test new Cads4567489010993</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/02-04.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2023</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            
          </p>

          
          <p class="tao-card-company">
            Doctor
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-pin has-content"></i>
                Open Call
              </span>
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                herewegoagain
              </span>
            
          
          </p>
        </div>
      </div>
      

      
    <div class="ribbon-straight-box">

        
        
                <div class="ribbon-straight ribbon-straight-redirect">
                    <i class="mdi mdi-swap-horizontal"></i> &nbsp; Redirect
                </div>
            
                <div class="ribbon-straight ribbon-straight-callback">
                    <i class="mdi mdi-phone-incoming"></i> &nbsp; Callback
                </div>
            

    </div>





 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-1162">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=1162" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">Test newszzz Cad</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/02-04.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2023</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Commercial 
                <br><span class="tao-card-subtitle">Host</span>
              
          </p>

          
          <p class="tao-card-company">
            Doctor
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-pin has-content"></i>
                Open Call
              </span>
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                herewegoagain
              </span>
            
          
          </p>
        </div>
      </div>
      

      
    <div class="ribbon-straight-box">

        
        
                <div class="ribbon-straight ribbon-straight-redirect">
                    <i class="mdi mdi-swap-horizontal"></i> &nbsp; Redirect
                </div>
            
                <div class="ribbon-straight ribbon-straight-callback">
                    <i class="mdi mdi-phone-incoming"></i> &nbsp; Callback
                </div>
            

    </div>





 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-2090">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=2090" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">Anotehr Project</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/02-04.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2023</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Commercial 
                <br><span class="tao-card-subtitle">Host</span>
              
          </p>

          
          <p class="tao-card-company">
            Plumber
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-pin has-content"></i>
                Open Call
              </span>
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                test tttest
              </span>
            
          
          </p>
        </div>
      </div>
      

      
    <div class="ribbon-straight-box">

        
        
                <div class="ribbon-straight ribbon-straight-redirect">
                    <i class="mdi mdi-swap-horizontal"></i> &nbsp; Redirect
                </div>
            
                <div class="ribbon-straight ribbon-straight-callback">
                    <i class="mdi mdi-phone-incoming"></i> &nbsp; Callback
                </div>
            

    </div>





 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-554">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=554" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">Test</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/01-30.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2023</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Commercial 
                <br><span class="tao-card-subtitle">Infomercial</span>
              
          </p>

          
          <p class="tao-card-company">
            test (Host)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Henry Lee
              </span>
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-195">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=195" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">another test</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/11-19.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            New Media 
                <br><span class="tao-card-subtitle">Web Series</span>
              
          </p>

          
          <p class="tao-card-company">
            test (Featured)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-pin has-content"></i>
                My Team
              </span>
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Georgie Lee
              </span>
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-220">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=220" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">Test</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/11-19.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Short</span>
              
          </p>

          
          <p class="tao-card-company">
            test (Lead)
          </p>

          
          <p class="tao-card-contact">
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-18">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=18" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">blah</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/11-12.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Studio Feature</span>
              
          </p>

          
          <p class="tao-card-company">
            blah name
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-pin has-content"></i>
                Self-submit
              </span>
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-19">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=19" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">Testing</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/11-12.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Studio Feature</span>
              
          </p>

          
          <p class="tao-card-company">
            testname
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-pin has-content"></i>
                Referral
              </span>
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-23">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=23" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">New Project</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/11-12.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Studio Feature</span>
              
          </p>

          
          <p class="tao-card-company">
            Betty (Supporting)
          </p>

          
          <p class="tao-card-contact">
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-24">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=24" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">Stuff</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/11-12.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Musical Theater 
                <br><span class="tao-card-subtitle">Reading/Concert</span>
              
          </p>

          
          <p class="tao-card-company">
            test (Featured Dancer)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Christine Tarallo
              </span>
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-25">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=25" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">test</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/11-12.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Musical Theater 
                <br><span class="tao-card-subtitle">Off-off Broadway</span>
              
          </p>

          
          <p class="tao-card-company">
            test (Featured Dancer)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                U-Shin Kim
              </span>
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-26">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=26" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">test</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/11-12.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Musical Theater 
                <br><span class="tao-card-subtitle">Off-off Broadway</span>
              
          </p>

          
          <p class="tao-card-company">
            test (Featured Dancer)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                U-Shin Kim
              </span>
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-27">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=27" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">test</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/11-12.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Theater 
                <br><span class="tao-card-subtitle">Regional</span>
              
          </p>

          
          <p class="tao-card-company">
            test (Chorus)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                U-Shin Kim
              </span>
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-28">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=28" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">test</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/11-12.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Theater 
                <br><span class="tao-card-subtitle">Regional</span>
              
          </p>

          
          <p class="tao-card-company">
            test (Chorus)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                U-Shin Kim
              </span>
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-31">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=31" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">test</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/11-12.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Theater 
                <br><span class="tao-card-subtitle">Regional</span>
              
          </p>

          
          <p class="tao-card-company">
            test (Chorus)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                U-Shin Kim
              </span>
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-33">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=33" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">Do not Watch</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/11-12.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Indie Feature</span>
              
          </p>

          
          <p class="tao-card-company">
            Kelly (Lead)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Kristen Bell
              </span>
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-34">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=34" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">Do not watch</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/11-12.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Indie Feature</span>
              
          </p>

          
          <p class="tao-card-company">
            Kelly (Lead)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Robert Stone
              </span>
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-35">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=35" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">This Should Work</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/11-12.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Documentary</span>
              
          </p>

          
          <p class="tao-card-company">
            Brad (Background)
          </p>

          
          <p class="tao-card-contact">
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-36">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=36" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">This Should Work</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/11-12.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Documentary</span>
              
          </p>

          
          <p class="tao-card-company">
            Brad (Background)
          </p>

          
          <p class="tao-card-contact">
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-37">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=37" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">This better work</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/11-12.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Reading</span>
              
          </p>

          
          <p class="tao-card-company">
            test (Stand-In)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Roya Dedeaux
              </span>
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-46">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=46" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">another</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/11-12.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            
          </p>

          
          <p class="tao-card-company">
            teees
          </p>

          
          <p class="tao-card-contact">
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-51">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=51" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">Test</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/11-12.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Indie Feature</span>
              
          </p>

          
          <p class="tao-card-company">
            test (Featured)
          </p>

          
          <p class="tao-card-contact">
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-53">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=53" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">Seinfeld</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/11-12.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Other</span>
              
          </p>

          
          <p class="tao-card-company">
            Magician (Background)
          </p>

          
          <p class="tao-card-contact">
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-54">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=54" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">x</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/11-12.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Other</span>
              
          </p>

          
          <p class="tao-card-company">
            x (Lead)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Heather Rosenfeld
              </span>
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-55">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=55" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">x</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/11-12.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Other</span>
              
          </p>

          
          <p class="tao-card-company">
            x (Lead)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Arne Berggren
              </span>
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-57">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=57" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">New Project Name</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/11-12.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Other</span>
              
          </p>

          
          <p class="tao-card-company">
            Roleny Name (Featured)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Roya Dedeaux
              </span>
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-58">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=58" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">Project Name</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/11-12.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Other</span>
              
          </p>

          
          <p class="tao-card-company">
            Fred (Stand-In)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Roya Dedeaux
              </span>
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-59">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=59" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">Drunken Idol</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/11-12.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Reading</span>
              
          </p>

          
          <p class="tao-card-company">
            Role (Featured)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Kristine Berg
              </span>
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-60">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=60" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">Test</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/11-12.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Indie Feature</span>
              
          </p>

          
          <p class="tao-card-company">
            Bill (Featured)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Annette Caton
              </span>
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-86">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=86" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">Unknown</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/11-12.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Other</span>
              
          </p>

          
          <p class="tao-card-company">
            Unknown (Background)
          </p>

          
          <p class="tao-card-contact">
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-87">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=87" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">Unknown</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/11-12.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Other</span>
              
          </p>

          
          <p class="tao-card-company">
            Unknown (Background)
          </p>

          
          <p class="tao-card-contact">
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-88">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=88" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">Unknown</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/11-12.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Other</span>
              
          </p>

          
          <p class="tao-card-company">
            Unknown (Background)
          </p>

          
          <p class="tao-card-contact">
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-93">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=93" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">Unknown</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/11-12.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Other</span>
              
          </p>

          
          <p class="tao-card-company">
            Unknown (Background)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-pin has-content"></i>
                Referral
              </span>
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-102">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=102" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">x</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/11-12.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Reading</span>
              
          </p>

          
          <p class="tao-card-company">
            x (Featured)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Robert Stone
              </span>
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-108">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=108" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">x</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/11-12.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Reading</span>
              
          </p>

          
          <p class="tao-card-company">
            s (Featured)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Robert Stone
              </span>
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-109">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=109" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">x</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/11-12.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Reading</span>
              
          </p>

          
          <p class="tao-card-company">
            s (Featured)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Robert Stone
              </span>
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-110">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=110" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">x</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/11-12.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Reading</span>
              
          </p>

          
          <p class="tao-card-company">
            s (Featured)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Robert Stone
              </span>
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-111">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=111" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">x</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/11-12.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Reading</span>
              
          </p>

          
          <p class="tao-card-company">
            s (Featured)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Robert Stone
              </span>
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-112">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=112" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">x</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/11-12.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Reading</span>
              
          </p>

          
          <p class="tao-card-company">
            s (Featured)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Robert Stone
              </span>
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-113">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=113" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">x</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/11-12.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Reading</span>
              
          </p>

          
          <p class="tao-card-company">
            s (Featured)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Henry Lee
              </span>
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-114">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=114" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">x</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/11-12.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Reading</span>
              
          </p>

          
          <p class="tao-card-company">
            s (Featured)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Robert Stone
              </span>
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-165">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=165" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">h</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/11-12.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Musical Theater 
                <br><span class="tao-card-subtitle">Cabaret</span>
              
          </p>

          
          <p class="tao-card-company">
            f (Chorus)
          </p>

          
          <p class="tao-card-contact">
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-175">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=175" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">ttt</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/10-29.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Musical Theater 
                <br><span class="tao-card-subtitle">Community</span>
              
          </p>

          
          <p class="tao-card-company">
            test (Supporting)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Hank gg Doe
              </span>
            
          
          </p>
        </div>
      </div>
      

      
    <div class="ribbon-straight-box">

        
        
                <div class="ribbon-straight ribbon-straight-redirect">
                    <i class="mdi mdi-swap-horizontal"></i> &nbsp; Redirect
                </div>
            

    </div>





 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-85">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=85" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">Test calendar</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/10-15.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Commercial 
                <br><span class="tao-card-subtitle">Industrial</span>
              
          </p>

          
          <p class="tao-card-company">
            test (Background)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-pin has-content"></i>
                Self-submit
              </span>
            
          
          </p>
        </div>
      </div>
      

      
    <div class="ribbon-straight-box">

        
        
                <div class="ribbon-straight ribbon-straight-pin">
                    <i class="mdi mdi-map-marker"></i> &nbsp; Pin
                </div>
            
                <div class="ribbon-straight ribbon-straight-redirect">
                    <i class="mdi mdi-swap-horizontal"></i> &nbsp; Redirect
                </div>
            

    </div>





 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-157">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=157" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">ff</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/10-15.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Indie Feature</span>
              
          </p>

          
          <p class="tao-card-company">
            ff (Featured)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-pin has-content"></i>
                My Team
              </span>
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Brad Cleason samit
              </span>
            
          
          </p>
        </div>
      </div>
      

      
    <div class="ribbon-straight-box">

        
        
                <div class="ribbon-straight ribbon-straight-redirect">
                    <i class="mdi mdi-swap-horizontal"></i> &nbsp; Redirect
                </div>
            

    </div>





 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-158">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=158" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">ff</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/10-15.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Indie Feature</span>
              
          </p>

          
          <p class="tao-card-company">
            ff (Featured)
          </p>

          
          <p class="tao-card-contact">
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-155">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=155" title="View Details">
      
        <div class="ribbon-three ribbon-two-success"><span>Booked!</span></div>
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">tessssssst</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/10-14.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            New Media 
                <br><span class="tao-card-subtitle">Web Series</span>
              
          </p>

          
          <p class="tao-card-company">
            assd (N/A)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Brad Cleason samit
              </span>
            
          
          </p>
        </div>
      </div>
      

      
    <div class="ribbon-straight-box">

        
        
                <div class="ribbon-straight ribbon-straight-redirect">
                    <i class="mdi mdi-swap-horizontal"></i> &nbsp; Redirect
                </div>
            

    </div>





 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-156">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=156" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">a</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/10-14.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Musical Theater 
                <br><span class="tao-card-subtitle">Off-off Broadway</span>
              
          </p>

          
          <p class="tao-card-company">
            test (Lead)
          </p>

          
          <p class="tao-card-contact">
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-159">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=159" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">aa</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/10-14.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Indie Feature</span>
              
          </p>

          
          <p class="tao-card-company">
            fff (Featured)
          </p>

          
          <p class="tao-card-contact">
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-167">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=167" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">test</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/10-14.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Musical Theater 
                <br><span class="tao-card-subtitle">Cabaret</span>
              
          </p>

          
          <p class="tao-card-company">
            test (Chorus)
          </p>

          
          <p class="tao-card-contact">
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-129">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=129" title="View Details">
      
        <div class="ribbon-three ribbon-two-success"><span>Booked!</span></div>
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">test</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/10-04.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            VO 
                <br><span class="tao-card-subtitle">Commercial</span>
              
          </p>

          
          <p class="tao-card-company">
            test (N/A)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Lisa Smith
              </span>
            
          
          </p>
        </div>
      </div>
      

      
    <div class="ribbon-straight-box">

        
        
                <div class="ribbon-straight ribbon-straight-pin">
                    <i class="mdi mdi-map-marker"></i> &nbsp; Pin
                </div>
            
                <div class="ribbon-straight ribbon-straight-redirect">
                    <i class="mdi mdi-swap-horizontal"></i> &nbsp; Redirect
                </div>
            
                <div class="ribbon-straight ribbon-straight-callback">
                    <i class="mdi mdi-phone-incoming"></i> &nbsp; Callback
                </div>
            

    </div>





 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-89">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=89" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">Unknown</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/10-01.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Other</span>
              
          </p>

          
          <p class="tao-card-company">
            Unknown (Background)
          </p>

          
          <p class="tao-card-contact">
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-95">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=95" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">Unknown</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/10-01.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Other</span>
              
          </p>

          
          <p class="tao-card-company">
            Unknown (Background)
          </p>

          
          <p class="tao-card-contact">
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-106">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=106" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">x</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/10-01.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Reading</span>
              
          </p>

          
          <p class="tao-card-company">
            s (Featured)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Robert Stone
              </span>
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-107">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=107" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">x</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/10-01.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Reading</span>
              
          </p>

          
          <p class="tao-card-company">
            s (Featured)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Robert Stone
              </span>
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-91">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=91" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">Unknown</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/09-30.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Other</span>
              
          </p>

          
          <p class="tao-card-company">
            Unknown (Background)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-pin has-content"></i>
                Referral
              </span>
            
          
          </p>
        </div>
      </div>
      

      
    <div class="ribbon-straight-box">

        
        
                <div class="ribbon-straight ribbon-straight-pin">
                    <i class="mdi mdi-map-marker"></i> &nbsp; Pin
                </div>
            
                <div class="ribbon-straight ribbon-straight-redirect">
                    <i class="mdi mdi-swap-horizontal"></i> &nbsp; Redirect
                </div>
            
                <div class="ribbon-straight ribbon-straight-callback">
                    <i class="mdi mdi-phone-incoming"></i> &nbsp; Callback
                </div>
            

    </div>





 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-92">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=92" title="View Details">
      
        <div class="ribbon-three ribbon-two-success"><span>Booked!</span></div>
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">the</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/09-30.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Other</span>
              
          </p>

          
          <p class="tao-card-company">
            Unknown (Background)
          </p>

          
          <p class="tao-card-contact">
            
          
          </p>
        </div>
      </div>
      

      
    <div class="ribbon-straight-box">

        
        
                <div class="ribbon-straight ribbon-straight-callback">
                    <i class="mdi mdi-phone-incoming"></i> &nbsp; Callback
                </div>
            

    </div>





 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-98">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=98" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">x</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/09-30.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Reading</span>
              
          </p>

          
          <p class="tao-card-company">
            x (Featured)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Robert Stone
              </span>
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-99">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=99" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">x</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/09-30.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Reading</span>
              
          </p>

          
          <p class="tao-card-company">
            x (Featured)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Robert Stone
              </span>
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-100">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=100" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">x</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/09-30.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Reading</span>
              
          </p>

          
          <p class="tao-card-company">
            x (Featured)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Robert Stone
              </span>
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-101">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=101" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">x</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/09-30.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Reading</span>
              
          </p>

          
          <p class="tao-card-company">
            x (Featured)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Robert Stone
              </span>
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-103">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=103" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">test</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/09-30.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Reading</span>
              
          </p>

          
          <p class="tao-card-company">
            test (Featured)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Robert Stone
              </span>
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-104">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=104" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">test</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/09-30.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Reading</span>
              
          </p>

          
          <p class="tao-card-company">
            test (Featured)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Robert Stone
              </span>
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-105">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=105" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">test</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/09-30.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Reading</span>
              
          </p>

          
          <p class="tao-card-company">
            test (Featured)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Robert Stone
              </span>
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-115">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=115" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">x</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/09-30.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Reading</span>
              
          </p>

          
          <p class="tao-card-company">
            x (Featured)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Robert Stone
              </span>
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-116">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=116" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">x</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/09-30.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Reading</span>
              
          </p>

          
          <p class="tao-card-company">
            x (Featured)
          </p>

          
          <p class="tao-card-contact">
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-117">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=117" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">a</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/09-28.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Reading</span>
              
          </p>

          
          <p class="tao-card-company">
            c (Lead)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Jeremy DeCarlos
              </span>
            
          
          </p>
        </div>
      </div>
      

      
    <div class="ribbon-straight-box">

        
        
                <div class="ribbon-straight ribbon-straight-redirect">
                    <i class="mdi mdi-swap-horizontal"></i> &nbsp; Redirect
                </div>
            
                <div class="ribbon-straight ribbon-straight-callback">
                    <i class="mdi mdi-phone-incoming"></i> &nbsp; Callback
                </div>
            

    </div>





 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-77">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=77" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">treest</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/09-17.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Commercial 
                <br><span class="tao-card-subtitle">Infomercial</span>
              
          </p>

          
          <p class="tao-card-company">
            test (Stand In)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                U-Shin Kim
              </span>
            
          
          </p>
        </div>
      </div>
      

      
    <div class="ribbon-straight-box">

        
        
                <div class="ribbon-straight ribbon-straight-callback">
                    <i class="mdi mdi-phone-incoming"></i> &nbsp; Callback
                </div>
            

    </div>





 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-90">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=90" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">Unknown</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/09-17.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Other</span>
              
          </p>

          
          <p class="tao-card-company">
            Unknown (Background)
          </p>

          
          <p class="tao-card-contact">
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-75">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=75" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">Test</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/09-10.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Commercial 
                <br><span class="tao-card-subtitle">Industrial</span>
              
          </p>

          
          <p class="tao-card-company">
            test (Background)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Lisa Smith
              </span>
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-76">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=76" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">Test</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/09-10.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Commercial 
                <br><span class="tao-card-subtitle">Industrial</span>
              
          </p>

          
          <p class="tao-card-company">
            test (Background)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Lisa Smith
              </span>
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-73">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=73" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">blah</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/09-08.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Documentary</span>
              
          </p>

          
          <p class="tao-card-company">
            tim (Featured)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Robert Stone
              </span>
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-72">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=72" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">Test</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/08-29.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Reading</span>
              
          </p>

          
          <p class="tao-card-company">
            Bill (Featured)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Lisa Smith
              </span>
            
          
          </p>
        </div>
      </div>
      

      
    <div class="ribbon-straight-box">

        
        
                <div class="ribbon-straight ribbon-straight-redirect">
                    <i class="mdi mdi-swap-horizontal"></i> &nbsp; Redirect
                </div>
            
                <div class="ribbon-straight ribbon-straight-callback">
                    <i class="mdi mdi-phone-incoming"></i> &nbsp; Callback
                </div>
            

    </div>





 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-20">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=20" title="View Details">
      
        <div class="ribbon-three ribbon-two-success"><span>Booked!</span></div>
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">The Last Starfighter</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/08-27.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Reading</span>
              
          </p>

          
          <p class="tao-card-company">
            Bill (N/A)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-pin has-content"></i>
                Referral
              </span>
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Lisa Smith
              </span>
            
          
          </p>
        </div>
      </div>
      

      
    <div class="ribbon-straight-box">

        
        
                <div class="ribbon-straight ribbon-straight-redirect">
                    <i class="mdi mdi-swap-horizontal"></i> &nbsp; Redirect
                </div>
            
                <div class="ribbon-straight ribbon-straight-callback">
                    <i class="mdi mdi-phone-incoming"></i> &nbsp; Callback
                </div>
            

    </div>





 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-71">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=71" title="View Details">
      
        <div class="ribbon-three ribbon-two-success"><span>Booked!</span></div>
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">Will the Calendar insert work?</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/08-26.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Indie Feature</span>
              
          </p>

          
          <p class="tao-card-company">
            Dave (Featured)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Annette Caton
              </span>
            
          
          </p>
        </div>
      </div>
      

      
    <div class="ribbon-straight-box">

        
        
                <div class="ribbon-straight ribbon-straight-redirect">
                    <i class="mdi mdi-swap-horizontal"></i> &nbsp; Redirect
                </div>
            
                <div class="ribbon-straight ribbon-straight-callback">
                    <i class="mdi mdi-phone-incoming"></i> &nbsp; Callback
                </div>
            

    </div>





 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-56">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=56" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">xg</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/08-17.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            VO 
                <br><span class="tao-card-subtitle">Audiobooks</span>
              
          </p>

          
          <p class="tao-card-company">
            x (Lead)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Arne Berggren
              </span>
            
          
          </p>
        </div>
      </div>
      

      
    <div class="ribbon-straight-box">

        
        
                <div class="ribbon-straight ribbon-straight-pin">
                    <i class="mdi mdi-map-marker"></i> &nbsp; Pin
                </div>
            

    </div>





 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-52">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=52" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">Blah</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/08-05.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Short</span>
              
          </p>

          
          <p class="tao-card-company">
            Magician (Lead)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Arne Berggren
              </span>
            
          
          </p>
        </div>
      </div>
      

      
    <div class="ribbon-straight-box">

        
        
                <div class="ribbon-straight ribbon-straight-pin">
                    <i class="mdi mdi-map-marker"></i> &nbsp; Pin
                </div>
            
                <div class="ribbon-straight ribbon-straight-redirect">
                    <i class="mdi mdi-swap-horizontal"></i> &nbsp; Redirect
                </div>
            

    </div>





 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-49">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=49" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">Another project</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/08-04.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            
          </p>

          
          <p class="tao-card-company">
            Test (Featured)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Ørjan Karlsen
              </span>
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-50">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=50" title="View Details">
      
        <div class="ribbon-three ribbon-two-success"><span>Booked!</span></div>
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">Broadway</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/08-04.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Theater 
                <br><span class="tao-card-subtitle">Off Broadway</span>
              
          </p>

          
          <p class="tao-card-company">
            Broad role (Chorus)
          </p>

          
          <p class="tao-card-contact">
            
          
          </p>
        </div>
      </div>
      

      
    <div class="ribbon-straight-box">

        
        
                <div class="ribbon-straight ribbon-straight-pin">
                    <i class="mdi mdi-map-marker"></i> &nbsp; Pin
                </div>
            
                <div class="ribbon-straight ribbon-straight-callback">
                    <i class="mdi mdi-phone-incoming"></i> &nbsp; Callback
                </div>
            

    </div>





 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-48">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=48" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">This is the project</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/08-02.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            
          </p>

          
          <p class="tao-card-company">
            Rolename (Featured)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Ørjan Karlsen
              </span>
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-47">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=47" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">Blah</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/07-30.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Indie Feature</span>
              
          </p>

          
          <p class="tao-card-company">
            Here (Dance Captain)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Robert Stone
              </span>
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-44">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=44" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">Another Calendar Test Project</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/07-29.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Reading</span>
              
          </p>

          
          <p class="tao-card-company">
            Kathy (Featured)
          </p>

          
          <p class="tao-card-contact">
            
          
          </p>
        </div>
      </div>
      

      
    <div class="ribbon-straight-box">

        
        
                <div class="ribbon-straight ribbon-straight-pin">
                    <i class="mdi mdi-map-marker"></i> &nbsp; Pin
                </div>
            
                <div class="ribbon-straight ribbon-straight-redirect">
                    <i class="mdi mdi-swap-horizontal"></i> &nbsp; Redirect
                </div>
            

    </div>





 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-45">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=45" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">Final calendar</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/07-29.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Theater 
                <br><span class="tao-card-subtitle">Off-off Broadway</span>
              
          </p>

          
          <p class="tao-card-company">
            test (Lead)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Lisa Smith
              </span>
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-43">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=43" title="View Details">
      
        <div class="ribbon-three ribbon-two-success"><span>Booked!</span></div>
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">Calendar Title</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/07-28.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Indie Feature</span>
              
          </p>

          
          <p class="tao-card-company">
            Steve (Background)
          </p>

          
          <p class="tao-card-contact">
            
          
          </p>
        </div>
      </div>
      

      
    <div class="ribbon-straight-box">

        
        
                <div class="ribbon-straight ribbon-straight-pin">
                    <i class="mdi mdi-map-marker"></i> &nbsp; Pin
                </div>
            
                <div class="ribbon-straight ribbon-straight-redirect">
                    <i class="mdi mdi-swap-horizontal"></i> &nbsp; Redirect
                </div>
            
                <div class="ribbon-straight ribbon-straight-callback">
                    <i class="mdi mdi-phone-incoming"></i> &nbsp; Callback
                </div>
            

    </div>





 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-41">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=41" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">test</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/07-27.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Other</span>
              
          </p>

          
          <p class="tao-card-company">
            test (Background)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                U-Shin Kim
              </span>
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-40">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=40" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">test</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/07-26.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Indie Feature</span>
              
          </p>

          
          <p class="tao-card-company">
            test (Stand-In)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Mary Vernieu
              </span>
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-29">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=29" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">test</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/07-22.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Theater 
                <br><span class="tao-card-subtitle">Regional</span>
              
          </p>

          
          <p class="tao-card-company">
            test (Chorus)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                U-Shin Kim
              </span>
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-30">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=30" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">test</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/07-15.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Theater 
                <br><span class="tao-card-subtitle">Regional</span>
              
          </p>

          
          <p class="tao-card-company">
            test (Chorus)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                U-Shin Kim
              </span>
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-32">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=32" title="View Details">
      
        <div class="ribbon-three ribbon-two-success"><span>Booked!</span></div>
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">test</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/07-15.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Reading</span>
              
          </p>

          
          <p class="tao-card-company">
            test (Lead)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Roya Dedeaux
              </span>
            
          
          </p>
        </div>
      </div>
      

      
    <div class="ribbon-straight-box">

        
        
                <div class="ribbon-straight ribbon-straight-pin">
                    <i class="mdi mdi-map-marker"></i> &nbsp; Pin
                </div>
            
                <div class="ribbon-straight ribbon-straight-redirect">
                    <i class="mdi mdi-swap-horizontal"></i> &nbsp; Redirect
                </div>
            
                <div class="ribbon-straight ribbon-straight-callback">
                    <i class="mdi mdi-phone-incoming"></i> &nbsp; Callback
                </div>
            

    </div>





 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-38">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=38" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">This better work</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/07-15.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Reading</span>
              
          </p>

          
          <p class="tao-card-company">
            test (Stand-In)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Roya Dedeaux
              </span>
            
          
          </p>
        </div>
      </div>
      

      
    <div class="ribbon-straight-box">

        
        
                <div class="ribbon-straight ribbon-straight-redirect">
                    <i class="mdi mdi-swap-horizontal"></i> &nbsp; Redirect
                </div>
            

    </div>





 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-39">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=39" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">Stranger Things</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/07-15.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Reading</span>
              
          </p>

          
          <p class="tao-card-company">
            Bill (Featured)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-clipboard-account has-content"></i>
                Mimi Mayer
              </span>
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-21">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=21" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">Zebra</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/07-01.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Studio Feature</span>
              
          </p>

          
          <p class="tao-card-company">
            Waitress (Lead)
          </p>

          
          <p class="tao-card-contact">
            
              <span class="contact-item">
                <i class="mdi mdi-pin has-content"></i>
                My Team
              </span>
            
          
          </p>
        </div>
      </div>
      

      
    <div class="ribbon-straight-box">

        
        
                <div class="ribbon-straight ribbon-straight-redirect">
                    <i class="mdi mdi-swap-horizontal"></i> &nbsp; Redirect
                </div>
            

    </div>





 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-22">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=22" title="View Details">
      
        <div class="ribbon-three ribbon-two-success"><span>Booked!</span></div>
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">Test</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/06-23.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Film 
                <br><span class="tao-card-subtitle">Studio Feature</span>
              
          </p>

          
          <p class="tao-card-company">
            New Role (Host)
          </p>

          
          <p class="tao-card-contact">
            
          
          </p>
        </div>
      </div>
      

      
    <div class="ribbon-straight-box">

        
        
                <div class="ribbon-straight ribbon-straight-redirect">
                    <i class="mdi mdi-swap-horizontal"></i> &nbsp; Redirect
                </div>
            

    </div>





 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-162">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=162" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">h</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/04-22.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Musical Theater 
                <br><span class="tao-card-subtitle">Cabaret</span>
              
          </p>

          
          <p class="tao-card-company">
            f (Chorus)
          </p>

          
          <p class="tao-card-contact">
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-164">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=164" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">h</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/04-22.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Musical Theater 
                <br><span class="tao-card-subtitle">Cabaret</span>
              
          </p>

          
          <p class="tao-card-company">
            f (Chorus)
          </p>

          
          <p class="tao-card-contact">
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    

                        
                <div class="col">

  
 
 
  
  <div class="col" id="card-166">

    <div class="tao-card-md ribbon-box">
      
      
      
        <a href="/app/audition/?audprojectid=166" title="View Details">
      
        <div class="tao-card-header tao-card-header-dark">

          
          
            <span class="tao-card-header-text">h</span>
          
        </div>
      

 
      
      <div class="tao-card-body">

        
          <div class="tao-card-image-container">
            <div class="tao-card-calendar">
              <img src="/media-abo/images/dates/04-22.png" alt="profile-image" class="tao-card-calendar">

              
              
                <div class="calendar-year">2022</div>
                
            </div>
          </div>
        

        
        <div class="tao-card-info-avatar">
          
          <p class="tao-card-title">
            Musical Theater 
                <br><span class="tao-card-subtitle">Cabaret</span>
              
          </p>

          
          <p class="tao-card-company">
            f (Chorus)
          </p>

          
          <p class="tao-card-contact">
            
          
          </p>
        </div>
      </div>
      

      




 
    </div>
    
     </a>
  </div>
  

</div>

                    <!-- " ---></TD></TD></TD></TH></TH></TH></TR></TR></TR></TABLE></TABLE></TABLE></A></ABBREV></ACRONYM></ADDRESS></APPLET></AU></B></BANNER></BIG></BLINK></BLOCKQUOTE></BQ></CAPTION></CENTER></CITE></CODE></COMMENT></DEL></DFN></DIR></DIV></DL></EM></FIG></FN></FONT></FORM></FRAME></FRAMESET></H1></H2></H3></H4></H5></H6></HEAD></I></INS></KBD></LISTING></MAP></MARQUEE></MENU></MULTICOL></NOBR></NOFRAMES></NOSCRIPT></NOTE></OL></P></PARAM></PERSON></PLAINTEXT></PRE></Q></S></SAMP></SCRIPT></SELECT></SMALL></STRIKE></STRONG></SUB></SUP></TABLE></TD></TEXTAREA></TH></TITLE></TR></TT></U></UL></VAR></WBR></XMP>

    <font face="arial"></font>

    

    	<html>
    		<head>
    			<title>Error Occurred While Processing Request</title>


    <script language="JavaScript">
    function showHide(targetName) {
        if( document.getElementById ) { // NS6+
            target = document.getElementById(targetName);
        } else if( document.all ) { // IE4+
            target = document.all[targetName];
        }

        if( target ) {
            if( target.style.display == "none" ) {
                target.style.display = "inline";
            } else {
                target.style.display = "none";
            }
        }
    }
    </script>


    	    </head>
    	<body>

    <font style="COLOR: black; FONT: 16pt/18pt verdana">
    	The web site you are accessing has experienced an unexpected error.<br>
		Please contact the website administrator.
		
    </font>
	<br><br>
    <table border="1" cellpadding="3" bordercolor="#000808" bgcolor="#e7e7e7">
    <tr>
        <td bgcolor="#000066">
            <font style="COLOR: white; FONT: 11pt/13pt verdana" color="white">
            The following information is meant for the website developer for debugging purposes. 
            </font>
        </td>
    <tr>
    <tr>
        <td bgcolor="#4646EE">
            <font style="COLOR: white; FONT: 11pt/13pt verdana" color="white">
            Error Occurred While Processing Request
            </font>
        </td>
    </tr>
    <tr>
        <td>
            <font style="COLOR: black; FONT: 8pt/11pt verdana">
    

The system has attempted to use an undefined value, which usually indicates
a programming error, either in your code or some system code. <p>

Null Pointers are another name for undefined values.



    <table width="500" cellpadding="0" cellspacing="0" border="0">
    <tr>
        <td id="tableProps2" align="left" valign="middle" width="500">
            <h1 id="textSection1" style="COLOR: black; FONT: 13pt/15pt verdana">
            
            </h1>
        </td>
    </tr>
    <tr>
        <td id="tablePropsWidth" width="400" colspan="2">
            <font style="COLOR: black; FONT: 8pt/11pt verdana">
            
            </font>
        </td>
    </tr>
    <tr>
        <td height>&nbsp;</td>
    </tr>

    
    <tr>
        <td colspan="2">
            <font style="COLOR: black; FONT: 8pt/11pt verdana">
            Resources:
            <ul>
	    
                 <li>Enable Robust Exception Information to provide greater detail about the source of errors.  In the Administrator, click Debugging & Logging > Debug Output Settings, and select the Robust Exception Information option.</li>
            
	<li>Check the <a href='http://www.adobe.com/go/prod_doc' target="new">ColdFusion documentation</a> to verify that you are using the correct syntax.</li>
	<li>Search the <a href='http://www.adobe.com/go/prod_support/' target="new">Knowledge Base</a> to find a solution to your problem.</li>

            </ul>
            <p>
        </td>
    </tr>
    
    <tr>
        <td colspan="2">
            <table border="0" cellpadding="0" cellspacing="0">
        	<tr>
        	    <td><font style="COLOR: black; FONT: 8pt/11pt verdana">Browser&nbsp;&nbsp;</td>
        		<td><font style="COLOR: black; FONT: 8pt/11pt verdana">Mozilla&#x2f;5.0 &#x28;Windows NT 10.0&#x3b; Win64&#x3b; x64&#x29; AppleWebKit&#x2f;537.36 &#x28;KHTML, like Gecko&#x29; Chrome&#x2f;134.0.0.0 Safari&#x2f;537.36</td>
        	</tr>
        	<tr>
        		<td><font style="COLOR: black; FONT: 8pt/11pt verdana">Remote Address&nbsp;&nbsp;</td>
        		<td><font style="COLOR: black; FONT: 8pt/11pt verdana">76.86.24.200</td>
        	</tr>
        	<tr>
        	    <td><font style="COLOR: black; FONT: 8pt/11pt verdana">Referrer&nbsp;&nbsp;</td>
        		<td><font style="COLOR: black; FONT: 8pt/11pt verdana">https&#x3a;&#x2f;&#x2f;app.theactorsoffice.com&#x2f;app&#x2f;auditions&#x2f;</td>
        	</tr>
        	<tr>
        	    <td><font style="COLOR: black; FONT: 8pt/11pt verdana">Date/Time&nbsp;&nbsp;</td>
        		<td><font style="COLOR: black; FONT: 8pt/11pt verdana">30-Mar-25 07:08 PM</td>
        	</tr>
            </table>
        </td>
    </tr>
    </table>
    
    
    </font>
        </td>
    </tr>
    </table>
    </body></html>

    
    