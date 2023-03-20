report 50101 "CSD SubScription Customers"
{
    Caption = 'Subscription Customers';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = Simple;


    dataset
    {
        dataitem(Customer; Customer)
        {
            DataItemTableView = where("Subscription Customer" = const(true));
            RequestFilterFields = "No.";
            column(No_; "No.")
            {
                IncludeCaption = true;
            }
            column(Name; Name)
            {
                IncludeCaption = true;
            }
            column(City; City)
            {
                IncludeCaption = true;
            }
            column(Last_Modified_Date_Time; "Last Modified Date Time")
            {
                IncludeCaption = true;
            }
            column(Balance__LCY_; "Balance (LCY)")
            {
                IncludeCaption = true;
            }
        }
        dataitem("Company Information"; "Company Information")
        {
            column(Picture; Picture)
            {

            }
            column(CompanyName; Name)
            {

            }
        }
    }


    rendering
    {
        layout(Simple)
        {
            Type = RDLC;
            LayoutFile = './Layouts/CSD_Customer_Subscription.rdl';
        }
    }

    labels

    {
        ReportNameCap = 'Customer List';
        TotalCap = 'Total';
        OfCap = ' of ';
        PageNoCap = 'Page No';
    }

    trigger OnInitReport()

    begin
        "Company Information".CalcFields(Picture);
    end;
}