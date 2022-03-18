tableextension 58311 "Sales Doc. API No. Series" extends "Sales & Receivables Setup"
{
    fields
    {
        field(58036; "Sales Doc. API Nos."; Code[20])
        {
            Caption = 'Sales Doc. API Nos.';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
    }
}
