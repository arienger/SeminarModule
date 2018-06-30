pageextension 123456799 "CSD Session List Ext" extends "Session List"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addfirst(Session)
        {
            action("Stop Session") {
                Caption='Stop Session';
                Image=Stop;
                Promoted=true;
                PromotedIsBig=true;
                // kill Rec
                // https://www.olofsimren.com/kill-sessions-in-dynamics-nav/
            }
        }
    }    
}