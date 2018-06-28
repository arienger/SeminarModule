tableextension 123456700 "CSD Resource Extension" extends Resource
{
    // CSD1.00 - 2018-06-28 - areng
    fields
    {
        field(123456701;"CSD Resource Type";Option)
        {
            Caption = 'Resource Type';
            OptionMembers = "Internal", "External";
            OptionCaption = 'Internal,External';
        }
        field(123456702;"CSD Maximum Partipants";Integer)
        {
            Caption = 'Maximum Participants';
        }
        field(123456703;"CSD Quantity Per Day";Decimal)
        {
            Caption = 'Quantity Per Day';
        }

        modify("Profit %") {
            trigger OnAfterValidate();
            var
            begin
               Rec.TestField("Unit Cost"); 
            end;
        }
    }
}