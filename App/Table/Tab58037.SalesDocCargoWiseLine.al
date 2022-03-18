table 58037 "Sales Doc. CargoWise Line"
{
    Caption = 'Sales Doc. CargoWise Line', comment = 'ESM="Linea de Documento de Venta CargoWise"';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Sales Document CargoWise No.', comment = 'ESM="Numero de Documento de Venta CargoWise"';
            DataClassification = ToBeClassified;
            TableRelation = "Sales Doc. CargoWise";
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.', comment = 'ESM="Numero de Linea"';
            DataClassification = ToBeClassified;
        }
        field(3; Type; Enum "Sales Line Type")
        {
            Caption = 'Type', comment = 'ESM="Tipo de Cuenta"';
            DataClassification = ToBeClassified;
        }
        field(4; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price', comment = 'ESM="Precio Unitario Sin IVA"';
            DataClassification = ToBeClassified;
        }
        field(5; "Shortcut Dimension 1 Code"; Code[20])
        {
            Caption = 'Dept. Code', comment = 'ESM="Dpto. Codigo"';
            DataClassification = ToBeClassified;
        }
        field(6; "Shortcut Dimension 2 Code"; Code[20])
        {
            Caption = 'Segment Code', comment = 'ESM="Segmento Codigo"';
            DataClassification = ToBeClassified;
        }
        field(7; "Shortcut Dimension 3 Code"; Code[20])
        {
            Caption = 'Job Code', comment = 'ESM="Job Codigo"';
            DataClassification = ToBeClassified;
        }
        field(8; "Standard Sales Code"; Code[10])
        {
            Caption = 'Standard Sales Code', comment = 'ESM="Cód. Venta Estándar"';
            DataClassification = ToBeClassified;
        }
        field(9; "VAT Prod. Posting Group"; Code[20])
        {
            Caption = 'VAT Prod. Posting Group', comment = 'ESM="Grupo Contable IVA Prod."';
            DataClassification = ToBeClassified;
        }
        field(10; Description; Text[100])
        {
            Caption = 'Description ', comment = 'ESM="Descripcion"';
            DataClassification = ToBeClassified;
        }
        field(11; Quantity; Decimal)
        {
            Caption = 'Quantity', comment = 'ESM="Cantidad"';
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
