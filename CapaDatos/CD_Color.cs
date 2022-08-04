using CapaModelo;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDatos
{
    public class CD_Color
    {
        public static CD_Color _instancia = null;

        private CD_Color()
        {

        }

        public static CD_Color Instancia
        {
            get
            {
                if (_instancia == null)
                {
                    _instancia = new CD_Color();
                }
                return _instancia;
            }
        }

        public List<Color> ObtenerColor()
        {
            List<Color> rptListaColor = new List<Color>();
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                SqlCommand cmd = new SqlCommand("usp_ObtenerColor", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;

                try
                {
                    oConexion.Open();
                    SqlDataReader dr = cmd.ExecuteReader();

                    while (dr.Read())
                    {
                        rptListaColor.Add(new Color()
                        {
                            IdColor = Convert.ToInt32(dr["IdColor"].ToString()),
                            Descripcion = dr["Descripcion"].ToString()
                         });
                    }
                    dr.Close();

                    return rptListaColor;

                }
                catch (Exception ex)
                {
                    rptListaColor = null;
                    return rptListaColor;
                }
            }
        }

        public bool RegistrarColor(Color oColor)
        {
            bool respuesta = true;
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("usp_RegistrarColor", oConexion);
                    cmd.Parameters.AddWithValue("Descripcion", oColor.Descripcion);
                    cmd.Parameters.Add("Resultado", SqlDbType.Bit).Direction = ParameterDirection.Output;
                    cmd.CommandType = CommandType.StoredProcedure;
     
                    oConexion.Open();
     
                    cmd.ExecuteNonQuery();
     
                    respuesta = Convert.ToBoolean(cmd.Parameters["Resultado"].Value);
     
                }
                catch (Exception ex)
                {
                    respuesta = false;
                }
            }
            return respuesta;
        }
     
     //   public bool ModificarCategoria(Categoria oCategoria)
     //   {
     //       bool respuesta = true;
     //       using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
     //       {
     //           try
     //           {
     //               SqlCommand cmd = new SqlCommand("usp_ModificarCategoria", oConexion);
     //               cmd.Parameters.AddWithValue("IdCategoria", oCategoria.IdCategoria);
     //               cmd.Parameters.AddWithValue("Descripcion", oCategoria.Descripcion);
     //               cmd.Parameters.AddWithValue("Activo", oCategoria.Activo);
     //               cmd.Parameters.Add("Resultado", SqlDbType.Bit).Direction = ParameterDirection.Output;
     //
     //               cmd.CommandType = CommandType.StoredProcedure;
     //
     //               oConexion.Open();
     //
     //               cmd.ExecuteNonQuery();
     //
     //               respuesta = Convert.ToBoolean(cmd.Parameters["Resultado"].Value);
     //
     //           }
     //           catch (Exception ex)
     //           {
     //               respuesta = false;
     //           }
     //
     //       }
     //
     //       return respuesta;
     //
     //   }
     //
     //   public bool EliminarCategoria(int IdCategoria)
     //   {
     //       bool respuesta = true;
     //       using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
     //       {
     //           try
     //           {
     //               SqlCommand cmd = new SqlCommand("usp_EliminarCategoria", oConexion);
     //               cmd.Parameters.AddWithValue("IdCategoria", IdCategoria);
     //               cmd.Parameters.Add("Resultado", SqlDbType.Bit).Direction = ParameterDirection.Output;
     //               cmd.CommandType = CommandType.StoredProcedure;
     //
     //               oConexion.Open();
     //
     //               cmd.ExecuteNonQuery();
     //
     //               respuesta = Convert.ToBoolean(cmd.Parameters["Resultado"].Value);
     //
     //           }
     //           catch (Exception ex)
     //           {
     //               respuesta = false;
     //           }
     //
     //       }
     //
     //       return respuesta;
     //
     //   }
    }//
}


