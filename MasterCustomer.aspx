<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MasterCustomer.aspx.cs" Inherits="TESTdem.Mastertest01" 
        MaintainScrollPositionOnPostBack="true" %>
<%@ MasterType VirtualPath="~/MasterPage.master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
     <style>
        
         .gridview-wrapper {
            overflow-x: auto;
            width: 100%;
            max-height:450px;
        }

        .align{
           text-align:right;
        }
        .flex{
             float: left;
            margin-right: 20px;
            margin-left:25px;
        }
        .mainDiv{
            margin: 0 auto; 
            width: 45%; 
            overflow: hidden;
        }
        .cent{
           width:85px;
           height:25px;
           border:1.5px solid;
           background-color:lightskyblue;
           margin-left:42.5%;
        }

        .cent2{
           width:85px;
           height:25px;
           border:1.5px solid;
           background-color:lightskyblue;
          
        }

         .registration-section {
            text-align: center;
            background-color:darkgray;
            padding: 10px;
        }
        hr {
            border: 1px solid black;
            margin-top:0px;
            margin-bottom:0px;
        }
        body{
            background-color:#CCCCCC;
        }
    </style>


    <script type="text/javascript">
    window.onload = function() {
        // Get all textboxes with class 'counted-textbox'
        var textboxes = document.querySelectorAll('input.counted-textbox[type="text"]');
        textboxes.forEach(function(tb) {
            // Create/update count next to textbox
            var maxLength = tb.getAttribute('maxlength') || 200;  // default max if not set
            var countSpan = tb.nextElementSibling;
            if (!countSpan || !countSpan.classList.contains('char-count')) {
                // If count span doesn't exist, create it
                countSpan = document.createElement('span');
                countSpan.className = 'char-count';
                countSpan.style.marginLeft = '5px';
                tb.parentNode.insertBefore(countSpan, tb.nextSibling);
            }
            // Initialize count text
            countSpan.innerText = tb.value.length + "/" + maxLength;

            // Add event listener for input changes
            tb.addEventListener('input', function() {
                var len = tb.value.length;
                countSpan.innerText = len + "/" + maxLength;
            });
        });
    };
    </script>





    
        <hr /><div class="registration-section">
            NEW COMPANY REGISTRATION
        </div><hr/><br /><br />
        <div class="mainDiv">
       <div class="flex">
         <table>
                
                <tr>
                    <td  class="align"><asp:Label ID="Label1" runat="server" Text="S No: "></asp:Label></td>
                    <td><asp:TextBox ID="TextBox1" runat="server" Class="counted-textbox" MaxLength="10"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="align"><asp:Label ID="Label2" runat="server" Text="Company Name: "></asp:Label></td>
                    <td>
                        <span style="white-space: nowrap;">
                        <asp:TextBox ID="TextBox2" runat="server" Class="counted-textbox" MaxLength="100"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv_CompanyName" runat="server" ControlToValidate="TextBox2" ErrorMessage="*" 
                             ForeColor="Red" Display="Dynamic" />
                        </span>
                    </td>
                </tr>

                <tr>
                    <td  class="align"><asp:Label ID="Label3" runat="server" Text="Country: "></asp:Label></td>
                    <td><span style="white-space: nowrap;">
                        <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem Text="--Select--" Value="" Selected="True"></asp:ListItem>
                        <asp:ListItem Value="India"></asp:ListItem>
                        <asp:ListItem Value="UAE"></asp:ListItem>
                        <asp:ListItem Value="Oman"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfv_Country" runat="server" ControlToValidate="DropDownList1" InitialValue="" ErrorMessage="*" 
                            ForeColor="Red" Display="Dynamic" />
                        </span>
                    </td>
                </tr>
                <tr>
                    <td  class="align"><asp:Label ID="Label4" runat="server" Text="Address: "></asp:Label></td>
                    <td><asp:TextBox ID="TextBox3" runat="server" Class="counted-textbox" MaxLength="200"></asp:TextBox></td>
                </tr>
             <tr>
                    <td  class="align"><asp:Label ID="Label5" runat="server" Text="State: "></asp:Label></td>
                    <td><span style="white-space: nowrap;">
                        <asp:TextBox ID="TextBox4" runat="server" Class="counted-textbox" MaxLength="50"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv_State" runat="server" ControlToValidate="TextBox4" ErrorMessage="*" 
                           ForeColor="Red" Display="Dynamic" />
                        </span>
                    </td>
                </tr>
                <tr>
                    <td  class="align"><asp:Label ID="Label6" runat="server" Text="Contact Person: "></asp:Label></td>
                    <td><span style="white-space: nowrap;">
                        <asp:TextBox ID="TextBox5" runat="server" Class="counted-textbox" MaxLength="50"></asp:TextBox>
                              <!--<span class="char-count" style="margin-left:5px;">0/50</span>-->
                        <asp:RequiredFieldValidator ID="rfv_ContactPerson" runat="server" ControlToValidate="TextBox5" ErrorMessage="*" 
                             ForeColor="Red" Display="Dynamic" />
                        </span>
                    </td>
                </tr>
                <tr>
                    <td  class="align"><asp:Label ID="Label7" runat="server" Text="Mobile No: "></asp:Label></td>
                    <td><asp:TextBox ID="TextBox6" runat="server" Class="counted-textbox" MaxLength="15"></asp:TextBox>
                        <!--<span class="char-count" style="margin-left:5px;">0/15</span>-->
                    </td>
                         
                       <td><span style="white-space: nowrap;">
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox6" ErrorMessage="*" 
                            ForeColor="Red" Display="Dynamic" />
                            </span> 
                           <asp:RegularExpressionValidator ID="rev_MobileNo" runat="server" 
                           ControlToValidate="TextBox6" 
                           ErrorMessage="Invalid(<10)"
                           ForeColor="Red" 
                           Display="Dynamic"
                           ValidationExpression="^\d{10,15}$" />
                       </td>
                </tr>
            </table>
     </div>

        <div class="flex">
            <table>
                <tr>
                    <td class="align"><asp:Label ID="Label8" runat="server" Text="E-Mail Id: "></asp:Label></td>
                    <td><span style="white-space: nowrap;">
                        <asp:TextBox ID="TextBox7" runat="server" Class="counted-textbox" MaxLength="100"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="rev_Email" runat="server" ControlToValidate="TextBox7" 
                             ErrorMessage="*Invalid" ForeColor="Red" ValidationExpression="^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$" />
                        </span>
                     </td>
                </tr>
                <tr>
                    <td class="align"><asp:Label ID="Label9" runat="server" Text="Rate Contract: "></asp:Label></td>
                    <td><span style="white-space: nowrap;">
                        <asp:DropDownList ID="DropDownList2" runat="server">
                            <asp:ListItem Text="--Select--" Value="" Selected="True"></asp:ListItem>
                            <asp:ListItem Value="Yes"></asp:ListItem>
                            <asp:ListItem Value="No"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfv_RC" runat="server" ControlToValidate="DropDownList2" InitialValue="" ErrorMessage="*" 
                               ForeColor="Red" Display="Dynamic" />
                        </span>
                        &nbsp;&nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="align"><asp:Label ID="Label10" runat="server" Text="GST/VAT/TAX ID: "></asp:Label></td>
                   <td><asp:TextBox ID="TextBox8" runat="server" Class="counted-textbox" MaxLength="15"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="align"><asp:Label ID="Label11" runat="server" Text="PAN No: "></asp:Label></td>
                    <td><asp:TextBox ID="TextBox9" runat="server" Class="counted-textbox" MaxLength="10"></asp:TextBox></td>
                </tr>

                <tr>
                    <td class="align"><asp:Label ID="Label12" runat="server" Text="Registered Office: "></asp:Label></td>
                   <td><asp:TextBox ID="TextBox10" runat="server" Class="counted-textbox" MaxLength="100"></asp:TextBox></td>
                </tr>
               
            </table> 
        </div>
            </div><br /><br />
           
         <asp:Button ID="Button1" CssClass="cent" runat="server" Text="Submit" onclick="DataSubmit"/>&nbsp&nbsp&nbsp
            <asp:Button ID="Button2" CssClass="cent2" runat="server" Text="Reset" OnClick="ResetClick" /><br /><br />


        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="lbtn_export_Click">Export To Excel</asp:LinkButton>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <asp:Label ID="Label13" runat="server" Text="Search By Company Name: "></asp:Label>
        <asp:TextBox ID="TextBox11" runat="server" OnTextChanged="SearchBox" AutoPostBack="true" ></asp:TextBox><br /><br />


   <div class="gridview-wrapper" style="overflow-x:auto;">
    <asp:GridView ID="GridView1" runat="server" CssClass="gridview" 
    Width="100%" AutoGenerateColumns="False" OnRowEditing="GridView1_RowEditing" 
    OnRowCancelingEdit="GridView1_RowCancelingEdit" AllowPaging="true" PageSize="10" 
    OnPageIndexChanging="Gridpaging" DataKeyNames="PAN" OnRowDeleting="GridView1_RowDeleting" OnRowUpdating="GridView1_RowUpdating">
            <Columns>
                 <asp:TemplateField HeaderText="S.No" HeaderStyle-BackColor="lightskyblue" ItemStyle-BackColor="#CCCCCC" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                          <%# Container.DataItemIndex + 1 %>
                    </ItemTemplate>
                </asp:TemplateField>

                  <asp:TemplateField HeaderText="Comp Name" HeaderStyle-BackColor="lightskyblue" ItemStyle-BackColor="#CCCCCC" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:Label ID="lbl_Name" runat="server" Text='<%#Eval("Company_Name") %>'></asp:Label>
                    </ItemTemplate>
                      <EditItemTemplate>
                        <asp:TextBox ID="txt_Name" runat="server" Text='<%#Eval("Company_Name") %>' Width="100px"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Country"  HeaderStyle-BackColor="lightskyblue" ItemStyle-BackColor="#CCCCCC" HeaderStyle-HorizontalAlign="Left" >
                    <ItemTemplate>
                        <asp:Label ID="lbl_Country" runat="server" Text='<%#Eval("Country") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txt_Country" runat="server" Text='<%#Eval("Country") %>' Width="100px"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                 <asp:TemplateField HeaderText="Address" HeaderStyle-BackColor="lightskyblue" ItemStyle-BackColor="#CCCCCC" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:Label ID="lbl_Address" runat="server" Text='<%#Eval("Address") %>'></asp:Label>
                    </ItemTemplate>
                     <EditItemTemplate>
                        <asp:TextBox ID="txt_Address" runat="server" Text='<%#Eval("Address") %>' Width="100px"></asp:TextBox>
                    </EditItemTemplate>
                 </asp:TemplateField>

                 <asp:TemplateField HeaderText="State" HeaderStyle-BackColor="lightskyblue" ItemStyle-BackColor="#CCCCCC" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:Label ID="lbl_State" runat="server" Text='<%#Eval("State") %>'></asp:Label>
                    </ItemTemplate>
                     <EditItemTemplate>
                        <asp:TextBox ID="txt_State" runat="server" Text='<%#Eval("State") %>' Width="100px"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                 <asp:TemplateField HeaderText="Contact Person" HeaderStyle-BackColor="lightskyblue" ItemStyle-BackColor="#CCCCCC" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:Label ID="lbl_CP" runat="server" Text='<%#Eval("Contact_Person") %>'></asp:Label>
                    </ItemTemplate>
                     <EditItemTemplate>
                        <asp:TextBox ID="txt_CP" runat="server" Text='<%#Eval("Contact_Person") %>' Width="100px"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                 <asp:TemplateField HeaderText="Mobile No." HeaderStyle-BackColor="lightskyblue" ItemStyle-BackColor="#CCCCCC" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:Label ID="lbl_Mob" runat="server" Text='<%#Eval("Mobile_No") %>'></asp:Label>
                    </ItemTemplate>
                     <EditItemTemplate>
                        <asp:TextBox ID="txt_Mob" runat="server" Text='<%#Eval("Mobile_No") %>' Width="100px"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

               

                 <asp:TemplateField HeaderText="Email" HeaderStyle-BackColor="lightskyblue" ItemStyle-BackColor="#CCCCCC" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:Label ID="lbl_email" runat="server" Text='<%#Eval("Email") %>'></asp:Label>
                    </ItemTemplate>
                     <EditItemTemplate>
                        <asp:TextBox ID="txt_email" runat="server" Text='<%#Eval("Email") %>' Width="100px"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                 <asp:TemplateField HeaderText="Rate Contract" HeaderStyle-BackColor="lightskyblue" ItemStyle-BackColor="#CCCCCC" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:Label ID="lbl_RC" runat="server" Text='<%#Eval("Rate_Contract") %>'></asp:Label>
                    </ItemTemplate>
                     <EditItemTemplate>
                        <asp:TextBox ID="txt_RC" runat="server" Text='<%#Eval("Rate_Contract") %>' Width="100px"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                 <asp:TemplateField HeaderText="GST" HeaderStyle-BackColor="lightskyblue" ItemStyle-BackColor="#CCCCCC" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:Label ID="lbl_GST" runat="server" Text='<%#Eval("GST") %>'></asp:Label>
                    </ItemTemplate>
                     <EditItemTemplate>
                        <asp:TextBox ID="txt_GST" runat="server" Text='<%#Eval("GST") %>' Width="100px"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                 <asp:TemplateField HeaderText="PAN" HeaderStyle-BackColor="lightskyblue" ItemStyle-BackColor="#CCCCCC" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:Label ID="lbl_PAN" runat="server" Text='<%#Eval("PAN") %>'></asp:Label>
                    </ItemTemplate>
                     <EditItemTemplate>
                        <asp:TextBox ID="txt_PAN" runat="server" Text='<%#Eval("PAN") %>' Width="100px"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                 <asp:TemplateField HeaderText="Reg. Office" HeaderStyle-BackColor="lightskyblue" ItemStyle-BackColor="#CCCCCC" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:Label ID="lbl_RegOff" runat="server" Text='<%#Eval("Reg_Office") %>'></asp:Label>
                    </ItemTemplate>
                     <EditItemTemplate>
                        <asp:TextBox ID="txt_RegOff" runat="server" Text='<%#Eval("Reg_Office") %>' Width="100px"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

              <asp:TemplateField HeaderStyle-BackColor="lightskyblue" ItemStyle-BackColor="#CCCCCC" HeaderStyle-HorizontalAlign="Left" >
                <ItemTemplate>
                    <asp:Button ID="btn_Edit" runat="server" Text="Edit" CommandName="Edit" BackColor="#CCCCCC" Font-Underline="True" ForeColor="#3333CC" BorderColor="#CCCCCC" BorderStyle="None" />
                    <asp:Button ID="btn_Delete" runat="server" Text="Delete" CommandName="Delete" CommandArgument='<%# Eval("PAN") %>'  BackColor="#CCCCCC" Font-Underline="True" ForeColor="#3333CC" BorderColor="#CCCCCC" BorderStyle="None"/>
                </ItemTemplate>    
                  <EditItemTemplate>
                       <asp:Button ID="btn_Update" runat="server" Text="Update" CommandName="Update" BackColor="#CCCCCC" ForeColor="#3333CC" BorderColor="#CCCCCC" BorderStyle="None" />
                        <asp:Button ID="btn_Cancel" runat="server" Text="Cancel" CommandName="Cancel" BackColor="#CCCCCC" Font-Underline="True" ForeColor="#3333CC" BorderColor="#CCCCCC" BorderStyle="None" />
                    </EditItemTemplate>          
              </asp:TemplateField>  
              </Columns>
        </asp:GridView>
   </div>

</asp:Content>


