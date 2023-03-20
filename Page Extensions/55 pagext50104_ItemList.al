pageextension 50104 "Item List Ext" extends "Item List"
{
    layout
    {
        // Add changes to page layout here
        addfirst(FactBoxes)
        {
            part("Subscription FactBox"; "CSD Subscription Factbox")
            {
                SubPageLink = "Item No." = FIELD("No.");
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
        addlast(navigation)
        {
            action("Subscriptions")
            {
                ApplicationArea = All;
                Caption = 'Subscriptions';
                RunObject = page "CSD Customer Subscriptions";
                RunPageLink = "Item No." = FIELD("No.");
                image = InsuranceRegisters;
                Promoted = true;
                PromotedCategory = Process;
            }
        }
    }

    var
        myInt: Integer;
}