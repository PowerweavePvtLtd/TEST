/*pageextension 50315 MyExtension extends "Email Dialog"
{
    layout
    {
        // Add changes to page layout here
        modify(FromAddress)
        {
            Visible = true;
            Enabled = true;
        }
    }

    actions
    {
        // Add changes to page actions here
    }
    

    var
        myInt: Integer;
        FromAddress: Text[50];
        OriginalFromEmail: Text[50];
}*/