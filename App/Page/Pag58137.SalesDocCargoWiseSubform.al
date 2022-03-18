page 58137 "Sales Doc. CargoWise Subform"
{

    AutoSplitKey = true;
    Caption = 'Lines';
    DelayedInsert = true;
    LinksAllowed = false;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = "Sales Doc. CargoWise Line";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                ShowCaption = false;
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the value of the Sales Document CargoWise No. field.', Comment = 'ESM="Numero de Documento de Venta CargoWise"';
                    ApplicationArea = All;
                }
                field("Line No."; Rec."Line No.")
                {
                    ToolTip = 'Specifies the value of the Line No. field.', Comment = 'ESM="Numero de Linea"';
                    ApplicationArea = All;
                }
                field("Type"; Rec."Type")
                {
                    ToolTip = 'Specifies the value of the Type field.', Comment = 'ESM="Tipo de Cuenta"';
                    ApplicationArea = All;
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ToolTip = 'Specifies the value of the Unit Price field.', Comment = 'ESM="Precio Unitario Sin IVA"';
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
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ToolTip = 'Specifies the value of the Job Code field.', Comment = 'ESM="Job Codigo"';
                    ApplicationArea = All;
                }
                field("Standard Sales Code"; Rec."Standard Sales Code")
                {
                    ToolTip = 'Specifies the value of the Standard Sales Code field.', Comment = 'ESM="Cód. Venta Estándar"';
                    ApplicationArea = All;
                }
                field("VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group")
                {
                    ToolTip = 'Specifies the value of the VAT Prod. Posting Group field.', Comment = 'ESM="Grupo Contable IVA Prod."';
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description  field.', Comment = 'ESM="Descripcion"';
                    ApplicationArea = All;
                }
                field(Quantity; Rec.Quantity)
                {
                    ToolTip = 'Specifies the value of the Quantity field.', Comment = 'ESM="Cantidad"';
                    ApplicationArea = All;
                }
            }
        }
    }

}
