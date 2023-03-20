pageextension 50105 "BusinessManager RoleCenter Ext" extends "Business Manager Role Center"
{


    actions
    {
        addafter("Posted Purchase Return Shipments")
        {
            action("Subscriptions")
            {
                Caption = 'Subscriptions';
                Promoted = true;
                PromotedIsBig = true;
                image = InsuranceRegisters;
                RunObject = page "CSD Subscription List";
                ApplicationArea = All;
            }
            action("Create Subscription Invoices")
            {
                Caption = 'Create Subscription Invoices';
                Promoted = true;
                PromotedIsBig = true;
                image = CreateJobSalesInvoice;
                RunObject = report "CSD Create Invoices";
                ApplicationArea = All;
            }

            action("Subscription Customers")
            {
                Caption = 'Subscription Customers';
                Promoted = true;
                PromotedIsBig = true;
                image = Report;
                RunObject = report "CSD SubScription Customers";
                ApplicationArea = All;
            }


        }
    }


}