page 58036 "Sales Doc. CargoWise List"
{

    ApplicationArea = Basic, Suite;
    Caption = 'Sales Doc. CargoWise List' , comment = 'ESM="Lista de Doc. de Venta CargoWise"';;
    CardPageID = "Sales Doc. CargoWise Card";
    Editable = false;
    PageType = List;
    RefreshOnActivate = true;
    SourceTable = "Sales Doc. CargoWise";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                ShowCaption = false;
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
                field("Currency Code"; Rec."Currency Code")
                {
                    ToolTip = 'Specifies the value of the Currency Code field.', Comment = 'ESM="Cod. Divisa"';
                    ApplicationArea = All;
                }
                field("Cargowise Invoice No."; Rec."Cargowise Invoice No.")
                {
                    ToolTip = 'Specifies the value of the Cargowise Invoice No. field.', Comment = 'ESM="No. Factura Cargowise"';
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
                        SalesDocCW: Record "Sales Doc. CargoWise";
                        BCIntegration: Codeunit "Business Central Integration";
                        SalesDocCWRef: RecordRef;
                    begin
                        CurrPage.SetSelectionFilter(SalesDocCW);
                        SalesDocCW.Next();
                        repeat begin
                            BCIntegration.LoadSalesData(SalesDocCW);
                        end until SalesDocCW.Next() = 0;
                    end;
                }
            }
        }
    }

}
