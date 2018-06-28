page 123456706 "CSD Seminar Comment Line"
{
    PageType = List;
    SourceTable = "CSD Seminar Comment Line";
    Caption = 'Seminar Comment Line';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Date;Date)
                {

                }
                field(Code;Code)
                {
Visible=false;
                }
                field(Comment;Comment)
                {

                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(ActionName)
            {
                trigger OnAction();
                begin
                end;
            }
        }
    }
}