pageextension 58027 VendorList extends "Vendor List"
{
  layout{
     addafter("Payment Terms Code")
        {

            field("Payment Method Code"; "Payment Method Code")
            {
                ApplicationArea = All;
            }

        }
      modify("Payment Terms Code"){
        Visible = true;
      }
  }
}
