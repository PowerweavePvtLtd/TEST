report 50130 "Pricing Report"
{
    UsageCategory = Administration;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './Pricing.rdl';
    Caption = 'Pricing Report';


    dataset
    {
        dataitem(Item; Item)
        {
            RequestFilterFields = "No.", "Vendor No.";
            column(Item_No_; "No.")
            { }
            column(ItemDescription; Description)
            { }
            dataitem("Purchase Price";
            "Purchase Price")
            {
                DataItemLink = "Item No." = FIELD("No."), "Vendor No." = field("Vendor No.");
                DataItemLinkReference = item;
                //RequestFilterFields = "Vendor No.";
                /* column(Item_No_;
                 "Item No.")
                 { }*/
                column(Vendor_No_; "Vendor No.")
                { }
                column(Direct_Unit_Cost; "Direct Unit Cost")
                { }
                column(VendorName; VendorName)
                { }

                trigger OnAfterGetRecord()
                begin
                    if RecITem.Get("Item No.") then
                        ItemDescription := RecITem.Description;
                    if RecVendor.get("Vendor No.") then
                        VendorName := RecVendor.Name;
                end;
                /* column(ItemDescription; ItemDescription)
                 { }*/
            }



            dataitem("Sales Price"; "Sales Price")
            {
                DataItemLink = "Item No." = FIELD("No.");
                DataItemLinkReference = Item;
                // DataItemTableView = SORTING("Item No.") WHERE("Item No." = filter(<> ''));
                column(SalesPrice_Item_No_; "Item No.")
                { }

                column(Unit_Price; "Unit Price")
                { }
                column(Minimum_Quantity; "Minimum Quantity")
                { }

            }

        }

    }

    /* requestpage
     {
         layout
         {
             area(Content)
             {
                 group(GroupName)
                 {
                     field(Name; SourceExpression)
                     {
                         ApplicationArea = All;

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
         }*/

    //}

    var
        myInt: Integer;
        RecITem: Record item;
        ItemDescription: Text;

        RecVendor: Record Vendor;
        recPurc: Record "Purchase Price";
        PurhcasePirce: Decimal;

        VendorName: Text;
        Minimum_Quantity: Decimal;




}