pageextension 50102 "CSD Customer List Ext." extends "Customer List"
{
    layout
    {
        addfirst(factboxes)
        {
            part("Subscription Factbox"; "CSD Subscription Factbox")
            {
                SubPageLink = "Customer No." = field("No.");
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        addafter("C&ontact")
        {
            action("Subscriptions")
            {
                Caption = 'Subscriptions';
                ApplicationArea = all;
                RunObject = page "CSD Customer Subscriptions";
                RunPageLink = "Customer No." = field("No.");
                image = InsuranceRegisters;
                Promoted = true;
                PromotedCategory = Process;
            }
        }
    }

    var
        myInt: Integer;
}