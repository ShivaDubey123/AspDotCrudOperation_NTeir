using AspDotCrudOperation_NTeir.BussinessLayer;
using AspDotCrudOperation_NTeir.DataAcessLayer;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AspDotCrudOperation_NTeir
{
    public partial class LoginForm : System.Web.UI.Page
    {
        Logicbuild bl=new Logicbuild();
        DataIntract ds =new DataIntract();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            { 
              statebind();
                Getdata();
            }
        }
        private void statebind()
        {
            DataTable dt=new DataTable();
            dt = bl.getstate();
            ddlstate.DataSource = dt;
   
            ddlstate.DataTextField = "state";
            ddlstate.DataValueField = "sid";
            ddlstate.DataBind();
            
        }
        public void citybind()
        {
            string stid=ddlstate.SelectedValue;
            DataTable dt = new DataTable();
            dt = bl.getcity(stid);
            ddlcity.DataSource = dt;
            ddlcity.Items.Clear();

            ddlcity.DataTextField = "city";
            ddlcity.DataValueField = "cid";
            ddlcity.DataBind();

        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            if (txtname.Text != "" && txtname.Text != null || ddlcity.Text != "" && ddlcity.Text != null)
            {
                bool st = false;
                string fileName = "";
                if (FileUpload1.HasFiles)
                {
                    
                        
                        fileName = Path.GetFileName(FileUpload1.FileName);
                        string filePath = Server.MapPath("~/Image_Upload") + fileName;

                    
                        FileUpload1.SaveAs(filePath);
                    
                }

                st = bl.checklogin(txtname.Text, txtdob.Text, txtmobile.Text, txtemail.Text, ddlstate.SelectedItem.Text, ddlcity.SelectedItem.Text, fileName);
                Getdata();
                if (st == true)
                {
                    lblmsg.Text = "Data Inserted SuccessFully..";
                }
                else
                {
                    lblmsg.Text = "Try Again After Some Time";
                }
            }
            else
            {
                lblmsg.Text = "Please fill in all required fields.";
            }
            
        }


        protected void ddlstate_SelectedIndexChanged(object sender, EventArgs e)
        {
            citybind();
        }

        public void Getdata()
        {
            DataTable dt = new DataTable();
            dt = bl.GetAlldata();
            GV_Bind.DataSource = dt;
            GV_Bind.DataBind();

        }

        protected void GV_Bind_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GV_Bind.EditIndex = -1;
            Getdata();
        }

        protected void GV_Bind_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GV_Bind.EditIndex = e.NewEditIndex;
            Getdata();
        }

        protected void GV_Bind_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {


            string Filename = "";
            GridViewRow row = GV_Bind.Rows[e.RowIndex];
            Label lblid = GV_Bind.Rows[e.RowIndex].FindControl("lblid") as Label;

            TextBox txtfname = GV_Bind.Rows[e.RowIndex].FindControl("txtfname") as TextBox;

            TextBox txtage = GV_Bind.Rows[e.RowIndex].FindControl("txtage") as TextBox;
            TextBox txtemail = GV_Bind.Rows[e.RowIndex].FindControl("txtemail") as TextBox;
            TextBox txtmobile = GV_Bind.Rows[e.RowIndex].FindControl("txtmobile") as TextBox;
            Label lblstate = GV_Bind.Rows[e.RowIndex].FindControl("lblstate") as Label;
            Label lblcity = GV_Bind.Rows[e.RowIndex].FindControl("lblcity") as Label;
            FileUpload fileUpload = GV_Bind.Rows[e.RowIndex].FindControl("fileupload") as FileUpload;
            if (fileUpload.HasFile)
            {
                Filename = Path.GetFileName(fileUpload.FileName);
                fileUpload.SaveAs(Server.MapPath("~/Image_Upload") + Filename);
            }
            bool st = bl.Update_Data(lblid.Text, txtfname.Text, txtage.Text, txtemail.Text, txtmobile.Text, lblstate.Text, lblcity.Text, fileUpload.FileName);
            if (st == true)
            {
                lblmsg.Text = "Data Updated SuccessFully..";
            }
            else
            {
                lblmsg.Text = "Try Again After Some Time";
            }
            GV_Bind.EditIndex = -1;
            Getdata();
        }

        protected void GV_Bind_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = GV_Bind.Rows[e.RowIndex];
            Label lblid = GV_Bind.Rows[e.RowIndex].FindControl("lblid") as Label;

            bool st = bl.Delete_Data(lblid.Text);
            if(st== true)
            {
                lblmsg.Text = "Data Deleted SuccessFully..";
            }
            else
            {
                lblmsg.Text = "Try Again After Some Time";
            }
            GV_Bind.EditIndex = -1;
            Getdata();




        }
    }
}