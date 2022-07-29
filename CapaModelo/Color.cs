using CapaDatos;
using CapaModelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaModelo
{
    public class Color
    {
        public int IdColor { get; set; }
        public string Descripcion { get; set; }
        public DateTime FechaRegistro { get; set; }
    }


    public static Respuesta<List<Color>> ObtenerColor()
    {
        List<Color> oListaColor = new List<Color>();
        oListaColor = CD_Color.Instancia.ObtenerColor();

        if (oListaColor != null)
        {
            return new Respuesta<List<Color>>() { estado = true, objeto = oListaColor };
        }
        else
        {
            return new Respuesta<List<Color>>() { estado = false, objeto = null };
        }
    }
}