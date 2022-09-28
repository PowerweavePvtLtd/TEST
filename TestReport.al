report 50902 "Vendor Notes"
{
    UsageCategory = Administration;
    ApplicationArea = All;
    Permissions = tabledata vendor = RIMD;

    dataset
    {
        dataitem(Vendor;
        Vendor)
        {
            column(Notes; Notes)
            { }
            trigger OnAfterGetRecord()
            begin
                Vendor.Reset();
                repeat
                    if Vendor.Notes <> '' then begin
                        Vendor.Notes := '';

                        Vendor.Modify();
                    end;
                until Vendor.Next() = 0;
            end;

        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field(DeleteNotes; DeleteNotes)
                    {
                        ApplicationArea = All;
                        trigger OnValidate()
                        begin
                            Vendor.Reset();
                            repeat
                                if Vendor.Notes <> '' then begin
                                    Vendor.Notes := '';

                                    Vendor.Modify();
                                end;
                            until Vendor.Next() = 0;
                        end;

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
                    ApplicationArea = All;

                }
            }
        }
    }

    var
        myInt: Integer;

        DeleteNotes: Boolean;
}