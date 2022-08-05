﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaModelo
{
    public class Producto
    {
        public int IdProducto { get; set; }
        public string Codigo { get; set; }
        public int ValorCodigo { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public int IdCategoria { get; set; }
        public Categoria oCategoria { get; set; }
        public bool Activo { get; set; }
        public int IdColor { get; set; }
        public Color oColor { get; set; }
        public string Medida { get; set; }
        public int Costo { get; set; }
        public int PrecioVenta { get; set; }

    }
}
