<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaster.Master" AutoEventWireup="true" CodeBehind="frmProducto.aspx.cs" Inherits="SistemaVentas.frmProducto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="row">
            <div class="col-sm-12">
               <div class="card">
                  <div class="card-header">
                    Maestro de Artículos
                  </div>
                  <div class="card-body">
                        <div class="row">
                            <div class="col-sm-7">
                                <button id="btnNuevoProducto" type="button" class="btn btn-sm btn-success">Alta Producto</button>
                                <button id="btnIncrementos" type="button" class="btn btn-sm btn-warning">Cambio de Precios</button>
                                
                            </div>

                        </div>

                      <hr />
                        <div class="row mt-3">
                            <div class="col-sm-12">
                                <table id="tbProducto" class="table table-striped table-bordered nowrap compact" style="width:100%">
                                    <thead>
                                        <tr>
                                           <!-- <th>#</th> -->
                                            <th>Codigo</th>
                                            <th>Categoria</th>
                                            <th>Nombre</th>
                                            <th>Descripcion</th>
                                            <th>Color</th>
                                            <th>Medida</th>
                                            <th>Costo</th>
                                            <th>Precio Venta</th>
                                            <th>Estado</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                  </div>
                  <div class="card-footer">
                  </div>
                </div>
            </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="modalrol" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Producto</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <form>
              <input id="txtIdProducto" class="model" name="IdProducto" value="0" type="hidden" />
              <div class="form-group row">
                <label for="staticEmail" class="col-sm-2 col-form-label col-form-label-sm">Codigo</label>
                <div class="col-sm-10">
                  <input type="text" class="form-control form-control-sm model" id="txtCodigo" name="Codigo">
                </div>
              </div>
              <div class="form-group row">
                <label for="staticEmail" class="col-sm-2 col-form-label col-form-label-sm">Nombre</label>
                <div class="col-sm-10">
                  <input type="text" class="form-control form-control-sm model" id="txtNombre" name="Nombre">
                </div>
              </div>
              <div class="form-group row">
                <label for="staticEmail" class="col-sm-2 col-form-label col-form-label-sm">Descripcion</label>
                <div class="col-sm-10">
                  <input type="text" class="form-control form-control-sm model" id="txtDescripcion" name="Descripcion">
                </div>
              </div>

              <div class="form-group row">
                <label for="inputPassword" class="col-sm-2 col-form-label col-form-label-sm">Categoria</label>
                <div class="col-sm-10">
                    <select class="form-control form-control-sm model" id="cboCategoria" name="Categoria">
                    </select>
                </div>
              </div>
               <div class="form-group row">
                <label for="inputPassword" class="col-sm-2 col-form-label col-form-label-sm">Color</label>
                <div class="col-sm-10">
                    <select class="form-control form-control-sm model" id="cboColor" name="Color">
                    </select>
                   <!-- <button id="btnNuevoColor" type="button" data-toggle="modal" data-target="modalrolcolor" class="btn btn-sm btn-primary">Nuevo</button> -->
                </div>
              </div>
                <div class="form-group row">
                 <label for="staticEmail" class="col-sm-2 col-form-label col-form-label-sm">Medida:</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control form-control-sm model" id="txtmedida" name="Medida">
                  </div>
                </div>

                <div class="form-group row">
                 <label for="staticEmail" class="col-sm-2 col-form-label col-form-label-sm">Costo:</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control form-control-sm model" id="txtproductocosto" name="Costo">
                  </div>
                </div>              

                <div class="form-group row">
                 <label for="staticEmail" class="col-sm-2 col-form-label col-form-label-sm">Precio Venta:</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control form-control-sm model" id="txtprecioventa" name="PrecioVenta">
                  </div>
                </div> 

              <div class="form-group row">
                <label for="inputPassword" class="col-sm-2 col-form-label col-form-label-sm">Activo</label>
                <div class="col-sm-10">
                    <select class="form-control form-control-sm model" id="cboEstado" name="Activo">
                        <option value="1">Activo</option>
                        <option value="0">No Activo</option>
                    </select>
                </div>
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">Cerrar</button>
            <button id="btnGuardarCambios" type="button" class="btn btn-sm btn-primary">Guardar Cambios</button>
          </div>
        </div>
      </div>
    </div>

    <div class="modal fade" id="modalrol2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel2" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel2">Incremento de Precios</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <form>
          
              <div class="form-group row">
                <label for="inputPassword" class="col-sm-2 col-form-label col-form-label-sm">Productos</label>
                <div class="col-sm-10">
                    <select class="form-control form-control-sm model" id="cboProductos" name="Categoria">
                    </select>
                </div>
              </div>

                <div class="form-group row">
                 <label for="staticEmail" class="col-sm-2 col-form-label col-form-label-sm">Incremento %:</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control form-control-sm model" id="txtIncremento" name="PrecioVenta">
                  </div>
                </div> 

            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">Cerrar</button>
            <button id="btnGuardarCambios2" type="button" class="btn btn-sm btn-primary">Guardar Cambios</button>
          </div>
        </div>
      </div>
    </div>

    <script src="Controlador/frmProducto/frmProducto.js"></script>
</asp:Content>
