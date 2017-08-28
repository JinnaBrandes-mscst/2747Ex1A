<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="JBrandes2747Ex1A._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

     <div class="jumbotron" style="padding: 12px;">
        <h2>JBrandes 2747 Ex1A</h2>
        <p>Sample WebForms app using bound control</p>
    </div>
    <div class="row">
        <div class="col-md-8">
            <h2>Regions/Countries</h2>

            <div class="form-group">
                <label for=" ">Region:</label>
                <asp:DropDownList ID="RegionsDropDownList" runat="server" 
                    DataSourceID="RegionsSqlDataSource" 
                    DataTextField="Region" 
                    DataValueField="Region" 
                    CssClass="form-control"></asp:DropDownList>                         
            </div>

             <div class="form-group">
                <label for="CountriesDropDownList">Country:</label>
                 <asp:DropDownList ID="CountriesDropDownList" runat="server" 
                     DataSourceID="CountriesSqlDataSource" 
                     DataTextField="CountryName" 
                     DataValueField="CountryName"
                     CssClass="form-control"></asp:DropDownList>              
                 
            </div>

            <div class="form-group">
                <label for=" ">State:</label>
                <asp:GridView ID="StateGridView" 
                    runat="server" 
                    AutoGenerateColumns="False"
                    DataKeyNames="StateProvinceID" 
                    DataSourceID="StateSqlDataSource"
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
                
                <asp:SqlDataSource ID="RegionsSqlDataSource" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:WideWorldConnectionString %>" 
                    SelectCommand="SELECT DISTINCT Region FROM Application.Countries ORDER BY Region"></asp:SqlDataSource>  

                <asp:SqlDataSource ID="CountriesSqlDataSource" runat="server" 
                     ConnectionString="<%$ ConnectionStrings:WideWorldConnectionString %>" 
                     SelectCommand="SELECT CountryName, CountryID, Region FROM Application.Countries WHERE (Region = N'Europe') ORDER BY CountryName"></asp:SqlDataSource>
                 
                <asp:SqlDataSource ID="StateSqlDataSource" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:WideWorldConnectionString %>" 
                    SelectCommand="SELECT StateProvinceID, StateProvinceCode, StateProvinceName, CountryID, SalesTerritory FROM Application.StateProvinces WHERE (CountryID = 230) ORDER BY SalesTerritory, StateProvinceName"></asp:SqlDataSource>               
            </div>
         </div>

        <div class="col-md-4">
            <h2>Default.aspx Features:</h2>
            <ul>
                <li>ASP.Net Web Forms</li>
                <li>Bound Controls</li>
                <li>&quot;Wide World Importers&quot; sample database</li>
                <li>User generated events are ignored</li>
            </ul>           
        </div>        
    
        </div>
</asp:Content>
