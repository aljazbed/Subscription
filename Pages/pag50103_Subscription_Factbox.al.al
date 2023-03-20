page 50103 "CSD Subscription Factbox"
{
    Caption = 'CSD Subscription Factbox';
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "“CSD Customer Subscription”";

    layout
    {
        area(Content)
        {
            group(Group)
            {
                field("Subscription Code"; Rec."Subscription Code")
                {
                    ApplicationArea = All;

                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                }
                field("Cancelled Date"; Rec."Cancelled Date")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}