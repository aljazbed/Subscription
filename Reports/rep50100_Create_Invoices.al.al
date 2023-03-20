report 50100 "CSD Create Invoices"
{
    Caption = 'Create Subscription Invoices';
    ProcessingOnly = true;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    //DefaultRenderingLayout = LayoutName;

    dataset
    {
        dataitem("“CSD Customer Subscription”"; "“CSD Customer Subscription”")
        {
            RequestFilterFields = "Customer No.", "Item No.";

            trigger OnPreDataItem();
            begin
                IF NOT CONFIRM(CreateWarningTxt) THEN CurrReport.Quit;
                "“CSD Customer Subscription”".SETRANGE(Active, TRUE);
                "“CSD Customer Subscription”".SETFILTER("Next Invoicing Date", '<=%1', WORKDATE);
            end;


            trigger OnAfterGetRecord();
            var
                SalesLine: Record "Sales Line";
                OldCustomer: Code[20];
                OldInvoiceDate: Date;
                NextLineNo: Integer;

            begin
                IF (OldCustomer <> "“CSD Customer Subscription”"."Customer No.") OR (OldInvoiceDate <> "“CSD Customer Subscription”"."Next Invoicing Date") THEN BEGIN
                    OldCustomer := "“CSD Customer Subscription”"."Customer No.";
                    OldInvoiceDate := "“CSD Customer Subscription”"."Next Invoicing Date";
                    NextLineNo := 0;
                    CLEAR(SalesHeader);
                    SalesHeader."Document Type" := SalesHeader."Document Type"::Invoice;
                    SalesHeader.INSERT(TRUE);
                    SalesHeader.VALIDATE("Sell-to Customer No.", "“CSD Customer Subscription”"."Customer No.");
                    SalesHeader.VALIDATE("Location Code", '');
                    SalesHeader.VALIDATE("Posting Date", "“CSD Customer Subscription”"."Next Invoicing Date");
                    SalesHeader.Modify();
                    InvoiceCounter += 1;
                END;
                NextLineNo += 10000;
                SalesLine.INIT;
                SalesLine."Line No." := NextLineNo;
                SalesLine."Document Type" := SalesHeader."Document Type";
                SalesLine."Document No." := SalesHeader."No.";
                SalesLine.VALIDATE("Sell-to Customer No.", SalesHeader."Sell-to Customer No.");
                SalesLine.INSERT;
                SalesLine.VALIDATE(Type, SalesLine.Type::Item);
                SalesLine.VALIDATE("No.", "“CSD Customer Subscription”"."Item No.");
                SalesLine.VALIDATE(Quantity, 1);
                SalesLine.VALIDATE("Allow Line Disc.", "“CSD Customer Subscription”"."Allow Line Discount");
                SalesLine.VALIDATE("Unit Price", "“CSD Customer Subscription”"."Invoicing Price");
                SalesLine.MODIFY;
            end;

            trigger OnPostDataItem();
            begin
                MESSAGE(InvCounterTxt, InvoiceCounter, SalesHeader."Document Type");
            end;
        }
    }
    var
        InvoiceCounter: Integer;
        CreateWarningTxt: Label 'Create subscriptions for all customers?';
        InvCounterTxt: Label '%1 %2(s) Created';
        SalesHeader: Record "Sales Header";
}
