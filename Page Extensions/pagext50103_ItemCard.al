pageextension 50103 "CSD ItemCard Ext." extends "Item Card"
{
    layout
    {
        addlast(Item)
        {
            field("CSD Subscription Item"; Rec."CSD Subscription Item")
            {
                ApplicationArea = all;
            }
        }

        addfirst(factboxes)
        {

            part("Subscription Factbox"; "CSD Subscription Factbox")
            {
                SubPageLink = "Item No." = field("No.");
                ApplicationArea = All;
            }
        }

    }

    actions
    {
        addlast(navigation)
        {
            action("Subscriptions")
            {
                Caption = 'Subscriptions';
                ApplicationArea = All;
                RunObject = page "CSD Customer Subscriptions";
                RunPageLink = "Item No." = field("No.");
                image = InsuranceRegisters;
                Promoted = true;
                PromotedCategory = Process;
            }
        }
    }

    var
        myInt: Integer;
}