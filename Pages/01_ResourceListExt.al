pageextension 123456701 "CSD Resource List" extends "Resource List"
{
    layout
    {
        addafter(Type)
        {
            field("CSD Resource Type"; "CSD Resource Type")
            {

            }
            field("CSD Maximum Partipants"; "CSD Maximum Partipants")
            {
                Visible = ShowMaxField;
            }
        }

        modify(Type)
        {
            Visible = ShowType;
        }
    }

    actions
    {

    }

    trigger OnOpenPage();
    begin
        FilterGroup(3);
        ShowType := (GetFilter(Type) = '');
        ShowMaxField := (GetFilter(Type) = format(Type::Machine));
        FilterGroup(0);
    end;

    var
        [InDataSet]
        ShowMaxField: Boolean;
        [InDataSet]
        ShowType: Boolean;
}