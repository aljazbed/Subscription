page 50102 "CSD Customer Subscriptions"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "“CSD Customer Subscription”";


    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;

                }
                field("Subscription Code"; Rec."Subscription Code")
                {
                    ApplicationArea = All;
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = All;
                }
                field("Last Invoice Date"; Rec."Last Invoice Date")
                {
                    ApplicationArea = All;
                }
                field("Next Invoicing Date"; Rec."Next Invoicing Date")
                {
                    ApplicationArea = All;
                }
                field("Cancelled Date"; Rec."Cancelled Date")
                {
                    ApplicationArea = All;
                }
                field(Active; Rec.Active)
                {
                    ApplicationArea = All;
                }
                field("Invoicing Price"; Rec."Invoicing Price")
                {
                    ApplicationArea = All;
                }
            }
        }

    }

    trigger OnOpenPage()
    var
        ShowCustomerField: Boolean;
    begin
        ShowCustomerField := Rec.GetFilter("Customer No.") = '';
    end;
}

