tableextension 123456703 ResourceLedgerEntryExt extends "Res. Ledger Entry"
{
    fields
    {
        field(123456700; "CSD Seminar No."; code[20])
        {
            Caption = 'Seminar No.';
            TableRelation = "CSD Seminar";
        }
        field(123456701; "CSD Seminar Registration No."; code[20])
        {
            Caption = 'Seminar Registration No.';
            TableRelation = "CSD Seminar Reg. Header";
        }
    }

}