table 50101 "“CSD Customer Subscription”"
{
    Caption = 'CSD Customer Subscription';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            DataClassification = CustomerContent;
            TableRelation = Customer;
        }
        field(2; "Subscription Code"; Code[10])
        {
            Caption = 'Subscription Code';
            DataClassification = CustomerContent;
            TableRelation = "CSD Subscription";

            trigger OnValidate()
            var
                Subscription: Record "CSD Subscription";
                Item: Record Item;
            begin
                if xRec."Subscription Code" <> Rec."Subscription Code" then
                    Rec.TestField("Last Invoice Date", 0D);
                if Subscription.Get("Subscription Code") then begin
                    Subscription.TestField("Invoicing Frequence");
                    Subscription.TestField("Item Number");
                    "Item No." := Subscription."Item Number";
                    IF Subscription."Invoicing Price" <> 0 THEN
                        "Invoicing Price" := Subscription."Invoicing Price";
                    IF "Invoicing Price" = 0 THEN "Invoicing Price" := Item."Unit Price";
                    CASE Subscription."Invoicing Schedule" OF
                        Subscription."Invoicing Schedule"::"Beginning of Next Period":
                            "Start Date" := CALCDATE('<CM+1D>', WORKDATE);
                        Subscription."Invoicing Schedule"::"Beginning of Period":
                            "Start Date" := CALCDATE('-<CM>', WORKDATE);
                        Subscription."Invoicing Schedule"::"End of Period":
                            "Start Date" := CALCDATE('<CM>', WORKDATE);
                        Subscription."Invoicing Schedule"::"Posting Date":
                            "Start Date" := WORKDATE;

                    end;
                    "Next Invoicing Date" := "Start Date";
                    Active := TRUE;
                end;
            end;

        }
        field(3; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            DataClassification = CustomerContent;
            TableRelation = Item;
        }
        field(4; "Start Date"; Date)
        {
            Caption = 'Start Date';
            DataClassification = CustomerContent;
        }
        field(5; "Last Invoice Date"; Date)
        {
            Caption = 'Last Invoice Date';
            DataClassification = CustomerContent;
        }
        field(6; "Next Invoicing Date"; Date)
        {
            Caption = 'Next Invoicing Date';
            DataClassification = CustomerContent;
        }
        field(7; "Cancelled Date"; Date)
        {
            Caption = 'Cancelled Date';
            DataClassification = CustomerContent;
        }
        field(8; Active; Boolean)
        {
            Caption = 'Active';
            DataClassification = CustomerContent;
        }
        field(9; "Invoicing Price"; Decimal)
        {
            Caption = 'Invoicing Price';
            DataClassification = CustomerContent;
        }
        field(10; "Allow Line Discount"; Boolean)
        {
            Caption = 'Allow Line Discount';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; "Customer No.", "Subscription Code")
        {
            Clustered = true;
        }
    }



}