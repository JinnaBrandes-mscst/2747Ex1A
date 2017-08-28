<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CountriesStatesV2.aspx.cs" Inherits="JBrandes2747Ex1A2.CountriesStatesV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron" style="padding: 12px;">
        <h2>JBrandes 2747 Ex1A</h2>
        <p>Sample WebForms app using bound control</p>
    </div>
    <div class="row">
        <div class="col-md-8">
            <h2>Regions/Countries</h2>

            <div class="form-group">
                <label for=" ">Region:</label>
                <asp:DropDownList ID="RegionsDropDownList" 
                    runat="server"
                    CssClass="form-control" 
                    AutoPostBack="True" OnSelectedIndexChanged="SelectedRegionChange">
                </asp:DropDownList>                         
            </div>

             <div class="form-group">
                <label for="CountriesDropDownList">Country:</label>
                 <asp:DropDownList ID="CountriesDropDownList" 
                     runat="server"                
                     CssClass="form-control" 
                     AutoPostBack="True" OnSelectedIndexChanged="SelectedCountryChange">
                 </asp:DropDownList>            
              </div>

            <div class="form-group">
                <label for=" ">State:</label>
                <asp:GridView ID="StateGridView" 
                    runat="server" 
                    AutoGenerateColumns="False"
                    DataKeyNames="StateProvinceID"               
                    CssClass="table table-striped table-bordered">

                    <Columns>
                        <asp:BoundField DataField="SalesTerritory" 
                            HeaderText="Sales Territory" 
                            SortExpression="SalesTerritory" />

                        <asp:BoundField DataField="StateProvinceID" 
                            HeaderText="State ID" 
                            ReadOnly="True" 
                            SortExpression="StateProvinceID" Visible="False" />

                        <asp:BoundField DataField="StateProvinceCode" 
                            HeaderText="State Code" 
                            SortExpression="StateProvinceCode" />

                        <asp:BoundField DataField="StateProvinceName" 
                            HeaderText="State Name" 
                            SortExpression="StateProvinceName" />

                        <asp:BoundField DataField="CountryID" 
                            HeaderText="CountryID" 
                            SortExpression="CountryID" Visible="False" />
                    </Columns>
                </asp:GridView> 
            </div>
         </div>

         <div class="col-md-4">
            <h2>CountriesStatesV2.aspx Features:</h2>
            <ul>
                <li>Parameterized SQL queries</li>
                <li>ADO.Net objects created in C#</li>
                <li>ASP.Net Web Forms</li>
                <li>Bound Controls</li>
                <li>&quot;Wide World Importers&quot; sample database</li>
            </ul>           
        </div>        
    
        </div>
</asp:Content>
