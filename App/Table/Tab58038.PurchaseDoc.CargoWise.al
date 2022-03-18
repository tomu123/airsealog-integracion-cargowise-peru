table 58038 "Purchase Doc. CargoWise"
{
    Caption = 'Purchase Document CargoWise', Comment = 'ESM="Documento de Compra CargoWise"';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'Document No.', Comment = 'ESM="Numero de Documento"';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    PurchaseSetup.Get();
                    NoSeriesMgt.TestManual(PurchaseSetup."Purchase Doc. API Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Buy-from Vendor No."; Code[20])
        {
            Caption = 'Buy-from Vendor No.', Comment = 'ESM="No. Proveedor"';
            DataClassification = ToBeClassified;
        }
        field(3; "Posting Date"; Date)
        {
            Caption = 'Posting Date', Comment = 'ESM="Fecha Registro"';
            DataClassification = ToBeClassified;
        }
        field(4; "Electronic Bill"; Boolean)
        {
            Caption = 'Electronic Bill', Comment = 'ESM="Factura Electronica"';
            DataClassification = ToBeClassified;
        }
        field(5; "Vendor Invoice No."; Code[35])
        {
            Caption = 'Vendor Invoice No.', Comment = 'ESM="Nº factura proveedor"';
            DataClassification = ToBeClassified;
        }
        field(6; "Posting Text"; Text[250])
        {
            Caption = 'Posting Text', Comment = 'ESM="Texto Registro"';
            DataClassification = ToBeClassified;
        }
        field(7; "Legal Document"; Code[10])
        {
            Caption = 'Legal Document', Comment = 'ESM="Documento Legal"';
            DataClassification = ToBeClassified;
        }
        field(8; "Legal Property Type"; Code[10])
        {
            Caption = 'Legal Property Type', Comment = 'ESM="Tipo de Bien"';
            DataClassification = ToBeClassified;
        }
        field(9; "Payment Terms Code"; Code[10])
        {
            Caption = 'Payment Terms Code', Comment = 'ESM="Cod. Terminos de Pago "';
            DataClassification = ToBeClassified;
        }
        field(10; "Payment Method Code"; Code[10])
        {
            Caption = 'Payment Method Code', Comment = 'ESM="Cod. Forma de Pago"';
            DataClassification = ToBeClassified;
        }
        field(11; "Shortcut Dimension 1 Code"; Code[20])
        {
            Caption = 'Dept. Code', comment = 'ESM="Dpto. Codigo"';
            DataClassification = ToBeClassified;
        }
        field(12; "Shortcut Dimension 2 Code"; Code[20])
        {
            Caption = 'Segment Code', comment = 'ESM="Segmento Codigo"';
            DataClassification = ToBeClassified;
        }
        field(13; "Purch. Detraction"; Boolean)
        {
            Caption = 'Purch. Detraction', Comment = 'ESM="Detracción"';
            DataClassification = ToBeClassified;
        }
        field(14; "Type of Service"; Code[10])
        {
            Caption = 'Type of Service', Comment = 'ESM="Tipo de servicio"';
            DataClassification = ToBeClassified;
        }
        field(15; "Type of Operation"; Code[10])
        {
            Caption = 'Type of Operation', Comment = 'ESM="Tipo de operación"';
            DataClassification = ToBeClassified;
        }
        field(16; "Purch Date Detraction"; Date)
        {
            Caption = 'Purch Date Detraction', Comment = 'ESM="Fecha Detracción"';
            DataClassification = ToBeClassified;
        }
        field(17; "Loaded?"; Boolean)
        {
            Caption = 'Loaded?', comment = 'ESM="Cargado?"';
            DataClassification = ToBeClassified;
        }
        field(18; "Document Date"; Date)
        {
            Caption = 'Document Date', Comment = 'ESM="Fecha emisión documento"';
            DataClassification = ToBeClassified;
        }
        field(19; "Applies-to Doc. Type"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Applies-to Doc. Type', comment = 'ESM="Liq. por tipo documento"';
        }
        field(20; "Applies-to Doc. No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Applies-to Doc. No.', comment = 'ESM="Liq. por nº documento"';
        }
        field(50; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
    begin
        if "No." = '' then begin
            PurchaseSetup.Get();
            PurchaseSetup.TestField("Purchase Doc. API Nos.");
            NoSeriesMgt.InitSeries(PurchaseSetup."Purchase Doc. API Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;

    var
        PurchaseSetup: Record "Purchases & Payables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}
