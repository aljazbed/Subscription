pageextension 50100 "CSD CustomerCard_Ext" extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field("Subscription Customer"; Rec."Subscription Customer")
            {
                ApplicationArea = All;
            }
        }

        addfirst(factboxes)
        {
            part("Subscription Factbox"; "CSD Subscription Factbox")
            {
                SubPageLink = "Customer No." = FIELD("No.");
                ApplicationArea = All;
            }

        }

    }

    actions
    {
        // Add changes to page actions here
        addafter(Contact)
        {
            action("Subscriptions")
            {
                ApplicationArea = All;
                Caption = 'Subscriptions';
                RunObject = page "CSD Customer Subscriptions";
                RunPageLink = "Customer No." = field("No.");
                Image = InsuranceRegisters;
                Promoted = true;
                PromotedCategory = Process;
            }
        }
    }

    var
        myInt: Integer;
}