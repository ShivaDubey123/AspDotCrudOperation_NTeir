using AspDotCrudOperation_NTeir.Connection;
using AspDotCrudOperation_NTeir.DataAcessLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace AspDotCrudOperation_NTeir.BussinessLayer
{
    public class Logicbuild
    {
        SqlConnection con = new SqlConnection(database.str);
        DataIntract ds = new DataIntract();

        public DataTable getstate()
        {
            DataTable dt = new DataTable();
            dt = ds.Bind_State();
            return dt;
        }
        public DataTable getcity(string sid)
        {
            DataTable dt = new DataTable();
            dt = ds.Bind_City(sid);
            return dt;
        }

        public bool checklogin(string name, string Dob, string Mobileno, string Email ,string state, string city,string fileName)
        {
            try
            {

                int log= ds.Insert(name, Dob, Mobileno,Email,state,city,fileName) ;
                if (log == 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }


            }
            catch (Exception ex)
            {
                return false;
            }


        }


        public bool Update_Data(string id,string name, string Dob, string Email, string Mobileno, string state, string city, string fileName)
        {
            try
            {

                int log = ds.Update(id,name, Dob, Email,Mobileno, state, city, fileName);
                if (log == 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }


            }
            catch (Exception ex)
            {
                return false;
            }


        }

        public bool Delete_Data(string id)
        {
            try
            {

                int log = ds.Delete(id);
                if (log == 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }


            }
            catch (Exception ex)
            {
                return false;
            }


        }

        public DataTable GetAlldata()
        {
           
            DataTable dt = new DataTable();
            dt = ds.GetAllReports();

            return dt;
        }

           
        }
    }

    
