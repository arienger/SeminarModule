codeunit 123456734 "CSD Seminar Reg.-Show Ledger"
{
    TableNo = "CSD Seminar Registers";

    trigger OnRun();
    begin
        SeminarLedgerEntry.SETRANGE("Entry No.","From Entry No.", "To Entry No.");
        page.Run(Page::"CSD Seminar Ledger Entries", SeminarLedgerEntry);
    end;
    
    var
        SeminarLedgerEntry : Record "CSD Seminar Ledger Entry";
}