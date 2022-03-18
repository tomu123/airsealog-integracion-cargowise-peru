table 58039 "Purchase Doc. CargoWise Line"
{
    Caption = 'Purchase Document CargoWise Line', Comment = 'ESM="Linea de Documento de Compra CargoWise"';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Purchase Document CargoWise No.', Comment = 'ESM="Numero de Documento de Compra CargoWise"';
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Doc. CargoWise"."No.";
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.', Comment = 'ESM="Numero de Linea"';
            DataClassification = ToBeClassified;
        }
        field(3; Type; Enum "Purchase Line Type")
        {
            Caption = 'Type', Comment = 'ESM="Tipo de Cuenta"';
            DataClassification = ToBeClassified;
        }
        field(4; "No."; Code[20])
        {
            Caption = 'No.', Comment = 'ESM="Numero de Cuenta"';
            DataClassification = ToBeClassified;
        }
        field(5; Quantity; Decimal)
        {
            Caption = 'Quantity', Comment = 'ESM="Cantidad"';
            DataClassification = ToBeClassified;
        }
        field(6; "Direct Unit Cost"; Decimal)
        {
            Caption = 'Direct Unit Cost', Comment = 'ESM="Costo Unitario Directo sin Iva"';
            DataClassification = ToBeClassified;
        }
        field(7; "Shortcut Dimension 1 Code"; Code[20])
        {
            Caption = 'Dept. Code', comment = 'ESM="Dpto. Codigo"';
            DataClassification = ToBeClassified;
        }
        field(8; "Shortcut Dimension 2 Code"; Code[20])
        {
            Caption = 'Segment Code', comment = 'ESM="Segmento Codigo"';
            DataClassification = ToBeClassified;
        }
        field(9; "Shortcut Dimension 3 Code"; Code[20])
        {
            Caption = 'Job Code', comment = 'ESM="Job Codigo"';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Document No.","Line No.")
        {
            Clustered = true;
        }
    }
}
