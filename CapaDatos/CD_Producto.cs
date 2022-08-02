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
    public class CD_Producto
    {
        public static CD_Producto _instancia = null;

        private CD_Producto()
        {

        }

        public static CD_Producto Instancia
        {
            get
            {
                if (_instancia == null)
                {
                    _instancia = new CD_Producto();
                }
                return _instancia;
            }
        }

        public List<Producto> ObtenerProducto()
        {
            List<Producto> rptListaProducto = new List<Producto>();
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                SqlCommand cmd = new SqlCommand("usp_ObtenerProductos", oConexion)
                {
                    CommandType = CommandType.StoredProcedure
                };
                oConexion.Open();
                using (var orders = cmd.ExecuteReader())
                    try
                {
                    
                    while (orders.Read())
                    {
                        rptListaProducto.Add(new Producto()
                        {
                            IdProducto = Convert.ToInt32(orders[0].ToString()),
                            Codigo = orders[1].ToString(),
                            ValorCodigo = Convert.ToInt32(orders[2].ToString()),
                            Nombre = orders[3].ToString(),
                            Descripcion = orders[4].ToString(),
                            IdCategoria = Convert.ToInt32(orders[5].ToString()),
                            oCategoria = new Categoria() { Descripcion = orders[11].ToString() },
                            Activo = Convert.ToBoolean(orders[10].ToString()),
                            IdColor = Convert.ToInt32(orders[6].ToString()),
                            oColor = new Color() { Descripcion = orders[12].ToString() },
                            Medida = orders[7].ToString(),
                            Costo = Convert.ToInt32(orders[8].ToString()),
                            PrecioVenta = Convert.ToInt32(orders[9].ToString())
                            

                        });
                    }
                    orders.Close();

                    return rptListaProducto;

                }
                catch (Exception ex)
                {
                    rptListaProducto = null;
                    return rptListaProducto;
                }
            }
        }

        public bool RegistrarProducto(Producto oProducto)
        {
            bool respuesta = true;
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("usp_RegistrarProducto", oConexion);
                    cmd.Parameters.AddWithValue("Nombre", oProducto.Nombre);
                    cmd.Parameters.AddWithValue("Descripcion", oProducto.Descripcion);
                    cmd.Parameters.AddWithValue("IdCategoria", oProducto.IdCategoria);
                    cmd.Parameters.AddWithValue("IdColor", oProducto.IdColor);
                    cmd.Parameters.AddWithValue("Medida", oProducto.Medida);
                    cmd.Parameters.AddWithValue("Costo", oProducto.Costo);
                    cmd.Parameters.AddWithValue("PrecioVenta", oProducto.PrecioVenta);
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

        public bool ModificarProducto(Producto oProducto)
        {
            bool respuesta = true;
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("usp_ModificarProducto", oConexion);
                    cmd.Parameters.AddWithValue("IdProducto", oProducto.IdProducto);
                    cmd.Parameters.AddWithValue("Nombre", oProducto.Nombre);
                    cmd.Parameters.AddWithValue("Descripcion", oProducto.Descripcion);
                    cmd.Parameters.AddWithValue("IdCategoria", oProducto.IdCategoria);
                    cmd.Parameters.AddWithValue("Activo", oProducto.Activo);
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

        public bool EliminarProducto(int IdProducto)
        {
            bool respuesta = true;
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("usp_EliminarProducto", oConexion);
                    cmd.Parameters.AddWithValue("IdProducto", IdProducto);
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
    }
}
