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
                        TAO
                    </a>
                </li>
                <li class="breadcrumb-item">
                    <a href="/app/#compDir#">
                        Calendar
                    </a>
                </li>
                <li class="breadcrumb-item active">
                    New Appointment
                </li>
            </ol>
        </div>

        <h4 class="page-title">
            New Appointment 
        </h4>
    </div>
</div>

                    </div>

                    

<style>
  #hidden_div {
    display: none;
  }
</style>



<div class="container">
  <div class="row">
    <div class="col-xl-6 col-lg-8 col-md-12">
      <div class="card">
    

        <div class="card-body">






            
                
                <form 
                    method="post" 
                    action="/include/appoint-add2.cfm" 
                    class="parsley-examples" 
                    name="event-form" 
                    id="form-event" 
                    data-parsley-excluded="input[type=button], input[type=submit], input[type=reset], input[type=hidden], [disabled], :hidden" 
                    data-parsley-trigger="keyup" 
                    data-parsley-validate>
                    
                        <input type="hidden" name="returnurl" value="calendar-appoint">
                        <input type="hidden" name="rcontactid" value="0">
                        <input type="hidden" name="userid" value="30">
                    
                    <div class="row">
                        <div class="col-12">
                            <div class="form-group">
                                <label class="control-label">Title<span class="text-danger">*</span></label>
                                <input 
                                    class="form-control" 
                                    autocomplete="off" 
                                    placeholder="Insert Appointment Title" 
                                    type="text" 
                                    name="eventTitle" 
                                    id="eventTitle" 
                                    data-parsley-minlength="3" 
                                    data-parsley-minlength-message="Min length 3 characters" 
                                    data-parsley-maxlength="200" 
                                    data-parsley-maxlength-message="Max length 200 characters" 
                                    data-parsley-required 
                                    data-parsley-error-message="Title is required" />
                            </div>
                        </div>

                        <script>
                            $(document).ready(function() {
                                $("#select-relationship").selectize({
                                    persist: false,
                                    createOnBlur: true,
                                    create: true,
                                    plugins: ["remove_button"],
                                    delimiter: ",",
                                    create: function(input) {
                                        return {
                                            value: input,
                                            text: input,
                                        };
                                    },
                                });
                            });
                        </script>

                        <div class="col-lg-12">
                            <div class="form-group mb-3">
                                <label for="select-relationship">Relationships<span class="text-danger">*</span></label>
                                <select 
                                    id="select-relationship" 
                                    name="relationships" 
                                    autocomplete="off" 
                                    multiple 
                                    required 
                                    data-parsley-required 
                                    data-parsley-error-message="Relationship is required" 
                                    class="demo-default selectize-close-btn" 
                                    style="width: 100%" 
                                    placeholder="Select a Relationship..." 
                                    value="">
                                    <option value="">Select a Relationship...</option>
                                    
                                            <option 
                                                value="131371" 
                                                >
                                                aaaaa
                                            </option>
                                        
                                            <option 
                                                value="131221" 
                                                >
                                                Andrew Orensteinsz
                                            </option>
                                        
                                            <option 
                                                value="131235" 
                                                >
                                                Andy Rovira
                                            </option>
                                        
                                            <option 
                                                value="131135" 
                                                >
                                                Angela Mickey
                                            </option>
                                        
                                            <option 
                                                value="131125" 
                                                >
                                                Ani Avetyan
                                            </option>
                                        
                                            <option 
                                                value="131239" 
                                                >
                                                Annie Burgstede
                                            </option>
                                        
                                            <option 
                                                value="131392" 
                                                >
                                                Another final
                                            </option>
                                        
                                            <option 
                                                value="131393" 
                                                >
                                                Another final
                                            </option>
                                        
                                            <option 
                                                value="131089" 
                                                >
                                                Anya Colloff
                                            </option>
                                        
                                            <option 
                                                value="131179" 
                                                >
                                                Austin Kolodney
                                            </option>
                                        
                                            <option 
                                                value="131181" 
                                                >
                                                Austin Winsberg
                                            </option>
                                        
                                            <option 
                                                value="131294" 
                                                >
                                                Babhs
                                            </option>
                                        
                                            <option 
                                                value="131389" 
                                                >
                                                bah new
                                            </option>
                                        
                                            <option 
                                                value="131058" 
                                                >
                                                Barbara Fiorentino
                                            </option>
                                        
                                            <option 
                                                value="131075" 
                                                >
                                                Barbara McCarthy
                                            </option>
                                        
                                            <option 
                                                value="131083" 
                                                >
                                                Barbara Stordahl
                                            </option>
                                        
                                            <option 
                                                value="131080" 
                                                >
                                                Barbie Block
                                            </option>
                                        
                                            <option 
                                                value="131130" 
                                                >
                                                Barden/Schnee Casting
                                            </option>
                                        
                                            <option 
                                                value="131219" 
                                                >
                                                Barry Safchik
                                            </option>
                                        
                                            <option 
                                                value="131402" 
                                                >
                                                Bill Blah
                                            </option>
                                        
                                            <option 
                                                value="131189" 
                                                >
                                                Bill Wrubel
                                            </option>
                                        
                                            <option 
                                                value="131387" 
                                                >
                                                Billey Something
                                            </option>
                                        
                                            <option 
                                                value="131323" 
                                                >
                                                blachdffff
                                            </option>
                                        
                                            <option 
                                                value="131366" 
                                                >
                                                blad
                                            </option>
                                        
                                            <option 
                                                value="131353" 
                                                >
                                                blah
                                            </option>
                                        
                                            <option 
                                                value="131367" 
                                                >
                                                blah
                                            </option>
                                        
                                            <option 
                                                value="131319" 
                                                >
                                                BLAHBLAH
                                            </option>
                                        
                                            <option 
                                                value="131403" 
                                                >
                                                Blaine smith
                                            </option>
                                        
                                            <option 
                                                value="131404" 
                                                >
                                                Blaine smith
                                            </option>
                                        
                                            <option 
                                                value="131405" 
                                                >
                                                Blaine smith
                                            </option>
                                        
                                            <option 
                                                value="131406" 
                                                >
                                                Blaine smith
                                            </option>
                                        
                                            <option 
                                                value="131407" 
                                                >
                                                Blaine smith
                                            </option>
                                        
                                            <option 
                                                value="131408" 
                                                >
                                                Blaine smith
                                            </option>
                                        
                                            <option 
                                                value="131409" 
                                                >
                                                Blaine smith
                                            </option>
                                        
                                            <option 
                                                value="131379" 
                                                >
                                                Blake Snyder
                                            </option>
                                        
                                            <option 
                                                value="131360" 
                                                >
                                                Blocky Block
                                            </option>
                                        
                                            <option 
                                                value="131147" 
                                                >
                                                Bob Cline
                                            </option>
                                        
                                            <option 
                                                value="131222" 
                                                >
                                                Bob Kushell
                                            </option>
                                        
                                            <option 
                                                value="131331" 
                                                >
                                                Bobbbob
                                            </option>
                                        
                                            <option 
                                                value="131398" 
                                                >
                                                Brad Whacker
                                            </option>
                                        
                                            <option 
                                                value="131201" 
                                                >
                                                Brandon Henry Rodriguez
                                            </option>
                                        
                                            <option 
                                                value="131074" 
                                                >
                                                Brett Greenstein
                                            </option>
                                        
                                            <option 
                                                value="131134" 
                                                >
                                                Brette Goldstein
                                            </option>
                                        
                                            <option 
                                                value="131293" 
                                                >
                                                Brook Casting
                                            </option>
                                        
                                            <option 
                                                value="131180" 
                                                >
                                                Brooke Palmieri
                                            </option>
                                        
                                            <option 
                                                value="131129" 
                                                >
                                                Cara Chute Rosenbaum
                                            </option>
                                        
                                            <option 
                                                value="131098" 
                                                >
                                                Caroline Liem
                                            </option>
                                        
                                            <option 
                                                value="131167" 
                                                >
                                                Chelsea Ellis Boch
                                            </option>
                                        
                                            <option 
                                                value="131056" 
                                                >
                                                Chris Gehrt
                                            </option>
                                        
                                            <option 
                                                value="131118" 
                                                >
                                                Christine Ciraolo Terry
                                            </option>
                                        
                                            <option 
                                                value="131162" 
                                                >
                                                Christine Kromer
                                            </option>
                                        
                                            <option 
                                                value="131187" 
                                                >
                                                Christopher Lloyd
                                            </option>
                                        
                                            <option 
                                                value="131163" 
                                                >
                                                Clin ALexander
                                            </option>
                                        
                                            <option 
                                                value="131191" 
                                                >
                                                Collin Daniel
                                            </option>
                                        
                                            <option 
                                                value="131227" 
                                                >
                                                Curtis Clarke
                                            </option>
                                        
                                            <option 
                                                value="131246" 
                                                >
                                                Dani Markowitz
                                            </option>
                                        
                                            <option 
                                                value="131192" 
                                                >
                                                Danny Dunitz
                                            </option>
                                        
                                            <option 
                                                value="131183" 
                                                >
                                                Dave Caplan
                                            </option>
                                        
                                            <option 
                                                value="131212" 
                                                >
                                                David Groom
                                            </option>
                                        
                                            <option 
                                                value="131223" 
                                                >
                                                David Maples
                                            </option>
                                        
                                            <option 
                                                value="131111" 
                                                >
                                                Debi Manwiller
                                            </option>
                                        
                                            <option 
                                                value="131124" 
                                                >
                                                DeeDee Bradley
                                            </option>
                                        
                                            <option 
                                                value="131060" 
                                                >
                                                Demetria Dixon
                                            </option>
                                        
                                            <option 
                                                value="131224" 
                                                >
                                                Denise Moss
                                            </option>
                                        
                                            <option 
                                                value="131197" 
                                                >
                                                Djinous Rowling
                                            </option>
                                        
                                            <option 
                                                value="131245" 
                                                >
                                                Dohn Norwood
                                            </option>
                                        
                                            <option 
                                                value="131076" 
                                                >
                                                Dominika Posseren
                                            </option>
                                        
                                            <option 
                                                value="131185" 
                                                >
                                                Eduardo Cisneros
                                            </option>
                                        
                                            <option 
                                                value="131194" 
                                                >
                                                Elizabeth Barnes
                                            </option>
                                        
                                            <option 
                                                value="131152" 
                                                >
                                                Eric Woodall
                                            </option>
                                        
                                            <option 
                                                value="131127" 
                                                >
                                                Erica Bream
                                            </option>
                                        
                                            <option 
                                                value="131141" 
                                                >
                                                Erica Jensen
                                            </option>
                                        
                                            <option 
                                                value="131133" 
                                                >
                                                Erica Palgon
                                            </option>
                                        
                                            <option 
                                                value="131079" 
                                                >
                                                Eyde Belasco
                                            </option>
                                        
                                            <option 
                                                value="131198" 
                                                >
                                                Faryn Einhorn
                                            </option>
                                        
                                            <option 
                                                value="131394" 
                                                >
                                                final please
                                            </option>
                                        
                                            <option 
                                                value="131395" 
                                                >
                                                final please
                                            </option>
                                        
                                            <option 
                                                value="131384" 
                                                >
                                                Finally works
                                            </option>
                                        
                                            <option 
                                                value="131313" 
                                                >
                                                Finalone
                                            </option>
                                        
                                            <option 
                                                value="131312" 
                                                >
                                                First  One
                                            </option>
                                        
                                            <option 
                                                value="131095" 
                                                >
                                                Francine Selkirk
                                            </option>
                                        
                                            <option 
                                                value="131339" 
                                                >
                                                Frankie Smithy
                                            </option>
                                        
                                            <option 
                                                value="131292" 
                                                >
                                                Fullname Test
                                            </option>
                                        
                                            <option 
                                                value="131169" 
                                                >
                                                Gail Mancuso
                                            </option>
                                        
                                            <option 
                                                value="131150" 
                                                >
                                                Gayle Seay
                                            </option>
                                        
                                            <option 
                                                value="131052" 
                                                >
                                                George Henry
                                            </option>
                                        
                                            <option 
                                                value="131300" 
                                                >
                                                Georgest Henrys
                                            </option>
                                        
                                            <option 
                                                value="131255" 
                                                >
                                                Geosrge Henry
                                            </option>
                                        
                                            <option 
                                                value="131067" 
                                                >
                                                Geralyn Flood
                                            </option>
                                        
                                            <option 
                                                value="131207" 
                                                >
                                                Gerry Pass
                                            </option>
                                        
                                            <option 
                                                value="131354" 
                                                >
                                                gggg
                                            </option>
                                        
                                            <option 
                                                value="131072" 
                                                >
                                                Gina Gallego
                                            </option>
                                        
                                            <option 
                                                value="131400" 
                                                >
                                                Gina Gbur
                                            </option>
                                        
                                            <option 
                                                value="131401" 
                                                >
                                                Gina Gbur
                                            </option>
                                        
                                            <option 
                                                value="131176" 
                                                >
                                                Grace Moss
                                            </option>
                                        
                                            <option 
                                                value="131093" 
                                                >
                                                Greg Salmon
                                            </option>
                                        
                                            <option 
                                                value="131358" 
                                                >
                                                Hack Hack
                                            </option>
                                        
                                            <option 
                                                value="131232" 
                                                >
                                                Harry Kakatsakis
                                            </option>
                                        
                                            <option 
                                                value="130889" 
                                                >
                                                Harry Smith
                                            </option>
                                        
                                            <option 
                                                value="131100" 
                                                >
                                                Heidi Levitt
                                            </option>
                                        
                                            <option 
                                                value="131390" 
                                                >
                                                Helper helpie
                                            </option>
                                        
                                            <option 
                                                value="131334" 
                                                >
                                                herewego again
                                            </option>
                                        
                                            <option 
                                                value="131343" 
                                                >
                                                hhdhdf
                                            </option>
                                        
                                            <option 
                                                value="131376" 
                                                >
                                                hhh
                                            </option>
                                        
                                            <option 
                                                value="131377" 
                                                >
                                                hhh
                                            </option>
                                        
                                            <option 
                                                value="131378" 
                                                >
                                                hhh
                                            </option>
                                        
                                            <option 
                                                value="131308" 
                                                >
                                                hhhhh
                                            </option>
                                        
                                            <option 
                                                value="131078" 
                                                >
                                                Howard Meltzer
                                            </option>
                                        
                                            <option 
                                                value="131228" 
                                                >
                                                Howie Gold
                                            </option>
                                        
                                            <option 
                                                value="131149" 
                                                >
                                                Jack Doulin
                                            </option>
                                        
                                            <option 
                                                value="131062" 
                                                >
                                                Jaimie Beebe
                                            </option>
                                        
                                            <option 
                                                value="131104" 
                                                >
                                                Jaimie Gallagher
                                            </option>
                                        
                                            <option 
                                                value="131178" 
                                                >
                                                Jake Orthwein
                                            </option>
                                        
                                            <option 
                                                value="131140" 
                                                >
                                                James Calleri
                                            </option>
                                        
                                            <option 
                                                value="131114" 
                                                >
                                                Jami Rudofsky
                                            </option>
                                        
                                            <option 
                                                value="131154" 
                                                >
                                                Jamibeth Margolis
                                            </option>
                                        
                                            <option 
                                                value="131120" 
                                                >
                                                Jamie Castro
                                            </option>
                                        
                                            <option 
                                                value="131241" 
                                                >
                                                Janae Bakken
                                            </option>
                                        
                                            <option 
                                                value="131217" 
                                                >
                                                Jandiz Cardoso
                                            </option>
                                        
                                            <option 
                                                value="131199" 
                                                >
                                                Jane Flowers
                                            </option>
                                        
                                            <option 
                                                value="131363" 
                                                >
                                                Jason Company
                                            </option>
                                        
                                            <option 
                                                value="131109" 
                                                >
                                                Jason Stamey
                                            </option>
                                        
                                            <option 
                                                value="131131" 
                                                >
                                                Jeff Greenberg
                                            </option>
                                        
                                            <option 
                                                value="131200" 
                                                >
                                                Jeff Hardwick
                                            </option>
                                        
                                            <option 
                                                value="131190" 
                                                >
                                                Jeff Morton
                                            </option>
                                        
                                            <option 
                                                value="131128" 
                                                >
                                                Jennifer Brooks
                                            </option>
                                        
                                            <option 
                                                value="131073" 
                                                >
                                                Jennifer K.M. Treadwell
                                            </option>
                                        
                                            <option 
                                                value="131136" 
                                                >
                                                Jennifer Peralta-Ajemian
                                            </option>
                                        
                                            <option 
                                                value="131102" 
                                                >
                                                Jeremy Gordon
                                            </option>
                                        
                                            <option 
                                                value="131193" 
                                                >
                                                Jeremy O'Keefe
                                            </option>
                                        
                                            <option 
                                                value="131351" 
                                                >
                                                Jery fll
                                            </option>
                                        
                                            <option 
                                                value="131146" 
                                                >
                                                Jessica Daniels
                                            </option>
                                        
                                            <option 
                                                value="131215" 
                                                >
                                                Jill Hoppenheim
                                            </option>
                                        
                                            <option 
                                                value="131233" 
                                                >
                                                Jim Cushinery
                                            </option>
                                        
                                            <option 
                                                value="131206" 
                                                >
                                                JJ Rubin
                                            </option>
                                        
                                            <option 
                                                value="131333" 
                                                >
                                                Joan Smiath
                                            </option>
                                        
                                            <option 
                                                value="131305" 
                                                >
                                                Jodie Bentley
                                            </option>
                                        
                                            <option 
                                                value="131065" 
                                                >
                                                Joey Paul Jensen
                                            </option>
                                        
                                            <option 
                                                value="130998" 
                                                >
                                                John Bridges
                                            </option>
                                        
                                            <option 
                                                value="130991" 
                                                >
                                                John Sample
                                            </option>
                                        
                                            <option 
                                                value="131359" 
                                                >
                                                John Smith
                                            </option>
                                        
                                            <option 
                                                value="130648" 
                                                >
                                                John Smith
                                            </option>
                                        
                                            <option 
                                                value="130975" 
                                                >
                                                John Smith
                                            </option>
                                        
                                            <option 
                                                value="131174" 
                                                >
                                                Jon Cvack
                                            </option>
                                        
                                            <option 
                                                value="131257" 
                                                >
                                                Jon Majors
                                            </option>
                                        
                                            <option 
                                                value="131258" 
                                                >
                                                Jon Majors
                                            </option>
                                        
                                            <option 
                                                value="131259" 
                                                >
                                                Jon Majors
                                            </option>
                                        
                                            <option 
                                                value="131260" 
                                                >
                                                Jon Majors
                                            </option>
                                        
                                            <option 
                                                value="131261" 
                                                >
                                                Jon Majors
                                            </option>
                                        
                                            <option 
                                                value="131262" 
                                                >
                                                Jon Majors
                                            </option>
                                        
                                            <option 
                                                value="131263" 
                                                >
                                                Jon Majors
                                            </option>
                                        
                                            <option 
                                                value="131264" 
                                                >
                                                Jon Majors
                                            </option>
                                        
                                            <option 
                                                value="131265" 
                                                >
                                                Jon Majors
                                            </option>
                                        
                                            <option 
                                                value="131266" 
                                                >
                                                Jon Majors
                                            </option>
                                        
                                            <option 
                                                value="131267" 
                                                >
                                                Jon Majors
                                            </option>
                                        
                                            <option 
                                                value="131268" 
                                                >
                                                Jon Majors
                                            </option>
                                        
                                            <option 
                                                value="131269" 
                                                >
                                                Jon Majors
                                            </option>
                                        
                                            <option 
                                                value="131270" 
                                                >
                                                Jon Majors
                                            </option>
                                        
                                            <option 
                                                value="131271" 
                                                >
                                                Jon Majors
                                            </option>
                                        
                                            <option 
                                                value="131272" 
                                                >
                                                Jon Majors
                                            </option>
                                        
                                            <option 
                                                value="131273" 
                                                >
                                                Jon Majors
                                            </option>
                                        
                                            <option 
                                                value="131274" 
                                                >
                                                Jon Majors
                                            </option>
                                        
                                            <option 
                                                value="131275" 
                                                >
                                                Jon Majors
                                            </option>
                                        
                                            <option 
                                                value="131276" 
                                                >
                                                Jon Majors
                                            </option>
                                        
                                            <option 
                                                value="131277" 
                                                >
                                                Jon Majors
                                            </option>
                                        
                                            <option 
                                                value="131278" 
                                                >
                                                Jon Majors
                                            </option>
                                        
                                            <option 
                                                value="131279" 
                                                >
                                                Jon Majors
                                            </option>
                                        
                                            <option 
                                                value="131280" 
                                                >
                                                Jon Majors
                                            </option>
                                        
                                            <option 
                                                value="131281" 
                                                >
                                                Jon Majors
                                            </option>
                                        
                                            <option 
                                                value="131282" 
                                                >
                                                Jon Majors
                                            </option>
                                        
                                            <option 
                                                value="131283" 
                                                >
                                                Jon Majors
                                            </option>
                                        
                                            <option 
                                                value="131288" 
                                                >
                                                Jon Majors
                                            </option>
                                        
                                            <option 
                                                value="131225" 
                                                >
                                                Jonathan Prince
                                            </option>
                                        
                                            <option 
                                                value="131159" 
                                                >
                                                Jonathan Strauss
                                            </option>
                                        
                                            <option 
                                                value="131110" 
                                                >
                                                Jordan Bass
                                            </option>
                                        
                                            <option 
                                                value="131070" 
                                                >
                                                Josh Ropiequet
                                            </option>
                                        
                                            <option 
                                                value="130952" 
                                                >
                                                Joyful Progress
                                            </option>
                                        
                                            <option 
                                                value="131137" 
                                                >
                                                Judy Bowman
                                            </option>
                                        
                                            <option 
                                                value="131143" 
                                                >
                                                Judy Henderson
                                            </option>
                                        
                                            <option 
                                                value="131101" 
                                                >
                                                Julie Gale
                                            </option>
                                        
                                            <option 
                                                value="131055" 
                                                >
                                                Kam Wilson
                                            </option>
                                        
                                            <option 
                                                value="131237" 
                                                >
                                                Kamran Pasha
                                            </option>
                                        
                                            <option 
                                                value="131105" 
                                                >
                                                Kara Sullivan
                                            </option>
                                        
                                            <option 
                                                value="131057" 
                                                >
                                                Karina Walters
                                            </option>
                                        
                                            <option 
                                                value="131112" 
                                                >
                                                Kate Caldwell
                                            </option>
                                        
                                            <option 
                                                value="131240" 
                                                >
                                                Kate Duffy
                                            </option>
                                        
                                            <option 
                                                value="131144" 
                                                >
                                                Kate Geller
                                            </option>
                                        
                                            <option 
                                                value="131115" 
                                                >
                                                Kendra Castleberry
                                            </option>
                                        
                                            <option 
                                                value="130730" 
                                                >
                                                Kevin King
                                            </option>
                                        
                                            <option 
                                                value="131306" 
                                                >
                                                Kevin King
                                            </option>
                                        
                                            <option 
                                                value="131145" 
                                                >
                                                Kevin Kuffa
                                            </option>
                                        
                                            <option 
                                                value="131316" 
                                                >
                                                Kevin L King
                                            </option>
                                        
                                            <option 
                                                value="131355" 
                                                >
                                                Kevin L Kinggg
                                            </option>
                                        
                                            <option 
                                                value="130996" 
                                                >
                                                Kevin Mayndard
                                            </option>
                                        
                                            <option 
                                                value="131039" 
                                                >
                                                Keving Kingg
                                            </option>
                                        
                                            <option 
                                                value="131043" 
                                                >
                                                Kevins Kings
                                            </option>
                                        
                                            <option 
                                                value="131045" 
                                                >
                                                Kevins Kings
                                            </option>
                                        
                                            <option 
                                                value="131085" 
                                                >
                                                Kim Davis-Wagner
                                            </option>
                                        
                                            <option 
                                                value="131142" 
                                                >
                                                Kimberly Graham
                                            </option>
                                        
                                            <option 
                                                value="131177" 
                                                >
                                                Kimberly Jentzen
                                            </option>
                                        
                                            <option 
                                                value="131368" 
                                                >
                                                kkkkkk
                                            </option>
                                        
                                            <option 
                                                value="131369" 
                                                >
                                                kkkkkk
                                            </option>
                                        
                                            <option 
                                                value="131370" 
                                                >
                                                kkkkkk
                                            </option>
                                        
                                            <option 
                                                value="131106" 
                                                >
                                                Kristi Lugo
                                            </option>
                                        
                                            <option 
                                                value="131208" 
                                                >
                                                Kristofer McNeeley
                                            </option>
                                        
                                            <option 
                                                value="131054" 
                                                >
                                                Krystal O'Conner
                                            </option>
                                        
                                            <option 
                                                value="131071" 
                                                >
                                                Krystal OConnor
                                            </option>
                                        
                                            <option 
                                                value="131399" 
                                                >
                                                Kyle farbach
                                            </option>
                                        
                                            <option 
                                                value="131388" 
                                                >
                                                Kyle Newnie
                                            </option>
                                        
                                            <option 
                                                value="131107" 
                                                >
                                                Leslee Feldman
                                            </option>
                                        
                                            <option 
                                                value="131123" 
                                                >
                                                Lindsay Jameyson
                                            </option>
                                        
                                            <option 
                                                value="131077" 
                                                >
                                                Lisa Beach
                                            </option>
                                        
                                            <option 
                                                value="131116" 
                                                >
                                                Lisa Zambetti
                                            </option>
                                        
                                            <option 
                                                value="131117" 
                                                >
                                                Lordan Napoli
                                            </option>
                                        
                                            <option 
                                                value="131352" 
                                                >
                                                Louu ff
                                            </option>
                                        
                                            <option 
                                                value="131391" 
                                                >
                                                Lucy Gatz
                                            </option>
                                        
                                            <option 
                                                value="131186" 
                                                >
                                                Madeleine Sherak
                                            </option>
                                        
                                            <option 
                                                value="131236" 
                                                >
                                                Maggie Bandur
                                            </option>
                                        
                                            <option 
                                                value="130878" 
                                                >
                                                Maintenance Test
                                            </option>
                                        
                                            <option 
                                                value="131161" 
                                                >
                                                Marci Phillips
                                            </option>
                                        
                                            <option 
                                                value="131040" 
                                                >
                                                Marietta Putignano
                                            </option>
                                        
                                            <option 
                                                value="131317" 
                                                >
                                                Marietta Putignano
                                            </option>
                                        
                                            <option 
                                                value="131320" 
                                                >
                                                Marietta Putignanos
                                            </option>
                                        
                                            <option 
                                                value="130978" 
                                                >
                                                Mariettas Putignanos
                                            </option>
                                        
                                            <option 
                                                value="131284" 
                                                >
                                                Mariettas Putignanos
                                            </option>
                                        
                                            <option 
                                                value="131285" 
                                                >
                                                Mariettas Putignanos
                                            </option>
                                        
                                            <option 
                                                value="131286" 
                                                >
                                                Mariettas Putignanos
                                            </option>
                                        
                                            <option 
                                                value="131289" 
                                                >
                                                Mariettas Putignanos
                                            </option>
                                        
                                            <option 
                                                value="131290" 
                                                >
                                                Mariettas Putignanos
                                            </option>
                                        
                                            <option 
                                                value="131291" 
                                                >
                                                Mariettas Putignanos
                                            </option>
                                        
                                            <option 
                                                value="131047" 
                                                >
                                                Mariettas Putignanos
                                            </option>
                                        
                                            <option 
                                                value="131049" 
                                                >
                                                Mariettas Putignanoz
                                            </option>
                                        
                                            <option 
                                                value="131184" 
                                                >
                                                Mark B Perry
                                            </option>
                                        
                                            <option 
                                                value="131248" 
                                                >
                                                Mark Millner
                                            </option>
                                        
                                            <option 
                                                value="131242" 
                                                >
                                                Marlana Hope
                                            </option>
                                        
                                            <option 
                                                value="131210" 
                                                >
                                                Martine Meloul
                                            </option>
                                        
                                            <option 
                                                value="131204" 
                                                >
                                                Meg Morman
                                            </option>
                                        
                                            <option 
                                                value="131113" 
                                                >
                                                Melissa Kostenbauder
                                            </option>
                                        
                                            <option 
                                                value="131119" 
                                                >
                                                Meredith Fordney
                                            </option>
                                        
                                            <option 
                                                value="131155" 
                                                >
                                                Michael Cassara
                                            </option>
                                        
                                            <option 
                                                value="131088" 
                                                >
                                                Michael Nicolo
                                            </option>
                                        
                                            <option 
                                                value="131220" 
                                                >
                                                Michael Platt
                                            </option>
                                        
                                            <option 
                                                value="131234" 
                                                >
                                                Mickey Levy
                                            </option>
                                        
                                            <option 
                                                value="131209" 
                                                >
                                                Mike Elliott
                                            </option>
                                        
                                            <option 
                                                value="131122" 
                                                >
                                                Morgan Redfield Smith
                                            </option>
                                        
                                            <option 
                                                value="131182" 
                                                >
                                                Nat Bernstein
                                            </option>
                                        
                                            <option 
                                                value="131327" 
                                                >
                                                New CD
                                            </option>
                                        
                                            <option 
                                                value="131357" 
                                                >
                                                new comp
                                            </option>
                                        
                                            <option 
                                                value="131329" 
                                                >
                                                Newbie newone
                                            </option>
                                        
                                            <option 
                                                value="131256" 
                                                >
                                                newbie newton
                                            </option>
                                        
                                            <option 
                                                value="131314" 
                                                >
                                                Newbie Newville
                                            </option>
                                        
                                            <option 
                                                value="131372" 
                                                >
                                                Newcompanys
                                            </option>
                                        
                                            <option 
                                                value="131410" 
                                                >
                                                Newerish COntacft
                                            </option>
                                        
                                            <option 
                                                value="131299" 
                                                >
                                                Newest Newer
                                            </option>
                                        
                                            <option 
                                                value="131042" 
                                                >
                                                Newguy Flanders
                                            </option>
                                        
                                            <option 
                                                value="131000" 
                                                >
                                                Newguy ForAudition
                                            </option>
                                        
                                            <option 
                                                value="131090" 
                                                >
                                                Nickole Doro
                                            </option>
                                        
                                            <option 
                                                value="131064" 
                                                >
                                                Niner Parikh
                                            </option>
                                        
                                            <option 
                                                value="131001" 
                                                >
                                                Noob newer
                                            </option>
                                        
                                            <option 
                                                value="131336" 
                                                >
                                                notag
                                            </option>
                                        
                                            <option 
                                                value="131373" 
                                                >
                                                Olycomp
                                            </option>
                                        
                                            <option 
                                                value="131374" 
                                                >
                                                Olycomp
                                            </option>
                                        
                                            <option 
                                                value="131375" 
                                                >
                                                Olycomp
                                            </option>
                                        
                                            <option 
                                                value="131096" 
                                                >
                                                Pam Dixon
                                            </option>
                                        
                                            <option 
                                                value="131175" 
                                                >
                                                Parisa Barani
                                            </option>
                                        
                                            <option 
                                                value="131139" 
                                                >
                                                Pat McCorkle
                                            </option>
                                        
                                            <option 
                                                value="131157" 
                                                >
                                                Patrick Goodwin
                                            </option>
                                        
                                            <option 
                                                value="131350" 
                                                >
                                                Paul Bralderbass
                                            </option>
                                        
                                            <option 
                                                value="131148" 
                                                >
                                                Paul Hardt
                                            </option>
                                        
                                            <option 
                                                value="131244" 
                                                >
                                                Paul Kim
                                            </option>
                                        
                                            <option 
                                                value="131097" 
                                                >
                                                Paul Weber
                                            </option>
                                        
                                            <option 
                                                value="131160" 
                                                >
                                                Philip Huffman
                                            </option>
                                        
                                            <option 
                                                value="131213" 
                                                >
                                                Quayshaun Carter
                                            </option>
                                        
                                            <option 
                                                value="131156" 
                                                >
                                                Rachel Hoffman
                                            </option>
                                        
                                            <option 
                                                value="131082" 
                                                >
                                                Ramani Leah
                                            </option>
                                        
                                            <option 
                                                value="131202" 
                                                >
                                                Ray Tezanos
                                            </option>
                                        
                                            <option 
                                                value="131066" 
                                                >
                                                Ricki Maslar
                                            </option>
                                        
                                            <option 
                                                value="131165" 
                                                >
                                                Rob Decina
                                            </option>
                                        
                                            <option 
                                                value="131229" 
                                                >
                                                Roger Wolfson
                                            </option>
                                        
                                            <option 
                                                value="131099" 
                                                >
                                                Ronnie Yeskel
                                            </option>
                                        
                                            <option 
                                                value="131087" 
                                                >
                                                Rose Bochner
                                            </option>
                                        
                                            <option 
                                                value="131158" 
                                                >
                                                Ross Meyerson
                                            </option>
                                        
                                            <option 
                                                value="131166" 
                                                >
                                                Russell Boast
                                            </option>
                                        
                                            <option 
                                                value="131172" 
                                                >
                                                Ryan Hunter Phillips
                                            </option>
                                        
                                            <option 
                                                value="131214" 
                                                >
                                                Ryan Locke
                                            </option>
                                        
                                            <option 
                                                value="131205" 
                                                >
                                                Ryan Morris
                                            </option>
                                        
                                            <option 
                                                value="130892" 
                                                >
                                                S test
                                            </option>
                                        
                                            <option 
                                                value="131081" 
                                                >
                                                Sally Stiner
                                            </option>
                                        
                                            <option 
                                                value="130974" 
                                                >
                                                Sample Samples
                                            </option>
                                        
                                            <option 
                                                value="130888" 
                                                >
                                                Sanra oh
                                            </option>
                                        
                                            <option 
                                                value="131103" 
                                                >
                                                Sara Wallace
                                            </option>
                                        
                                            <option 
                                                value="131061" 
                                                >
                                                Sarah Effinger
                                            </option>
                                        
                                            <option 
                                                value="131121" 
                                                >
                                                Scott David
                                            </option>
                                        
                                            <option 
                                                value="131151" 
                                                >
                                                Scott Wojcik
                                            </option>
                                        
                                            <option 
                                                value="131084" 
                                                >
                                                Scotty Mullen
                                            </option>
                                        
                                            <option 
                                                value="131231" 
                                                >
                                                Shani Am Moore
                                            </option>
                                        
                                            <option 
                                                value="131091" 
                                                >
                                                Shayna Sherwood
                                            </option>
                                        
                                            <option 
                                                value="131126" 
                                                >
                                                Sierra Scott
                                            </option>
                                        
                                            <option 
                                                value="131218" 
                                                >
                                                SJ Hodges
                                            </option>
                                        
                                            <option 
                                                value="131050" 
                                                >
                                                somebody new
                                            </option>
                                        
                                            <option 
                                                value="131396" 
                                                >
                                                Something wrong
                                            </option>
                                        
                                            <option 
                                                value="131307" 
                                                >
                                                st
                                            </option>
                                        
                                            <option 
                                                value="131196" 
                                                >
                                                Stacey Levy
                                            </option>
                                        
                                            <option 
                                                value="131226" 
                                                >
                                                Stanley Kalu
                                            </option>
                                        
                                            <option 
                                                value="131138" 
                                                >
                                                Stephanie Klapper
                                            </option>
                                        
                                            <option 
                                                value="131132" 
                                                >
                                                Stephen DeAngelis
                                            </option>
                                        
                                            <option 
                                                value="130979" 
                                                >
                                                Steve BBBB
                                            </option>
                                        
                                            <option 
                                                value="130997" 
                                                >
                                                Steve Billis
                                            </option>
                                        
                                            <option 
                                                value="131397" 
                                                >
                                                Steve butthole
                                            </option>
                                        
                                            <option 
                                                value="131173" 
                                                >
                                                Steve Hanneman
                                            </option>
                                        
                                            <option 
                                                value="131063" 
                                                >
                                                Steve Maisel
                                            </option>
                                        
                                            <option 
                                                value="131310" 
                                                >
                                                steve winwood
                                            </option>
                                        
                                            <option 
                                                value="131044" 
                                                >
                                                Steven Hodsford
                                            </option>
                                        
                                            <option 
                                                value="131188" 
                                                >
                                                Steven Levitan
                                            </option>
                                        
                                            <option 
                                                value="131059" 
                                                >
                                                Steven Tyler O'Connor
                                            </option>
                                        
                                            <option 
                                                value="131203" 
                                                >
                                                Sunday Boling
                                            </option>
                                        
                                            <option 
                                                value="131247" 
                                                >
                                                Sutton Dewey
                                            </option>
                                        
                                            <option 
                                                value="131086" 
                                                >
                                                Suzanne Goddard-Smythe
                                            </option>
                                        
                                            <option 
                                                value="130922" 
                                                >
                                                Sylvia Bentley
                                            </option>
                                        
                                            <option 
                                                value="131195" 
                                                >
                                                Tawnya Tamiletti
                                            </option>
                                        
                                            <option 
                                                value="131318" 
                                                >
                                                Te
                                            </option>
                                        
                                            <option 
                                                value="131094" 
                                                >
                                                Terry Berland
                                            </option>
                                        
                                            <option 
                                                value="131362" 
                                                >
                                                Test
                                            </option>
                                        
                                            <option 
                                                value="131295" 
                                                >
                                                test
                                            </option>
                                        
                                            <option 
                                                value="131315" 
                                                >
                                                test
                                            </option>
                                        
                                            <option 
                                                value="131321" 
                                                >
                                                test
                                            </option>
                                        
                                            <option 
                                                value="131322" 
                                                >
                                                Test
                                            </option>
                                        
                                            <option 
                                                value="131383" 
                                                >
                                                test baa
                                            </option>
                                        
                                            <option 
                                                value="130970" 
                                                >
                                                Test ff
                                            </option>
                                        
                                            <option 
                                                value="130971" 
                                                >
                                                Test ff
                                            </option>
                                        
                                            <option 
                                                value="130972" 
                                                >
                                                Test ff
                                            </option>
                                        
                                            <option 
                                                value="130882" 
                                                >
                                                test testes
                                            </option>
                                        
                                            <option 
                                                value="130907" 
                                                >
                                                Test unique
                                            </option>
                                        
                                            <option 
                                                value="131311" 
                                                >
                                                test1
                                            </option>
                                        
                                            <option 
                                                value="130887" 
                                                >
                                                Tester tester
                                            </option>
                                        
                                            <option 
                                                value="131361" 
                                                >
                                                tests
                                            </option>
                                        
                                            <option 
                                                value="130880" 
                                                >
                                                Third Test
                                            </option>
                                        
                                            <option 
                                                value="131385" 
                                                >
                                                This finally should worrk
                                            </option>
                                        
                                            <option 
                                                value="131386" 
                                                >
                                                This finally should worrk
                                            </option>
                                        
                                            <option 
                                                value="131230" 
                                                >
                                                Thomas Schulman
                                            </option>
                                        
                                            <option 
                                                value="131170" 
                                                >
                                                Tiffany Kontoyiannis
                                            </option>
                                        
                                            <option 
                                                value="131216" 
                                                >
                                                Timothy Cubbison
                                            </option>
                                        
                                            <option 
                                                value="130993" 
                                                >
                                                Tom Williams
                                            </option>
                                        
                                            <option 
                                                value="131211" 
                                                >
                                                Tony Krantz
                                            </option>
                                        
                                            <option 
                                                value="131243" 
                                                >
                                                Toula Scordilis
                                            </option>
                                        
                                            <option 
                                                value="131164" 
                                                >
                                                Trey Lawson
                                            </option>
                                        
                                            <option 
                                                value="131330" 
                                                >
                                                Tryit now
                                            </option>
                                        
                                            <option 
                                                value="130976" 
                                                >
                                                Tuu Btt
                                            </option>
                                        
                                            <option 
                                                value="130992" 
                                                >
                                                tye tewt
                                            </option>
                                        
                                            <option 
                                                value="130886" 
                                                >
                                                Unknown 
                                            </option>
                                        
                                            <option 
                                                value="130890" 
                                                >
                                                Unknown 
                                            </option>
                                        
                                            <option 
                                                value="130911" 
                                                >
                                                Unknown 
                                            </option>
                                        
                                            <option 
                                                value="130913" 
                                                >
                                                Unknown 
                                            </option>
                                        
                                            <option 
                                                value="130914" 
                                                >
                                                Unknown 
                                            </option>
                                        
                                            <option 
                                                value="130915" 
                                                >
                                                Unknown 
                                            </option>
                                        
                                            <option 
                                                value="130916" 
                                                >
                                                Unknown 
                                            </option>
                                        
                                            <option 
                                                value="130917" 
                                                >
                                                Unknown 
                                            </option>
                                        
                                            <option 
                                                value="130918" 
                                                >
                                                Unknown 
                                            </option>
                                        
                                            <option 
                                                value="130919" 
                                                >
                                                Unknown 
                                            </option>
                                        
                                            <option 
                                                value="130920" 
                                                >
                                                Unknown 
                                            </option>
                                        
                                            <option 
                                                value="130923" 
                                                >
                                                Unknown 
                                            </option>
                                        
                                            <option 
                                                value="130924" 
                                                >
                                                Unknown 
                                            </option>
                                        
                                            <option 
                                                value="130925" 
                                                >
                                                Unknown 
                                            </option>
                                        
                                            <option 
                                                value="130941" 
                                                >
                                                Unknown 
                                            </option>
                                        
                                            <option 
                                                value="130883" 
                                                >
                                                Unknown Tester
                                            </option>
                                        
                                            <option 
                                                value="130884" 
                                                >
                                                Unknown testtt
                                            </option>
                                        
                                            <option 
                                                value="131238" 
                                                >
                                                Victoria Vertuga
                                            </option>
                                        
                                            <option 
                                                value="131287" 
                                                >
                                                Wayne Chung
                                            </option>
                                        
                                            <option 
                                                value="131053" 
                                                >
                                                Will Schnabel
                                            </option>
                                        
                                            <option 
                                                value="131364" 
                                                >
                                                x
                                            </option>
                                        
                                </select>
                            </div>
                        </div>

                        <div class="form-group col-md-12">
                            <label for="eventDescription">Description</label>
                            <textarea 
                                class="form-control" 
                                type="text" 
                                id="eventDescription" 
                                name="eventDescription" 
                                placeholder="Description" 
                                rows="4"></textarea>
                        </div>

                        <div class="form-group col-md-12">
                            <label for="eventLocation">Location</label>
                            <input 
                                class="form-control" 
                                type="text" 
                                id="eventLocation" 
                                autocomplete="off" 
                                name="eventLocation" 
                                placeholder="Location">
                        </div>

                        <div class="form-group col-md-6">
                            <label for="eventStart">Start Date<span class="text-danger">*</span></label>
                            <input 
                                id="eventStart" 
                                class="form-control" 
                                autocomplete="off" 
                                name="eventStart" 
                                type="date" 
                                data-parsley-required 
                                data-parsley-error-message="Start Date is required">
                        </div>

                        <div class="form-group col-md-6">
                            <label for="eventTypeName">Type<span class="text-danger">*</span></label>
                            <select 
                                class="form-control" 
                                name="eventTypeName" 
                                id="eventTypeName" 
                                data-parsley-required 
                                data-parsley-error-message="Type is required">
                                <option value=""></option>
                                
                                    <option value="Audition">Audition</option>
                                
                                    <option value="Blah">Blah</option>
                                
                                    <option value="Booking">Booking</option>
                                
                                    <option value="CD Workshop">CD Workshop</option>
                                
                                    <option value="Class">Class</option>
                                
                                    <option value="Coaching">Coaching</option>
                                
                                    <option value="Custom">Custom</option>
                                
                                    <option value="Event">Event</option>
                                
                                    <option value="Meeting">Meeting</option>
                                
                                    <option value="New">New</option>
                                
                                    <option value="New Stuff">New Stuff</option>
                                
                                    <option value="Rehearsal">Rehearsal</option>
                                
                                    <option value="testy">testy</option>
                                
                            </select>
                        </div>

                        <div class="form-group col-md-6">
                            <label for="eventStartTime">Start Time<span class="text-danger">*</span></label>
                            <select 
                                class="form-control" 
                                name="eventStartTime" 
                                autocomplete="off" 
                                id="eventStartTime" 
                                data-parsley-required 
                                data-parsley-error-message="Start Time is required">
                                <option value="">Select a Start Time</option>
                                
                                        <option 
                                            value="05:00:00" 
                                            >
                                            5:00 AM
                                        </option>
                                    
                                        <option 
                                            value="05:15:00" 
                                            >
                                            5:15 AM
                                        </option>
                                    
                                        <option 
                                            value="05:30:00" 
                                            >
                                            5:30 AM
                                        </option>
                                    
                                        <option 
                                            value="05:45:00" 
                                            >
                                            5:45 AM
                                        </option>
                                    
                                        <option 
                                            value="06:00:00" 
                                            >
                                            6:00 AM
                                        </option>
                                    
                                        <option 
                                            value="06:15:00" 
                                            selected>
                                            6:15 AM
                                        </option>
                                    
                                        <option 
                                            value="06:30:00" 
                                            >
                                            6:30 AM
                                        </option>
                                    
                                        <option 
                                            value="06:45:00" 
                                            >
                                            6:45 AM
                                        </option>
                                    
                                        <option 
                                            value="07:00:00" 
                                            >
                                            7:00 AM
                                        </option>
                                    
                                        <option 
                                            value="07:15:00" 
                                            >
                                            7:15 AM
                                        </option>
                                    
                                        <option 
                                            value="07:30:00" 
                                            >
                                            7:30 AM
                                        </option>
                                    
                                        <option 
                                            value="07:45:00" 
                                            >
                                            7:45 AM
                                        </option>
                                    
                                        <option 
                                            value="08:00:00" 
                                            >
                                            8:00 AM
                                        </option>
                                    
                                        <option 
                                            value="08:15:00" 
                                            >
                                            8:15 AM
                                        </option>
                                    
                                        <option 
                                            value="08:30:00" 
                                            >
                                            8:30 AM
                                        </option>
                                    
                                        <option 
                                            value="08:45:00" 
                                            >
                                            8:45 AM
                                        </option>
                                    
                                        <option 
                                            value="09:00:00" 
                                            >
                                            9:00 AM
                                        </option>
                                    
                                        <option 
                                            value="09:15:00" 
                                            >
                                            9:15 AM
                                        </option>
                                    
                                        <option 
                                            value="09:30:00" 
                                            >
                                            9:30 AM
                                        </option>
                                    
                                        <option 
                                            value="09:45:00" 
                                            >
                                            9:45 AM
                                        </option>
                                    
                                        <option 
                                            value="10:00:00" 
                                            >
                                            10:00 AM
                                        </option>
                                    
                                        <option 
                                            value="10:15:00" 
                                            >
                                            10:15 AM
                                        </option>
                                    
                                        <option 
                                            value="10:30:00" 
                                            >
                                            10:30 AM
                                        </option>
                                    
                                        <option 
                                            value="10:45:00" 
                                            >
                                            10:45 AM
                                        </option>
                                    
                                        <option 
                                            value="11:00:00" 
                                            >
                                            11:00 AM
                                        </option>
                                    
                                        <option 
                                            value="11:15:00" 
                                            >
                                            11:15 AM
                                        </option>
                                    
                                        <option 
                                            value="11:30:00" 
                                            >
                                            11:30 AM
                                        </option>
                                    
                                        <option 
                                            value="11:45:00" 
                                            >
                                            11:45 AM
                                        </option>
                                    
                                        <option 
                                            value="12:00:00" 
                                            >
                                            12:00 PM
                                        </option>
                                    
                                        <option 
                                            value="12:15:00" 
                                            >
                                            12:15 PM
                                        </option>
                                    
                                        <option 
                                            value="12:30:00" 
                                            >
                                            12:30 PM
                                        </option>
                                    
                                        <option 
                                            value="12:45:00" 
                                            >
                                            12:45 PM
                                        </option>
                                    
                                        <option 
                                            value="13:00:00" 
                                            >
                                            1:00 PM
                                        </option>
                                    
                                        <option 
                                            value="13:15:00" 
                                            >
                                            1:15 PM
                                        </option>
                                    
                                        <option 
                                            value="13:30:00" 
                                            >
                                            1:30 PM
                                        </option>
                                    
                                        <option 
                                            value="13:45:00" 
                                            >
                                            1:45 PM
                                        </option>
                                    
                                        <option 
                                            value="14:00:00" 
                                            >
                                            2:00 PM
                                        </option>
                                    
                                        <option 
                                            value="14:15:00" 
                                            >
                                            2:15 PM
                                        </option>
                                    
                                        <option 
                                            value="14:30:00" 
                                            >
                                            2:30 PM
                                        </option>
                                    
                                        <option 
                                            value="14:45:00" 
                                            >
                                            2:45 PM
                                        </option>
                                    
                                        <option 
                                            value="15:00:00" 
                                            >
                                            3:00 PM
                                        </option>
                                    
                                        <option 
                                            value="15:15:00" 
                                            >
                                            3:15 PM
                                        </option>
                                    
                                        <option 
                                            value="15:30:00" 
                                            >
                                            3:30 PM
                                        </option>
                                    
                                        <option 
                                            value="15:45:00" 
                                            >
                                            3:45 PM
                                        </option>
                                    
                                        <option 
                                            value="16:00:00" 
                                            >
                                            4:00 PM
                                        </option>
                                    
                                        <option 
                                            value="16:15:00" 
                                            >
                                            4:15 PM
                                        </option>
                                    
                                        <option 
                                            value="16:30:00" 
                                            >
                                            4:30 PM
                                        </option>
                                    
                                        <option 
                                            value="16:45:00" 
                                            >
                                            4:45 PM
                                        </option>
                                    
                                        <option 
                                            value="17:00:00" 
                                            >
                                            5:00 PM
                                        </option>
                                    
                                        <option 
                                            value="17:15:00" 
                                            >
                                            5:15 PM
                                        </option>
                                    
                                        <option 
                                            value="17:30:00" 
                                            >
                                            5:30 PM
                                        </option>
                                    
                                        <option 
                                            value="17:45:00" 
                                            >
                                            5:45 PM
                                        </option>
                                    
                                        <option 
                                            value="18:00:00" 
                                            >
                                            6:00 PM
                                        </option>
                                    
                                        <option 
                                            value="18:15:00" 
                                            >
                                            6:15 PM
                                        </option>
                                    
                                        <option 
                                            value="18:30:00" 
                                            >
                                            6:30 PM
                                        </option>
                                    
                                        <option 
                                            value="18:45:00" 
                                            >
                                            6:45 PM
                                        </option>
                                    
                                        <option 
                                            value="19:00:00" 
                                            >
                                            7:00 PM
                                        </option>
                                    
                                        <option 
                                            value="19:15:00" 
                                            >
                                            7:15 PM
                                        </option>
                                    
                                        <option 
                                            value="19:30:00" 
                                            >
                                            7:30 PM
                                        </option>
                                    
                                        <option 
                                            value="19:45:00" 
                                            >
                                            7:45 PM
                                        </option>
                                    
                                        <option 
                                            value="20:00:00" 
                                            >
                                            8:00 PM
                                        </option>
                                    
                                        <option 
                                            value="20:15:00" 
                                            >
                                            8:15 PM
                                        </option>
                                    
                                        <option 
                                            value="20:30:00" 
                                            >
                                            8:30 PM
                                        </option>
                                    
                                        <option 
                                            value="20:45:00" 
                                            >
                                            8:45 PM
                                        </option>
                                    
                                        <option 
                                            value="21:00:00" 
                                            >
                                            9:00 PM
                                        </option>
                                    
                                        <option 
                                            value="21:15:00" 
                                            >
                                            9:15 PM
                                        </option>
                                    
                                        <option 
                                            value="21:30:00" 
                                            >
                                            9:30 PM
                                        </option>
                                    
                                        <option 
                                            value="21:45:00" 
                                            >
                                            9:45 PM
                                        </option>
                                    
                                        <option 
                                            value="22:00:00" 
                                            >
                                            10:00 PM
                                        </option>
                                    
                                        <option 
                                            value="22:15:00" 
                                            >
                                            10:15 PM
                                        </option>
                                    
                                        <option 
                                            value="22:30:00" 
                                            >
                                            10:30 PM
                                        </option>
                                    
                                        <option 
                                            value="22:45:00" 
                                            >
                                            10:45 PM
                                        </option>
                                    
                                        <option 
                                            value="23:00:00" 
                                            >
                                            11:00 PM
                                        </option>
                                    
                                        <option 
                                            value="23:15:00" 
                                            >
                                            11:15 PM
                                        </option>
                                    
                                        <option 
                                            value="23:30:00" 
                                            >
                                            11:30 PM
                                        </option>
                                    
                                        <option 
                                            value="23:45:00" 
                                            >
                                            11:45 PM
                                        </option>
                                    
                            </select>
                        </div>

                        <div class="form-group col-md-6">
                            <label for="new_durid">Duration</label>
                            <select class="form-control" name="new_durid" autocomplete="off" id="new_durid">
                                
                                    <option 
                                        value="0" 
                                        >
                                        Unknown
                                    </option>
                                
                                    <option 
                                        value="1" 
                                        >
                                        15 mins
                                    </option>
                                
                                    <option 
                                        value="2" 
                                        >
                                        30 mins
                                    </option>
                                
                                    <option 
                                        value="3" 
                                        >
                                        45 mins
                                    </option>
                                
                                    <option 
                                        value="4" 
                                        selected>
                                        1 hr
                                    </option>
                                
                                    <option 
                                        value="5" 
                                        >
                                        1.25 hrs
                                    </option>
                                
                                    <option 
                                        value="6" 
                                        >
                                        1.5 hrs
                                    </option>
                                
                                    <option 
                                        value="7" 
                                        >
                                        1.75 hrs
                                    </option>
                                
                                    <option 
                                        value="8" 
                                        >
                                        2 hrs
                                    </option>
                                
                                    <option 
                                        value="9" 
                                        >
                                        2.25 hrs
                                    </option>
                                
                                    <option 
                                        value="10" 
                                        >
                                        2.5 hrs
                                    </option>
                                
                                    <option 
                                        value="11" 
                                        >
                                        2.75 hrs
                                    </option>
                                
                                    <option 
                                        value="12" 
                                        >
                                        3 hrs
                                    </option>
                                
                                    <option 
                                        value="13" 
                                        >
                                        3.25 hrs
                                    </option>
                                
                                    <option 
                                        value="14" 
                                        >
                                        3.5 hrs
                                    </option>
                                
                                    <option 
                                        value="15" 
                                        >
                                        3.75 hrs
                                    </option>
                                
                                    <option 
                                        value="16" 
                                        >
                                        4 hrs
                                    </option>
                                
                                    <option 
                                        value="17" 
                                        >
                                        4.25 hrs
                                    </option>
                                
                                    <option 
                                        value="18" 
                                        >
                                        4.5 hrs
                                    </option>
                                
                                    <option 
                                        value="19" 
                                        >
                                        4.75 hrs
                                    </option>
                                
                                    <option 
                                        value="20" 
                                        >
                                        5 hrs
                                    </option>
                                
                                    <option 
                                        value="21" 
                                        >
                                        5.25 hrs
                                    </option>
                                
                                    <option 
                                        value="22" 
                                        >
                                        5.5 hrs
                                    </option>
                                
                                    <option 
                                        value="23" 
                                        >
                                        5.75 hrs
                                    </option>
                                
                                    <option 
                                        value="24" 
                                        >
                                        6 hrs
                                    </option>
                                
                                    <option 
                                        value="25" 
                                        >
                                        6.25 hrs
                                    </option>
                                
                                    <option 
                                        value="26" 
                                        >
                                        6.5 hrs
                                    </option>
                                
                                    <option 
                                        value="27" 
                                        >
                                        6.75 hrs
                                    </option>
                                
                                    <option 
                                        value="28" 
                                        >
                                        7 hrs
                                    </option>
                                
                                    <option 
                                        value="29" 
                                        >
                                        7.25 hrs
                                    </option>
                                
                                    <option 
                                        value="30" 
                                        >
                                        7.5 hrs
                                    </option>
                                
                                    <option 
                                        value="31" 
                                        >
                                        7.75 hrs
                                    </option>
                                
                                    <option 
                                        value="32" 
                                        >
                                        8 hrs
                                    </option>
                                
                                    <option 
                                        value="33" 
                                        >
                                        8.25 hrs
                                    </option>
                                
                                    <option 
                                        value="34" 
                                        >
                                        8.5 hrs
                                    </option>
                                
                                    <option 
                                        value="35" 
                                        >
                                        8.75 hrs
                                    </option>
                                
                                    <option 
                                        value="36" 
                                        >
                                        9 hrs
                                    </option>
                                
                                    <option 
                                        value="37" 
                                        >
                                        9.25 hrs
                                    </option>
                                
                                    <option 
                                        value="38" 
                                        >
                                        9.5 hrs
                                    </option>
                                
                                    <option 
                                        value="39" 
                                        >
                                        9.75 hrs
                                    </option>
                                
                                    <option 
                                        value="40" 
                                        >
                                        10 hrs
                                    </option>
                                
                                    <option 
                                        value="41" 
                                        >
                                        10.25 hrs
                                    </option>
                                
                                    <option 
                                        value="42" 
                                        >
                                        10.5 hrs
                                    </option>
                                
                                    <option 
                                        value="43" 
                                        >
                                        10.75 hrs
                                    </option>
                                
                                    <option 
                                        value="44" 
                                        >
                                        11 hrs
                                    </option>
                                
                                    <option 
                                        value="45" 
                                        >
                                        11.25 hrs
                                    </option>
                                
                                    <option 
                                        value="46" 
                                        >
                                        11.5 hrs
                                    </option>
                                
                                    <option 
                                        value="47" 
                                        >
                                        11.75 hrs
                                    </option>
                                
                                    <option 
                                        value="48" 
                                        >
                                        12 hrs
                                    </option>
                                
                            </select>
                        </div>

                        <div class="form-group col-md-12">
                            <label for="noteDetails">Note</label>
                            <textarea 
                                class="form-control" 
                                type="text" 
                                id="noteDetails" 
                                name="noteDetails" 
                                placeholder="Note to be added to Notes Log" 
                                rows="4"></textarea>
                        </div>

                        <div class="form-group col-md-12">
                            <label for="eventStopTime">Recurring every:</label>
                            <div id="checkboxes">
                                <input type="checkbox" name="dow" value="1" autocomplete="off" onchange="showDiv('hidden_div', this)"> Monday
                                <input type="checkbox" name="dow" value="2" onchange="showDiv('hidden_div', this)"> Tuesday
                                <input type="checkbox" name="dow" value="3" onchange="showDiv('hidden_div', this)"> Wednesday
                                <input type="checkbox" name="dow" value="4" onchange="showDiv('hidden_div', this)"> Thursday
                                <input type="checkbox" name="dow" value="5" onchange="showDiv('hidden_div', this)"> Friday
                                <input type="checkbox" name="dow" value="6" onchange="showDiv('hidden_div', this)"> Saturday
                                <input type="checkbox" name="dow" value="0" onchange="showDiv('hidden_div', this)"> Sunday
                            </div>
                        </div>

                        <div class="form-group col-md-6" id="hidden_div">
                            <label for="eventStart">Recurring Until:</label>
                            <input class="form-control" id="endRecur" name="endRecur" type="date">
                        </div>
                    </div>

                    <div class="row mt-2">
                        <div class="col-6"></div>
                        <div class="col-6 text-right">
                            <a href="javascript:history.go(-1)">
                                <button type="button" class="btn btn-light mr-1 btn-sm" data-bs-dismiss="modal">Back</button>
                            </a>
                            <button type="submit" class="btn btn-primary btn-sm waves-effect waves-light" id="btn-save-event">Add</button>
                        </div>
                    </div>
                    <div class="row">&nbsp;</div>
                </form>




        
        </div>
      </div>
    </div>
  </div>
</div>
<style>
  .card-body {
    padding-bottom: 15rem;
  }
</style>
<script>
  $(document).ready(function () {
    $(".parsley-examples").parsley();
  });
</script>

<script>
  function showDiv(divId, element) {
    var checked = document.querySelectorAll('input[name="dow"]:checked');
    var hiddenDiv = document.getElementById(divId);

    if (checked.length === 0) {
      hiddenDiv.style.display = 'none';
      document
        .getElementById("endRecur")
        .value = "";
      $("#endRecur").prop('required', false);
    } else {
      hiddenDiv.style.display = 'block';
      $("#endRecur").prop('required', true);
    }
  }
</script>

<script>
  $('select[name=eventStartTime]').on("change", function () {
    var theSelectedIndex = $(this)[0].selectedIndex;
    $.each($('select[name=eventStopTime] option'), function () {
      var endOptionIndex = $(this).index();
      if (endOptionIndex < theSelectedIndex) {
        $(this).attr('disabled', 'disabled');
      } else {
        $(this)
          .removeAttr('disabled')
          .prop('selected', true);
        return false;
      }
    });
  });
</script>


                </div>
            </div>

            
<div id="diagnostics" class="modal fade" tabindex="-1" role="dialog" 

>
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">
                    Diagnostics
                </h4>
                <button type="button" class="close" data-bs-dismiss="modal" 

>
                    <i class="mdi mdi-close-thick"></i>
                </button>
            </div>
            <div class="modal-body">
                
                    <p>
                            pgid: 91<br />
                        
                            userid: 30<br />
                        </p>
                
            </div>
        </div>
    </div>
</div>

<footer class="footer">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-6">
                Desktop version. 2024 &reg; The Actor's Office LLC - All rights reserved
            </div>
            <div class="col-md-6">
                <div class="text-md-end footer-links d-none d-sm-block">
                    <a href="https://www.theactorsoffice.com" target="_blank">TAO Website</a>
                    <a href="javascript:;" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="#diagnostics" data-bs-placement="top" title="Diagnostics">Diagnostics</a>
                </div>
            </div>
        </div>
    </div>
</footer>

        </div>
    </div>