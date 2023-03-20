page 50101 "CSD Subscription List"
{
    Caption = 'Subscription List';
    PageType = List;
    SourceTable = "CSD Subscription";
    UsageCategory = Lists;
    CardPageId = "CSD Subscription Card";

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;

                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field("Item Number"; Rec."Item Number")
                {
                    ApplicationArea = All;
                }
                field("Invoicing Schedule"; Rec."Invoicing Schedule")
                {
                    ApplicationArea = All;
                }
                field("Invoicing Frequence"; Rec."Invoicing Frequence")
                {
                    ApplicationArea = All;
                }
                field("Invoicing Price"; Rec."Invoicing Price")
                {
                    ApplicationArea = All;
                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
}