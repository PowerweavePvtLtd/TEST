report 50132 ChargesReport
{
    UsageCategory = Administration;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'ChargesReport.rdl';
    Caption = 'Costing report for Charges';


    dataset
    {
        dataitem(Item; Item)
        {
            RequestFilterFields = "No.", "Vendor No.", "Item Category Code";
            column(VenodorNo; "Vendor No.") { }
            column(VendorName; "Vendor Name") { }
            dataitem("Charge Setup"; "Charge Setup")
            {
                DataItemLinkReference = item;
                DataItemLink = "No." = field("No.");
                // RequestFilterFields = "No.";
                column(No_; "No.")
                { }
                column(Type; Type) { }
                column(Varient_Code; "Varient Code") { }
                column(Imprint_Location; "Imprint Location") { }
                column(Imprint_Method; "Imprint Method") { }

                column(Charge_Code; "Charge Code") { }
                column(Name; Name) { }
                column(Charge_Price; "Charge Price") { }
                column(Cost; Cost) { }
                column(Vendor_Charge_Description; "Vendor Charge Description") { }
                // column(VenodorNo; Recitems."Vendor No.") { }
                //column(VendorName; Recitems."Vendor Name") { }
                column(Picture; compinfor.Picture) { }

                trigger OnAfterGetRecord()
                begin
                    /* Recitems.Reset();
                     Recitems.SetRange("No.", "No.");
                     if Recitems.FindFirst() then;*/

                    compinfor.get;
                    compinfor.CalcFields(Picture);
                end;
            }
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
                }
            }
        }

        /* actions
         {
             area(processing)
             {
                 action(ActionName)
                 {
                     ApplicationArea = All;

                 }
             }
         }*/
    }

    var
        myInt: Integer;
        Vend: Record Vendor;
        Recitems: Record Item;
        compinfor: Record "Company Information";
}