codeunit 123456739 "CSD EventSubscrptions"
{
    trigger OnRun();
    begin
    end;

    var
        myInt: Integer;

    [EventSubscriber(ObjectType::Codeunit, 212, 'OnBeforeResLedgEntryInsert', '', true, true)]
    local procedure PostResJnlLineOnBeforeResLedgEntryInsert(var ResLedgerEntry: Record "Res. Ledger Entry"; ResJournalLine: Record "Res. Journal Line");
    var

    begin
        ResLedgerEntry."CSD Seminar No." := ResJournalLine."CSD Seminar No."; 
        ResLedgerEntry."CSD Seminar Registration No." := ResJournalLine."CSD Seminar Registration No.";
    end;
}