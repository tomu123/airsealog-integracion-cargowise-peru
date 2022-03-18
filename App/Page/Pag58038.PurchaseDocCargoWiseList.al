page 58038 "Purchase Doc. CargoWise List"
{

    ApplicationArea = Basic, Suite;
    Caption = 'Purchase Doc. CargoWise List', comment = 'ESM="Lista de Doc. de Compra CargoWise"';;
    CardPageID = "Purchase Doc. CargoWise Card";
    Editable = false;
    PageType = List;
    RefreshOnActivate = true;
    SourceTable = "Purchase Doc. CargoWise";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the Document No. field.', Comment = 'ESM="Numero de Documento"';
                    ApplicationArea = All;
                }
                field("Loaded?"; Rec."Loaded?")
                {
                    ToolTip = 'Specifies if the Document is loaded in the system', Comment = 'ESM="Especifica si el documento ya fue cargado en el sistema"';
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
                field("Vendor Invoice No."; Rec."Vendor Invoice No.")
                {
                    ToolTip = 'Specifies the value of the Vendor Invoice No. field.', Comment = 'ESM="Nº factura proveedor"';
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
        }
    }
    actions
    {
        area(Processing)
        {
            group("Integration")
            {
                Caption = 'Integration',comment = 'ESM="Integracion"';
                action(LoadData)
                {
                    ApplicationArea = All;
                    Promoted = true;
                    PromotedCategory = Process;
                    trigger OnAction()
                    var
                        PurchaseDocCW: Record "Purchase Doc. CargoWise";
                        BCIntegration: Codeunit "Business Central Integration";
                        PurchaseDocCWRef: RecordRef;
                    begin
                        CurrPage.SetSelectionFilter(PurchaseDocCW);
                        PurchaseDocCW.Next();
                        repeat begin
                            BCIntegration.LoadPurchaseData(PurchaseDocCW);
                        end until PurchaseDocCW.Next() = 0;
                    end;
                }
            }
        }
    }

}
