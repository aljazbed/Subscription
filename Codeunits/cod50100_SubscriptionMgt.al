codeunit 50100 "CSD Subscription Management"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterPostSalesDoc', '', false, false)]
    local procedure UpdateSubscriptions(var SalesHeader: Record "Sales Header"; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; SalesShptHdrNo: Code[20]; RetRcpHdrNo: Code[20]; SalesInvHdrNo: Code[20]; SalesCrMemoHdrNo: Code[20])
    var
        CustomerSubscription: Record "“CSD Customer Subscription”";
        SalesInvLine: Record "Sales Invoice Line";
        Subscription: Record "CSD Subscription";

    begin
        IF (SalesInvHdrNo <> '') THEN BEGIN
            SalesInvLine.SETRANGE("Document No.", SalesInvHdrNo);
            SalesInvLine.SETRANGE(Type, SalesInvLine.Type::Item);
            IF SalesInvLine.FINDSET THEN
                REPEAT
                    CustomerSubscription.SETRANGE("Item No.", SalesInvLine."No.");
                    CustomerSubscription.SETRANGE(Active, TRUE);
                    IF CustomerSubscription.FINDFIRST THEN BEGIN
                        Subscription.GET(CustomerSubscription."Subscription Code");
                        CustomerSubscription."Last Invoice Date" := SalesHeader."Posting Date";
                        CustomerSubscription."Next Invoicing Date" := CALCDATE(Subscription."Invoicing Frequence", SalesHeader."Posting Date");
                        CustomerSubscription.MODIFY;
                    end;
                UNTIL SalesInvLine.NEXT = 0;
        END;
    end;

}