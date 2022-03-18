page 58037 "Sales Doc. CargoWise Card"
{

    Caption = 'Sales Doc. CargoWise Card', comment = 'ESM="Tarjeta de Doc. de Venta CargoWise"';;
    PageType = Document;
    RefreshOnActivate = true;
    SourceTable = "Sales Doc. CargoWise";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the Document No. field.', Comment = 'ESM="Numero de Documento"';
                    ApplicationArea = All;
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    ToolTip = 'Specifies the value of the Sell-to Customer No. field.', Comment = 'ESM="No. Cliente"';
                    ApplicationArea = All;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the value of the Posting Date field.', Comment = 'ESM="Fecha Registro"';
                    ApplicationArea = All;
                }
                field("Legal Document"; Rec."Legal Document")
                {
                    ToolTip = 'Specifies the value of the Legal Document field.', Comment = 'ESM="Documento Legal"';
                    ApplicationArea = All;
                }
                field("EB Electronic Bill"; Rec."EB Electronic Bill")
                {
                    ToolTip = 'Specifies the value of the EB Electronic Bill field.', Comment = 'ESM="Factura Electronica"';
                    ApplicationArea = All;
                }
                field("EB Type Operation Document"; Rec."EB Type Operation Document")
                {
                    ToolTip = 'Specifies the value of the EB Type Operation Document field.', Comment = 'ESM="Tipo Operación Doc."';
                    ApplicationArea = All;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ToolTip = 'Specifies the value of the Currency Code field.', Comment = 'ESM="Cod. Divisa"';
                    ApplicationArea = All;
                }
            }
            group(Airsealog)
            {
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ToolTip = 'Specifies the value of the Job Code field.', Comment = 'ESM="Job Codigo"';
                    ApplicationArea = All;
                }
                field("Cargowise Invoice No."; Rec."Cargowise Invoice No.")
                {
                    ToolTip = 'Specifies the value of the Cargowise Invoice No. field.', Comment = 'ESM="No. Factura Cargowise"';
                    ApplicationArea = All;
                }
                field("BL No."; Rec."BL No.")
                {
                    ToolTip = 'Specifies the value of the BL No. field.', Comment = 'ESM="N° BL/Hawb"';
                    ApplicationArea = All;
                }
                field("Shipper Name"; Rec."Shipper Name")
                {
                    ToolTip = 'Specifies the value of the Shipper Name field.', Comment = 'ESM="Nombre remitente"';
                    ApplicationArea = All;
                }
                field("Consignee Name"; Rec."Consignee Name")
                {
                    ToolTip = 'Specifies the value of the Consignee Name field.', Comment = 'ESM="Nombre destinatario"';
                    ApplicationArea = All;
                }
                field(Origin; Rec.Origin)
                {
                    ToolTip = 'Specifies the value of the Origin field.', Comment = 'ESM="Origen"';
                    ApplicationArea = All;
                }
                field(Destination; Rec.Destination)
                {
                    ToolTip = 'Specifies the value of the Destination field.', Comment = 'ESM="Destino"';
                    ApplicationArea = All;
                }
                field("Get Out Date"; Rec."Get Out Date")
                {
                    ToolTip = 'Specifies the value of the Get Out Date field.', Comment = 'ESM="Fecha Salida"';
                    ApplicationArea = All;
                }
                field("Arrived Date"; Rec."Arrived Date")
                {
                    ToolTip = 'Specifies the value of the Arrived Date field.', Comment = 'ESM="Fecha LLegada"';
                    ApplicationArea = All;
                }
                field("Purchase order No."; Rec."Purchase order No.")
                {
                    ToolTip = 'Specifies the value of the Purchase order No. field.', Comment = 'ESM="Orden Compra"';
                    ApplicationArea = All;
                }
                field("Carrier Name"; Rec."Carrier Name")
                {
                    ToolTip = 'Specifies the value of the Carrier Name field.', Comment = 'ESM="Nombre Transportista"';
                    ApplicationArea = All;
                }
                field("Routing No."; Rec."Routing No.")
                {
                    ApplicationArea = All;
                }
                field("No. Sales Shipment"; Rec."No. Sales Shipment")
                {
                    ApplicationArea = All;
                }
            }
            part(SalesLines; "Sales Doc. CargoWise Subform")
            {
                ApplicationArea = Basic, Suite;
                Editable = Rec."Sell-to Customer No." <> '';
                Enabled = Rec."Sell-to Customer No." <> '';
                SubPageLink = "Document No." = FIELD("No.");
                UpdatePropagation = Both;
            }
            group("Invoice Details")
            {
                Caption = 'Invoice Details', comment = 'ESM="Detalles Factura"';
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ToolTip = 'Specifies the value of the Dept. Code field.', Comment = 'ESM="Dpto. Codigo"';
                    ApplicationArea = All;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ToolTip = 'Specifies the value of the Segment Code field.', Comment = 'ESM="Segmento Codigo"';
                    ApplicationArea = All;
                }
            }
            group(Detraccion)
            {
                field("Sales Detraction"; Rec."Sales Detraction")
                {
                    ToolTip = 'Specifies the value of the Sales Detraction field.', Comment = 'ESM="Detracción"';
                    ApplicationArea = All;
                }
                field("Operation Type Detrac"; Rec."Operation Type Detrac")
                {
                    ToolTip = 'Specifies the value of the Type of Operation field.', Comment = 'ESM="Tipo de operación"';
                    ApplicationArea = All;
                }
                field("Service Type Detrac"; Rec."Service Type Detrac")
                {
                    ToolTip = 'Specifies the value of the Type of Service field.', Comment = 'ESM="Tipo de servicio"';
                    ApplicationArea = All;
                }
                field("Payment Method Code Detrac"; Rec."Payment Method Code Detrac")
                {
                    ToolTip = 'Specifies the value of the Payment Method Code Detrac field.', Comment = 'ESM="Cód. Forma de pago (Detrac.)"';
                    ApplicationArea = All;
                }
            }
        }
    }

}
