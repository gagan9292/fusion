<cfinclude template="header.cfm"> 


    <cfif isDefined ("session.id") and session.id neq "">

        <html>
        <body>
            <!--- <a href="adduser.cfm" class="btn btn-info" role="button">Add User</a> --->

            <a href="logout.cfm" class="btn btn-info" role="button">Logout</a>

            <cfquery name="getuserinfo" datasource="coldfusion">
                select * from kodionemp Where id = #Session.id#
            </cfquery>    

            <H2>Employee Records</H2>

            <TABLE CELLPADDING="3" CELLSPACING="0">
                <TR BGCOLOR="#888888">
                    <TH>ID</TH>
                    <TH>Name</TH>
                    <TH>Username</TH>
                    <TH>Email</TH>
                    <TH>Phone</TH>
                    <TH>Dob</TH>
                    <TH>Document</TH>
                    <TH>Action</TH>
                </TR>

                <CFOUTPUT QUERY="getuserinfo" >
                    <TR BGCOLOR="##C0C0C0">
                        <TD>#id#</TD>
                        <TD>#fname# #lname#</TD> 
                        <TD>#username#</TD>
                        <TD>#email#</TD>
                        <TD>#phone#</TD>
                        <TD>#dob#</TD>
                        <TD><a href="http://127.0.0.1:8500/upload/#doc#" target="_blank" > #doc#</a></TD>
                        <TD> <button type="button" onclick="edit('#id#')"class="btn btn-info btn-lg"  >Edit</button> | 
                            <a href="delete.cfm?From=delete&id=#id#" onclick="return confirm('Are you sure want to delete?')">Delete</a></TD>
                    </TR>
                </CFOUTPUT>                      
                </TABLE>
            </body>
            </html>
            <cfelse>
                <cfset loginerr = "The Email or password is incorrect">
                    <cflocation url = "index.cfm?error=#loginerr#" >
                    </cfif>

                    <div class="modal" id="edituser">
                        <div class="modal-dialog">
                            <div class="modal-content">

                                <!-- Modal Header -->
                                <div class="modal-header">
                                    <h4 class="modal-title">Update User</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>

                                <!-- Modal body -->
                                <div class="modal-body">
                                   
                                   
                                    <table>
                                        <form action="updateauth.cfm" method="Post" enctype="multipart/form-data">
                                            <input type="hidden" id="id" name="id" value="">
                                           
                                        <!--- <tr>
                                            <td><input type="hidden" id="id" name="id" value=""></td>
                                        </tr> --->
                                        <tr>
                                            <td>First Name:</td>
                                            <td><input type="text" id="fname" name="fname" value="#fname#"></td>
                                        </tr>  
                                        <tr>
                                            <td>Last Name:</td>
                                            <td><input type="text" id="lname" name="lname" value="#lname#"></td>
                                        </tr>
                                        <tr>
                                            <td>Username:</td>
                                            <td><input type="z" id="username" name="username" value="#username#"></td>
                                        </tr>
                                        <tr>
                                            <td>Phone:</td>
                                            <td><input type="text" id="phone" name="phone" value="#phone#"></td>
                                        </tr>
                                        <tr>
                                            <td>dob:</td>
                                            <td><input type="text" id="dob" name="dob" value="#dob#"></td>
                                        </tr>
                                        
                                      
                                        <td>Document:</td>
                                            <td><input type="file" id="doc" name="doc" value="#doc#"></td>
                                        </tr>
                                            
                                        <td>&nbsp;</td>
                                        <td><input type="Submit" class="btn btn-info" value="Update">
                                        </td>
                                        
                                        </tr>
                                        </form>
                                        </table>
                                </div>

                                <!-- Modal footer -->
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                </div>

                            </div>
                        </div>
                    </div>

               







