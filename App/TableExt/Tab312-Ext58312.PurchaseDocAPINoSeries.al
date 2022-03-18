tableextension 58312 "Purchase Doc. API No. Series" extends "Purchases & Payables Setup"
{
    fields
    {
        field(58038; "Purchase Doc. API Nos."; Code[20])
        {
            Caption = 'Purchase Doc. API Nos.';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
    }
}
