xmlport 58000 "Purchase Invoice CargoWise"
{
    Caption = 'Purchase Invoice CargoWise';
    DefaultNamespace = 'urn:microsoft-dynamics-nav/xmlports/x58000';
    Direction = Both;
    Encoding = UTF8;
    FormatEvaluate = Xml;
    UseDefaultNamespace = true;

    schema
    {
        textelement(FacturaCargoWise)
        {
            tableelement(CabezeraFacturaCompra; "Purchase Doc. CargoWise")
            {
                UseTemporary = true;
                fieldelement(NumProveedor;CabezeraFacturaCompra."Buy-from Vendor No."){}
                fieldelement(FechaRegistro;CabezeraFacturaCompra."Posting Date"){}
                fieldelement(FechaEmision;CabezeraFacturaCompra."Document Date"){}
                fieldelement(FactElectronica;CabezeraFacturaCompra."Electronic Bill"){}
                fieldelement(NumFactProveedor;CabezeraFacturaCompra."Vendor Invoice No."){}
                fieldelement(TextoRegistro;CabezeraFacturaCompra."Posting Text"){}
                fieldelement(DocLegal;CabezeraFacturaCompra."Legal Document"){}
                fieldelement(TipoBien;CabezeraFacturaCompra."Legal Property Type"){}
                fieldelement(CodTermPago;CabezeraFacturaCompra."Payment Terms Code"){}
                fieldelement(CodFormaPago;CabezeraFacturaCompra."Payment Method Code"){}
                fieldelement(CodDpto;CabezeraFacturaCompra."Shortcut Dimension 1 Code"){}
                fieldelement(CodSegmento;CabezeraFacturaCompra."Shortcut Dimension 2 Code"){}
                fieldelement(Detraccion;CabezeraFacturaCompra."Purch. Detraction"){}
                fieldelement(TipoServicio;CabezeraFacturaCompra."Type of Service"){}
                fieldelement(TipoOperacion;CabezeraFacturaCompra."Type of Operation"){}
                fieldelement(FechaDetraccion;CabezeraFacturaCompra."Purch Date Detraction"){}
                tableelement(LineaFacturaCompra;"Purchase Doc. CargoWise Line"){
                    UseTemporary = true;
                    fieldelement(TipoCuenta;LineaFacturaCompra.Type){}
                    fieldelement(NumCuenta;LineaFacturaCompra."No."){}
                    fieldelement(Cantidad;LineaFacturaCompra.Quantity){}
                    fieldelement(CostoUnitSinIva;LineaFacturaCompra."Direct Unit Cost"){}
                    fieldelement(CodDpto;LineaFacturaCompra."Shortcut Dimension 1 Code"){}
                    fieldelement(CodSegmento;LineaFacturaCompra."Shortcut Dimension 2 Code"){}
                    fieldelement(CodJob;LineaFacturaCompra."Shortcut Dimension 3 Code"){}

                    trigger OnBeforeInsertRecord()
                    var

                    begin
                        NoLinea += 1000;
                        LineaFacturaCompra."Line No.":= NoLinea;
                    end;
                }
                trigger OnAfterInsertRecord()
                var
                    SavePurchHeader: Record "Purchase Doc. CargoWise";
                    SavePurchLine: Record "Purchase Doc. CargoWise Line";
                begin
                    CabezeraFacturaCompra.Reset();
                    if CabezeraFacturaCompra.FindFirst() then begin
                        SavePurchHeader.Init();
                        SavePurchHeader.TransferFields(CabezeraFacturaCompra);
                        SavePurchHeader.Insert(true);
                    end;
                    LineaFacturaCompra.Reset();
                    if LineaFacturaCompra.FindFirst() then begin
                        repeat
                            SavePurchLine.Init();
                            SavePurchLine.TransferFields(LineaFacturaCompra);
                            SavePurchLine."Document No.":= SavePurchHeader."No.";
                            SavePurchLine.Insert();
                        until LineaFacturaCompra.Next() = 0;
                    end;
                    ResponseXML.Init();
                    ResponseXML."Response Code" := '0000';
                    ResponseXML.Status := 'SUCCESS';
                    ResponseXML."Response Text" := StrSubstNo('Se registró correctamente la factura de compra N° %1', SavePurchHeader."No.");
                    ResponseXML.Insert();
                end;
            }
        }
    }
    procedure GetResponse(var pResponseXML: Record "Response XML" temporary)
    begin
        pResponseXML.Reset();
        pResponseXML.DeleteAll();

        ResponseXML.Reset();
        if ResponseXML.FindFirst() then
            repeat
                pResponseXML.Init();
                pResponseXML.TransferFields(ResponseXML, true);
                pResponseXML.Insert();
            until ResponseXML.Next() = 0;

        ResponseXML.Reset();
        ResponseXML.DeleteAll();
    end;

    var
        ResponseXML: Record "Response XML" temporary;
        NoLinea: Integer;

}
