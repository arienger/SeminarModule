table 123456702 "CSD Seminar"
{
    // CSD1.00 - 2018-06-28 - areng
    DataClassification = ToBeClassified;
    Caption = 'Seminar';
    LookupPageId = "CSD Seminar List";
    DrillDownPageId = "CSD Seminar List";

    fields
    {
        field(10; "No."; Code[20])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate();
            begin
                if "No." <> xRec."No." then begin
                    SeminarSetup.GET;
                    NoSeriesManagement.TestManual(SeminarSetup."Seminar Nos."); "No. Series" := ''; end;
            end;
        }
        field(20; Name; Text[50])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate();
            begin
                if("Search Name" = UpperCase(xRec.Name)) or("Search Name" = '') then
                    "Search Name" := Name;
            end;
        }
        field(30; "Seminar Duration"; Decimal)
        {
            DecimalPlaces = 0 : 1;
            DataClassification = ToBeClassified;
        }
        field(40; "Minimum Participants"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50; "Maximum Participants"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(60; "Search Name"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(70; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(80; "Last Date Modified"; Date)
        {
            Editable = false;
            DataClassification = ToBeClassified;
        }
        field(90; Comment; Boolean)
        {
            Editable = false;
            FieldClass = FlowField;
            //CalcFormula=exist("Seminar Comment Line" where("Table Name"= const("Seminar"),"No."=Field("No.")));            
        }
        field(100; "Seminar Price"; Decimal)
        {
            AutoFormatType = 1;
            DataClassification = ToBeClassified;
        }
        field(110; "Gen. Prod. Posting Group"; Code[10])
        {
            TableRelation = "Gen. Product Posting Group";
            DataClassification = ToBeClassified;
            trigger OnValidate();
            var
            begin
                if(xRec."Gen. Prod. Posting Group" <> "Gen. Prod. Posting Group") then begin
                    if GenProductPostingGroup.ValidateVatProdPostingGroup(GenProductPostingGroup, "Gen. Prod. Posting Group") then
                        Validate("VAT Prod. Posting Group", GenProductPostingGroup."Def. VAT Prod. Posting Group");
                end;
            end;
        }
        field(120; "VAT Prod. Posting Group"; Code[10])
        {
            TableRelation = "VAT Product Posting Group";
            DataClassification = ToBeClassified;
        }
        field(130; "No. Series"; Code[10])
        {
            Editable = false;
            TableRelation = "No. Series";
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
        key(Key2; "Search Name")
        {

        }
    }

    var
        SeminarSetup: Record "CSD Seminar Setup";
        Seminar: Record "CSD Seminar";
        GenProductPostingGroup: Record "Gen. Product Posting Group";
        NoSeriesManagement: Codeunit NoSeriesManagement;

        //"CommentLine" : Record "CSD Seminar Comment Line";

    trigger OnInsert();
    begin
        if "No." = '' then begin
            if SeminarSetup.Get then begin
                SeminarSetup.TestField("Seminar Nos.");
                NoSeriesManagement.InitSeries(SeminarSetup."Seminar Nos.", xRec."No. Series", 0D, "No.", "No. Series");
            end;
        end;
    end;

    trigger OnModify();
    begin
        "Last Date Modified" := Today;
    end;

    trigger OnDelete();
    begin
        // CommentLine.Reset;
        // CommentLine.SetRange("Table Name", CommentLine."Table Name"::Seminar);
        // CommentLine.SetRange("No.", "No.");
        // CommentLine.DeleteAll;
    end;

    trigger OnRename();
    begin
        "Last Date Modified" := Today;
    end;

    procedure AssistEdit(): Boolean;
    begin
        with Seminar do
        begin
            Seminar := Rec; SeminarSetup.get; SeminarSetup.TestField("Seminar Nos.");
            if NoSeriesManagement.SelectSeries(SeminarSetup."Seminar Nos.", xRec."No. Series", "No. Series") then begin
                NoSeriesManagement.SetSeries("No."); Rec := Seminar; exit(true);
            end;
        end;
    end;
}