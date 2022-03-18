pageextension 58460 "Purchase Doc. API NoSeries" extends "Purchases & Payables Setup"
{
  layout
  {
    addafter("Posted Credit Memo Nos.")
    {
      field("Purchase Doc. API Nos."; Rec."Purchase Doc. API Nos.")
      {
        Caption = 'Purchase Doc. API Nos.', comment = 'ESM="Nº Documento de Compra API"';
        ApplicationArea = All;
      }
    }
  }
}
