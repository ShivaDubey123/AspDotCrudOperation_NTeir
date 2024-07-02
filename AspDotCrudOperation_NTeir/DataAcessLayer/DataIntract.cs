using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using AspDotCrudOperation_NTeir.Connection;
using System.Xml.Linq;
using AspDotCrudOperation_NTeir.BussinessLayer;
using System.EnterpriseServices;
using System.IO;
using System.Web.UI.WebControls;


namespace AspDotCrudOperation_NTeir.DataAcessLayer
{
    public class DataIntract
    {
        SqlConnection con = new SqlConnection(database.str);
        DataTable t = new DataTable();

        public DataTable Bind_State()
        {
            
       
            SqlCommand cmd = new SqlCommand("select sid,state from State",con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            return dt;

            
        }

        public DataTable Bind_City(string sid)
        {
              

            SqlCommand cmd = new SqlCommand("select * from city where sid ='" + sid + "'",con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            return dt;
        }
            public int Insert(string name, string Dob, string Mobileno, string Email, string state, string city, string fileName)
            {
           

            SqlCommand cmd = new SqlCommand("sp_AllGetEmployee", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@flag", 1);
            cmd.Parameters.AddWithValue("@id", 0);
            cmd.Parameters.AddWithValue("@Name", name);
            cmd.Parameters.AddWithValue("@Dob", Dob);
            cmd.Parameters.AddWithValue("@Mobileno", Mobileno);
            cmd.Parameters.AddWithValue("@Email", Email);

            cmd.Parameters.AddWithValue("@state",state);
            cmd.Parameters.AddWithValue("@city", city);
            cmd.Parameters.AddWithValue("@Image", fileName);
            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();
            if (i> 0)
            {
                return  1;
            }
            else
            {
                return  0;
            }

           }


        public int Update( string id,string name, string Dob, string Email, string Mobileno, string state, string city, string fileName)
        {
            SqlCommand cmd = new SqlCommand("sp_AllGetEmployee", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@flag", 2);
            cmd.Parameters.AddWithValue("@Id",id);
            cmd.Parameters.AddWithValue("@Name", name);
            cmd.Parameters.AddWithValue("@Dob", Convert.ToDateTime(Dob));
            cmd.Parameters.AddWithValue("@Email", Email);
            cmd.Parameters.AddWithValue("@Mobileno", Mobileno);
            cmd.Parameters.AddWithValue("@state", state);
            cmd.Parameters.AddWithValue("@city", city);
            cmd.Parameters.AddWithValue("@Image", fileName);
            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();
            if (i > 0)
            {
                return 1;
            }
            else
            {
                return 0;
            }

        }

        public int Delete(string id)
        {
            SqlCommand cmd = new SqlCommand("sp_AllGetEmployee", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@flag", 4);
            cmd.Parameters.AddWithValue("@Id", id);
          
            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();
            if (i > 0)
            {
                return 1;
            }
            else
            {
                return 0;
            }

        }



        public DataTable GetAllReports()
        {
            DataTable dt = new DataTable();
            try
            {

                SqlCommand sql = new SqlCommand("sp_AllGetEmployee", con);
                sql.CommandType = CommandType.StoredProcedure;
                sql.Parameters.AddWithValue("@flag", 3);
                DataTable dt1 = new DataTable();
                SqlDataAdapter sda = new SqlDataAdapter(sql);
                sda.Fill(dt1);
                if (dt1.Rows.Count > 0)
                {
                    dt = dt1;
                }

            }
            catch (Exception ex)
            {

            }
            return dt;



        }




    }
}