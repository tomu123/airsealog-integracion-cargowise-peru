page 58039 "Purchase Doc. CargoWise Card"
{

    Caption = 'Purchase Doc. CargoWise Card', comment = 'ESM="Tarjeta de Doc. de Compra CargoWise"';;
    PageType = Document;
    SourceTable = "Purchase Doc. CargoWise";
    RefreshOnActivate = true;

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
                field("Buy-from Vendor No."; Rec."Buy-from Vendor No.")
                {
                    ToolTip = 'Specifies the value of the Buy-from Vendor No. field.', Comment = 'ESM="No. Proveedor"';
                    ApplicationArea = All;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the value of the Posting Date field.', Comment = 'ESM="Fecha Registro"';
                    ApplicationArea = All;
                }
                field("Electronic Bill"; Rec."Electronic Bill")
                {
                    ToolTip = 'Specifies the value of the Electronic Bill field.', Comment = 'ESM="Factura Electronica"';
                    ApplicationArea = All;
                }
                field("Vendor Invoice No."; Rec."Vendor Invoice No.")
                {
                    ToolTip = 'Specifies the value of the Vendor Invoice No. field.', Comment = 'ESM="Nº factura proveedor"';
                    ApplicationArea = All;
                }
                field("Posting Text"; Rec."Posting Text")
                {
                    ToolTip = 'Specifies the value of the Posting Text field.', Comment = 'ESM="Texto Registro"';
                    ApplicationArea = All;
                }
                field("Legal Document"; Rec."Legal Document")
                {
                    ToolTip = 'Specifies the value of the Legal Document field.', Comment = 'ESM="Documento Legal"';
                    ApplicationArea = All;
                }
                field("Legal Property Type"; Rec."Legal Property Type")
                {
                    ToolTip = 'Specifies the value of the Legal Property Type field.', Comment = 'ESM="Tipo de Bien"';
                    ApplicationArea = All;
                }
            }
            part(PurchLines; "Purch. Doc. CargoWise Subform")
            {
                ApplicationArea = Basic, Suite;
                Editable = Rec."Buy-from Vendor No." <> '';
                Enabled = Rec."Buy-from Vendor No." <> '';
                SubPageLink = "Document No." = FIELD("No.");
                UpdatePropagation = Both;
            }
            group("Invoice Details")
            {
                Caption = 'Invoice Details', comment = 'ESM="Detalles Factura"';
                field("Payment Terms Code"; Rec."Payment Terms Code")
                {
                    ToolTip = 'Specifies the value of the Payment Terms Code field.', Comment = 'ESM="Cod. Terminos de Pago "';
                    ApplicationArea = All;
                }
                field("Payment Method Code"; Rec."Payment Method Code")
                {
                    ToolTip = 'Specifies the value of the Payment Method Code field.', Comment = 'ESM="Cod. Forma de Pago"';
                    ApplicationArea = All;
                }
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
                field("Purch. Detraction"; Rec."Purch. Detraction")
                {
                    ToolTip = 'Specifies the value of the Purch. Detraction field.', Comment = 'ESM="Detracción"';
                    ApplicationArea = All;
                }
                field("Type of Service"; Rec."Type of Service")
                {
                    ToolTip = 'Specifies the value of the Type of Service field.', Comment = 'ESM="Tipo de servicio"';
                    ApplicationArea = All;
                }
                field("Type of Operation"; Rec."Type of Operation")
                {
                    ToolTip = 'Specifies the value of the Type of Operation field.', Comment = 'ESM="Tipo de operación"';
                    ApplicationArea = All;
                }
                field("Purch Date Detraction"; Rec."Purch Date Detraction")
                {
                    ToolTip = 'Specifies the value of the Purch Date Detraction field.', Comment = 'ESM="Fecha Detracción"';
                    ApplicationArea = All;
                }
            }
        }
    }

}
