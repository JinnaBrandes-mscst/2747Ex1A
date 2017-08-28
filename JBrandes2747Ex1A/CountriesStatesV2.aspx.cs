using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace JBrandes2747Ex1A2
{
    public partial class CountriesStatesV2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                string WideWorldConnectionString =
                    ConfigurationManager.ConnectionStrings["WideWorldConnectionString"].ConnectionString;
                string regionsSelectCmdString =
                    "SELECT DISTINCT Region FROM Application.Countries ORDER BY Region";
                SqlDataSource regionSqlDataSource = new SqlDataSource(WideWorldConnectionString, regionsSelectCmdString);
                this.RegionsDropDownList.DataSource = regionSqlDataSource;
                this.RegionsDropDownList.DataValueField = "Region";
                this.RegionsDropDownList.DataTextField = "Region";
                this.RegionsDropDownList.SelectedValue = "Americas";
                this.RegionsDropDownList.DataBind();

                string countriesSelectCmdString =
                    "SELECT CountryName, CountryID, Region FROM Application.Countries WHERE (Region = N'Americas') ORDER BY CountryName";
                SqlDataSource countriesSqlDataSource = new SqlDataSource(WideWorldConnectionString, countriesSelectCmdString);
                this.CountriesDropDownList.DataSource = countriesSqlDataSource;
                this.CountriesDropDownList.DataValueField = "CountryID";
                this.CountriesDropDownList.DataTextField = "CountryName";
                this.CountriesDropDownList.SelectedValue = "230";
                this.CountriesDropDownList.DataBind();

                string statesSelectCmdString =
                    "SELECT StateProvinceID, StateProvinceCode, StateProvinceName, CountryID, SalesTerritory FROM Application.StateProvinces WHERE (CountryID = 230) ORDER BY SalesTerritory, StateProvinceName";
                SqlDataSource statesSqlDataSource = new SqlDataSource(WideWorldConnectionString, statesSelectCmdString);
                this.StateGridView.DataSource = statesSqlDataSource;
                this.StateGridView.DataBind();
            }
        }

        protected void SelectedRegionChange(object sender, EventArgs e)
        {
            string WideWorldConnectionString =
                    ConfigurationManager.ConnectionStrings["WideWorldConnectionString"].ConnectionString;
            string countriesSelectCmdString =
                     "SELECT CountryName, CountryID, Region FROM Application.Countries WHERE (Region = @Region) ORDER BY CountryName";
            SqlDataSource countriesSqlDataSource = new SqlDataSource(WideWorldConnectionString, countriesSelectCmdString);
            countriesSqlDataSource.SelectParameters.Add("Region", this.RegionsDropDownList.SelectedValue);
            this.CountriesDropDownList.DataSource = countriesSqlDataSource;
            this.CountriesDropDownList.DataValueField = "CountryID";
            this.CountriesDropDownList.DataTextField = "CountryName";
            this.CountriesDropDownList.DataBind();
        }

        protected void SelectedCountryChange(object sender, EventArgs e)
        {
            string WideWorldConnectionString =
                   ConfigurationManager.ConnectionStrings["WideWorldConnectionString"].ConnectionString;
            string statesSelectCmdString =
                    "SELECT StateProvinceID, StateProvinceCode, StateProvinceName, CountryID, SalesTerritory FROM Application.StateProvinces WHERE (CountryID = @Country) ORDER BY SalesTerritory, StateProvinceName";
            SqlDataSource statesSqlDataSource = new SqlDataSource(WideWorldConnectionString, statesSelectCmdString);
            statesSqlDataSource.SelectParameters.Add("Country", this.CountriesDropDownList.SelectedValue);
            this.StateGridView.DataSource = statesSqlDataSource;
            this.StateGridView.DataBind();
        }
    }
}