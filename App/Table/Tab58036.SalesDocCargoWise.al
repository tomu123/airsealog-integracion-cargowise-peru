table 58036 "Sales Doc. CargoWise"
{
    Caption = 'Sales Document CargoWise', comment = 'ESM="Documento de Venta CargoWise"';
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
                    SalesSetup.Get();
                    NoSeriesMgt.TestManual(SalesSetup."Sales Doc. API Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Sell-to Customer No."; Code[20])
        {
            Caption = 'Sell-to Customer No.', comment = 'ESM="No. Cliente"';
            DataClassification = ToBeClassified;
        }
        field(3; "Posting Date"; Date)
        {
            Caption = 'Posting Date', comment = 'ESM="Fecha Registro"';
            DataClassification = ToBeClassified;
        }
        field(4; "Legal Document"; Code[10])
        {
            Caption = 'Legal Document', comment = 'ESM="Documento Legal"';
            DataClassification = ToBeClassified;
        }
        field(5; "EB Electronic Bill"; Boolean)
        {
            Caption = 'EB Electronic Bill', comment = 'ESM="Factura Electronica"';
            DataClassification = ToBeClassified;
        }
        field(6; "EB Type Operation Document"; Code[10])
        {
            Caption = 'EB Type Operation Document', comment = 'ESM="Tipo Operación Doc."';
            DataClassification = ToBeClassified;
        }
        field(7; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code', comment = 'ESM="Cod. Divisa"';
            DataClassification = ToBeClassified;
        }
        field(8; "Shortcut Dimension 3 Code"; Code[20])
        {
            Caption = 'Job Code', comment = 'ESM="Job Codigo"';
            DataClassification = ToBeClassified;
        }
        field(9; "Cargowise Invoice No."; Code[20])
        {
            Caption = 'Cargowise Invoice No.', comment = 'ESM="No. Factura Cargowise"';
            DataClassification = ToBeClassified;
        }
        field(10; "BL No."; Text[50])
        {
            Caption = 'BL No.', comment = 'ESM="N° BL/Hawb"';
            DataClassification = ToBeClassified;
        }
        field(11; "Shipper Name"; Text[250])
        {
            Caption = 'Shipper Name', comment = 'ESM="Nombre remitente"';
            DataClassification = ToBeClassified;
        }
        field(12; "Consignee Name"; Text[250])
        {
            Caption = 'Consignee Name', comment = 'ESM="Nombre destinatario"';
            DataClassification = ToBeClassified;
        }
        field(13; Origin; Code[50])
        {
            Caption = 'Origin', comment = 'ESM="Origen"';
            DataClassification = ToBeClassified;
        }
        field(14; Destination; Code[30])
        {
            Caption = 'Destination', comment = 'ESM="Destino"';
            DataClassification = ToBeClassified;
        }
        field(15; "Get Out Date"; Date)
        {
            Caption = 'Get Out Date', comment = 'ESM="Fecha Salida"';
            DataClassification = ToBeClassified;
        }
        field(16; "Arrived Date"; Date)
        {
            Caption = 'Arrived Date', comment = 'ESM="Fecha LLegada"';
            DataClassification = ToBeClassified;
        }
        field(17; "Purchase order No."; Code[50])
        {
            Caption = 'Purchase order No.', comment = 'ESM="Orden Compra"';
            DataClassification = ToBeClassified;
        }
        field(18; "Carrier Name"; Text[80])
        {
            Caption = 'Carrier Name', comment = 'ESM="Nombre Transportista"';
            DataClassification = ToBeClassified;
        }
        field(19; "Shortcut Dimension 1 Code"; Code[20])
        {
            Caption = 'Dept. Code', comment = 'ESM="Dpto. Codigo"';
            DataClassification = ToBeClassified;
        }
        field(20; "Shortcut Dimension 2 Code"; Code[20])
        {
            Caption = 'Segment Code', comment = 'ESM="Segmento Codigo"';
            DataClassification = ToBeClassified;
        }
        field(21; "Sales Detraction"; Boolean)
        {
            Caption = 'Sales Detraction', comment = 'ESM="Detracción"';
            DataClassification = ToBeClassified;
        }
        field(22; "Operation Type Detrac"; Code[2])
        {
            Caption = 'Type of Operation', Comment = 'ESM="Tipo de operación"';
            DataClassification = ToBeClassified;
        }
        field(23; "Service Type Detrac"; Code[10])
        {
            Caption = 'Type of Service', Comment = 'ESM="Tipo de servicio"';
            DataClassification = ToBeClassified;
        }
        field(24; "Payment Method Code Detrac"; Code[10])
        {
            Caption = 'Payment Method Code Detrac', comment = 'ESM="Cód. Forma de pago (Detrac.)"';
            DataClassification = ToBeClassified;
        }
        field(25; "Loaded?"; Boolean)
        {
            Caption = 'Loaded?', comment = 'ESM="Cargado?"';
            DataClassification = ToBeClassified;
        }
        field(26; "Routing No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Routing No.', comment = 'ESM="No. Routing"';
        }

        field(27; "No. Sales Shipment"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'No. Sales Shipment', comment = 'ESM="No. Guía Remisión"';
        }
        field(28; "EB NC/ND Support Description"; Text[200])
        {
            DataClassification = ToBeClassified;
            Caption = 'NC/ND Support Description', comment = 'ESM="Motivo Nota de crédito"';
        }
        field(29; "Applies-to Doc. Type"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Applies-to Doc. Type', comment = 'ESM="Liq. por tipo documento"';
        }
        field(30; "Applies-to Doc. No."; Code[20])
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
            SalesSetup.Get();
            SalesSetup.TestField("Sales Doc. API Nos.");
            NoSeriesMgt.InitSeries(SalesSetup."Sales Doc. API Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;

    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;

}
