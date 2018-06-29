page 123456722 "CSD Seminar Registers"
{
    // CSD1.00 - 2018-01-01 - D. E. Veloper 
    // Chapter 7 - Lab 2-11
    
    PageType = List;
    SourceTable = "CSD Seminar Registers";
    Caption = 'Seminar Registers';
    Editable = false;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; "No.") { }
                field("Creation Date"; "Creation Date") { }
                field("User ID"; "User ID") { }
                field("Source Code"; "Source Code") { }
                field("Journal Batch Name"; "Journal Batch Name") { }
            }
        }
        area(factboxes)
        {
            systempart("Links"; Links)
            {
            }
            systempart("Notes"; Notes)
            {
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            action("Seminar Ledgers")
            {
                Image=WarrantyLedger; 
                RunObject=codeunit "CSD Seminar Reg.-Show Ledger";
            }
        }
    }
}