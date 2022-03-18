pageextension 58459 "Sales Doc. API NoSeries" extends "Sales & Receivables Setup"
{
  layout
  {
    addafter("Price List Nos.")
    {
      field("Sales Doc. API Nos."; Rec."Sales Doc. API Nos.")
      {
        Caption = 'Sales Doc. API Nos.', comment = 'ESM="Nº Documento de Venta API"';
        ApplicationArea = All;
      }
    }
  }
}
