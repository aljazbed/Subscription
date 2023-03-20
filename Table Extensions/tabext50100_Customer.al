tableextension 50100 "CSD Customer_Ext" extends Customer
{
    fields
    {
        field(50100; "Subscription Customer"; Boolean)
        {


            FieldClass = FlowField;
            CalcFormula = Exist("“CSD Customer Subscription”" WHERE("Customer No." = FIELD("No."), Active = CONST(true)));
            Editable = false;
        }
    }

    var
        myInt: Integer;
}