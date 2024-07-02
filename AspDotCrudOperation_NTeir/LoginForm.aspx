<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginForm.aspx.cs" Inherits="AspDotCrudOperation_NTeir.LoginForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <title></title>

    <script type="text/javascript">
        function validateRegister() {
            var form = document.getElementById("form1");

            function submitForm(event) {
                var name = document.getElementById('<%=txtname.ClientID%>').value;
                if (name == "") {
                    document.getElementById('lblname').innerHTML = 'Please enter name...!';
                    event.preventDefault(); // Prevent form submission on error
                } else {
                    document.getElementById('lblname').innerHTML = "";
                }

                var age = document.getElementById('<%=txtdob.ClientID%>').value;
                if (age == "") {
                    document.getElementById('lbldob').innerHTML = 'Please enter age...!';
                    event.preventDefault(); // Prevent form submission on error
                } else {
                    document.getElementById('lbldob').innerHTML = "";
                }

                var email = document.getElementById('<%=txtemail.ClientID%>').value;
                let regex = /^([_\-\.0-9a-zA-Z]+)@([_\-\.0-9a-zA-Z]+)\.([a-zA-Z]){2,7}$/;
                if (!regex.test(email)) {
                    document.getElementById('lblemail').innerHTML = 'Please enter a valid email address';
                    event.preventDefault(); // Prevent form submission on error
                } else {
                    document.getElementById('lblemail').innerHTML = "";
                }

                var mobile = document.getElementById('<%=txtmobile.ClientID%>').value;
                var PhoneValid = /^([0-9]{10})$/;
                if (!PhoneValid.test(mobile)) {
                    document.getElementById('lblmob').innerHTML = 'Please Enter a valid mobile no';
                    event.preventDefault(); // Prevent form submission on error
                } else {
                    document.getElementById('lblmob').innerHTML = "";
                }
            }

            // Attach submit event listener to the form
            form.addEventListener('submit', submitForm);
        }

        // Call validateRegister function when the document is ready
        document.addEventListener("DOMContentLoaded", function () {
            validateRegister();
        });
</script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background: #f6f8fa;
            font-family: 'Poppins', sans-serif;
        }

        .container {
            max-width: 700px;
            width: 100%;
            background: #ffffff;
            border-radius: 0.5rem;
            box-shadow: 0px 0px 0px 1px rgba(0, 0, 0, 0.1), 0px 5px 12px -2px rgba(0, 0, 0, 0.1), 0px 18px 36px -6px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            margin: 10px;
        }

            .container .title {
                padding: 25px;
                background: #f6f8fa;
            }

                .container .title p {
                    font-size: 25px;
                    font-weight: 500;
                    position: relative;
                }

                    .container .title p::before {
                        content: "";
                        position: absolute;
                        bottom: 0;
                        left: 0;
                        width: 30px;
                        height: 3px;
                        background: linear-gradient(to right, #F37A65, #D64141);
                    }

        .user_details {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 20px;
            padding: 25px;
        }

            .user_details .input_box {
                width: calc(100% / 2 - 20px);
                margin: 0 0 12px 0;
            }

        .input_box label {
            font-weight: 500;
            margin-bottom: 5px;
            display: block;
        }

            .input_box label::after {
                content: " *";
                color: red;
            }

        .input_box input {
            width: 100%;
            height: 45px;
            border: none;
            outline: none;
            border-radius: 5px;
            font-size: 16px;
            padding-left: 15px;
            box-shadow: 0px 0px 0px 1px rgba(0, 0, 0, 0.1);
            background-color: #f6f8fa;
            font-family: 'Poppins', sans-serif;
            transition: all 120ms ease-out 0s;
        }


            .input_box input:focus,
            .input_box input:valid {
                box-shadow: 0px 0px 0px 2px #AC8ECE;
            }

        form .gender {
            padding: 0px 25px;
        }

        .gender .gender_title {
            font-size: 20px;
            font-weight: 500;
        }

        .gender .category {
            width: 80%;
            display: flex;
            justify-content: space-between;
            margin: 5px 0;
        }

            .gender .category label {
                display: flex;
                align-items: center;
                cursor: pointer;
            }

                .gender .category label .dot {
                    height: 18px;
                    width: 18px;
                    background: #d9d9d9;
                    border-radius: 50%;
                    margin-right: 10px;
                    border: 4px solid transparent;
                    transition: all 0.3s ease;
                }

        #radio_1:checked ~ .category label .one,
        #radio_2:checked ~ .category label .two,
        #radio_3:checked ~ .category label .three {
            border-color: #d9d9d9;
            background: #D64141;
        }

        

        .reg_btn {
            padding: 50px;
            margin: 25px 0;
        }

            .reg_btn input {
                height: 45px;
                width: 100%;
                border: none;
                font-size: 18px;
                font-weight: 500;
                cursor: pointer;
                background: linear-gradient(to right, #F37A65, #D64141);
                border-radius: 5px;
                color: #ffffff;
                letter-spacing: 1px;
                text-shadow: 0px 2px 2px rgba(0, 0, 0, 0.2);
            }

                .reg_btn input:hover {
                    background: linear-gradient(to right, #D64141, #F37A65);
                }
                         .input_box select {
    width: 100%;
    height: 45px;
    border: none;
    outline: none;
    border-radius: 5px;
    font-size: 16px;
    padding-left: 15px;
    box-shadow: 0px 0px 0px 1px rgba(0, 0, 0, 0.1);
    background-color: #f6f8fa;
    font-family: 'Poppins', sans-serif;
    transition: all 120ms ease-out 0s;
}
        @media screen and (max-width: 584px) {

            .user_details {
                max-height: 340px;
                overflow-y: scroll;
            }

                .user_details::-webkit-scrollbar {
                    width: 0;
                }

                .user_details .input_box {
                    width: 100%;
                }

            .gender .category {
                width: 100%;
            }
        }


        @media screen and (max-width: 419px) {
            .gender .category {
                flex-direction: column;
            }
        }

        .btn-submit {
            background: linear-gradient(to right, rgba(132, 250, 176, 1), rgba(143, 211, 244, 1));
            padding: 10px;
            border: none;
            border-radius: 40px;
            font-size: 30px;
            color: #fff;
            margin-top: 30px;



   

        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="title">
                <p>Registration</p>
            </div>

            <form action="#">
                <div class="user_details">
                    <div class="input_box">
                        <label for="name">Name</label>
                        <asp:TextBox ID="txtname" runat="server" placeholder="Enter your Name"></asp:TextBox>
                           <asp:Label runat="server" ID="lblname" Style="color: red;"></asp:Label>
                    </div>

                    <div class="input_box">
                        <label for="email">Email</label>
                        <asp:TextBox ID="txtemail" runat="server" placeholder="Enter your email"></asp:TextBox>
                              <asp:Label runat="server" ID="lblemail" Style="color: red;"></asp:Label>
                    </div>
                    <div class="input_box">
                        <label for="phone">Phone Number</label>
                        <asp:TextBox ID="txtmobile" runat="server" placeholder="Enter your number"></asp:TextBox>
                            <asp:Label runat="server" ID="lblmob" Style="color: red;"></asp:Label>

                    </div>

                    <div class="input_box">
                        <label for="phone">DOB</label>
                        <asp:TextBox ID="txtdob" runat="server" TextMode="Date"></asp:TextBox>
                            <asp:Label runat="server" ID="lbldob" Style="color: red;"></asp:Label>

                    </div>



                    <%--  <div class="col-md-8">
            <div class="form-group">
                <label for="regno">Name</label>

                <asp:TextBox ID="txtname" CssClass="form-control" runat="server" placeholder="Enter Frist Name"></asp:TextBox>
                 <asp:Label runat="server" ID="lblname" Style="color: red;"></asp:Label>

            </div>

        </div>





        <div class="col-md-8">
            <div class="form-group">
                <label for="regno">Dob</label>
                <asp:TextBox ID="txtdob" CssClass="form-control" TextMode="Date" runat="server" placeholder="Enter Age"></asp:TextBox>
                <asp:Label runat="server" ID="lbldob" Style="color: red;"></asp:Label>
            </div>
        </div>


        <div class="col-md-8">
            <div class="form-group">
                <label for="email">Email</label>
                <asp:TextBox ID="txtemail" CssClass="form-control" runat="server" placeholder="Enter Age"></asp:TextBox>
                <asp:Label runat="server" ID="lblemail" Style="color: red;"></asp:Label>
            </div>
        </div>

        <div class="col-md-8">
            <div class="form-group">
                <label for="mobile">Mobile No.</label>
                <asp:TextBox ID="txtmobile" CssClass="form-control" runat="server" MaxLength="10" placeholder="Enter Mobile No."></asp:TextBox>
                <asp:Label runat="server" ID="lblmob" Style="color: red;"></asp:Label>
            </div>
        </div>--%>

                        <div class="input_box">
                            <label for="state">State</label>
                            <asp:DropDownList ID="ddlstate" AutoPostBack="true" runat="server" CssClass="" OnSelectedIndexChanged="ddlstate_SelectedIndexChanged">
                                <asp:ListItem Value="0" Text="Select state"></asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <div class="input_box form-group">
                            <label for="city">City</label>
                            <asp:DropDownList ID="ddlcity" runat="server" AutoPostBack="true" CssClass="form-control">
                            </asp:DropDownList>
                        </div>


                    <div class="col-md-8">
                        <div class="form-group">
                            <label for="Upload">Upload  Image</label>
                            <div class="input-group">
                                <asp:FileUpload ID="FileUpload1" runat="server" CssClass="btn btn-info" />
                            </div>

                        </div>
                    </div>
                    <div class="reg_btn">
                        <asp:Button ID="btnsave" runat="server" Text="Submit" CssClass="btn-submit w-100" OnClientClick="return validateRegister();" OnClick="btnsave_Click"  />
                      <asp:Label ID="lblmsg" runat="server" Style="color: red;"></asp:Label>
                    </div>
                    <%-- <div class="col-md-8">
                    <asp:Button runat="server" ID="btnsave" Text="Submit" CssClass="btn-submit w-100" OnClientClick="return validateRegister();" OnClick="btnsave_Click" />
                    <asp:Label ID="lblmsg" runat="server" Style="color: red;"></asp:Label>
                </div>--%>
                </div>
                <div>
                </div>
            </form>

        </div>

        <div class="w-100  mt-5">
            <asp:GridView ID="GV_Bind" CssClass="w-100 " runat="server" AutoGenerateColumns="false" OnRowCancelingEdit="GV_Bind_RowCancelingEdit" OnRowEditing="GV_Bind_RowEditing" OnRowUpdating="GV_Bind_RowUpdating" OnRowDeleting="GV_Bind_RowDeleting">

                <Columns>
                    <asp:TemplateField HeaderText="">
                        <HeaderTemplate>

                            <asp:Label ID="lblid" Visible="false" runat="server" Text='<%#Eval("id")%>'></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                        </ItemTemplate>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="S.No">
                        <ItemTemplate>

                            <%# Container.DisplayIndex+1 %>


                            <asp:Label ID="lblid" Visible="false" runat="server" Text='<%#Eval("id")%>'></asp:Label>


                        </ItemTemplate>
                    </asp:TemplateField>



                    <asp:TemplateField HeaderText="Name">
                        <ItemTemplate>
                            <asp:Label ID="lblname" runat="server" Text=' <%#Eval("Name")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtfname" runat="server" Text=' <%#Eval("Name")%>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>




                    <asp:TemplateField HeaderText="Dob">
                        <ItemTemplate>
                            <asp:Label ID="lbllage" runat="server" Text='<%#Eval("Dob")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtage" runat="server" Text=' <%#Eval("Dob")%>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="Email">
                        <ItemTemplate>
                            <asp:Label ID="lblemail" runat="server" Text='<%#Eval("Email")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtemail" runat="server" Text=' <%#Eval("Email")%>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>



                    <asp:TemplateField HeaderText="Mobile no.">
                        <ItemTemplate>
                            <asp:Label ID="lblmoblie" runat="server" Text='<%#Eval("Mobileno")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtmobile" runat="server" Text=' <%#Eval("Mobileno")%>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="State">
                        <ItemTemplate>

                            <asp:Label ID="lblstate" runat="server" Text='<%#Eval("state")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="City">
                        <ItemTemplate>
                            <asp:Label ID="lblcity" runat="server" Text='<%#Eval("city")%>'></asp:Label>

                        </ItemTemplate>
                    </asp:TemplateField>



                    <asp:TemplateField HeaderText="Image">
                        <ItemTemplate>
                         <img src='<%# Eval("Image", "~/Image_Upload") %>' style="width: 80px; height: 100px;" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:FileUpload runat="server" ID="fileupload" />
                        </EditItemTemplate>
                    </asp:TemplateField>




                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                            <asp:Button ID="btnupdate" runat="server" Text="Edit" CssClass="btn btn-sm btn-warning" CommandName="Edit" />

                            <asp:Button ID="btndelete" runat="server" Text="Delete" CssClass="btn btn-sm btn-primary" RowIndex='<%#Container.DisplayIndex %>' CommandName="Delete" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Button ID="btn_update" runat="server" Text="Update" CssClass="btn btn-sm btn-primary" RowIndex='<%#Container.DisplayIndex %>' CommandName="Update" />


                            <asp:Button ID="btn_Cancel" runat="server" Text="Cancel" CssClass="btn btn-sm btn-danger" RowIndex='<%#Container.DisplayIndex %>' CommandName="Cancel" />
                        </EditItemTemplate>

                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            </div>
    </form>
</body>
</html>
