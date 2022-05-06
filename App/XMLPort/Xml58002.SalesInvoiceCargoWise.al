xmlport 58002 "Sales Invoice CargoWise"
{
    Caption = 'Sales Invoice CargoWise';
    DefaultNamespace = 'urn:microsoft-dynamics-nav/xmlports/x58002';
    Direction = Both;
    Encoding = UTF8;
    FormatEvaluate = Xml;
    UseDefaultNamespace = true;

    schema
    {
        textelement(FacturaCargoWise)
        {
            tableelement(CabezeraFacturaVenta; "Sales Doc. CargoWise")
            {
                UseTemporary = true;
                fieldelement(NumCliente;CabezeraFacturaVenta."Sell-to Customer No."){}
                fieldelement(FechaRegistro;CabezeraFacturaVenta."Posting Date"){}
                fieldelement(DocLegal;CabezeraFacturaVenta."Legal Document"){}
                fieldelement(FactElectronica;CabezeraFacturaVenta."EB Electronic Bill"){}
                fieldelement(TipoOperDoc;CabezeraFacturaVenta."EB Type Operation Document"){}
                fieldelement(CodDivisa;CabezeraFacturaVenta."Currency Code"){}
                fieldelement(CodJob;CabezeraFacturaVenta."Shortcut Dimension 3 Code"){}
                fieldelement(NumFacCargoWise;CabezeraFacturaVenta."Cargowise Invoice No."){}
                fieldelement(NumBL;CabezeraFacturaVenta."BL No."){}
                fieldelement(NombreRem;CabezeraFacturaVenta."Shipper Name"){}
                fieldelement(NombreDest;CabezeraFacturaVenta."Consignee Name"){}
                fieldelement(Origen;CabezeraFacturaVenta.Origin){}
                fieldelement(Destino;CabezeraFacturaVenta.Destination){}
                fieldelement(FechaSal;CabezeraFacturaVenta."Get Out Date"){}
                fieldelement(FechaLle;CabezeraFacturaVenta."Arrived Date"){}
                fieldelement(NumOrdenCompra;CabezeraFacturaVenta."Purchase order No."){}
                fieldelement(RoutingNo;CabezeraFacturaVenta."Routing No."){}
                fieldelement(GuiaRemisionNo;CabezeraFacturaVenta."No. Sales Shipment"){}
                fieldelement(NomTrans;CabezeraFacturaVenta."Carrier Name"){}
                fieldelement(CodDpto;CabezeraFacturaVenta."Shortcut Dimension 1 Code"){}
                fieldelement(CodSeg;CabezeraFacturaVenta."Shortcut Dimension 2 Code"){}
                fieldelement(Detraccion;CabezeraFacturaVenta."Sales Detraction"){}
                fieldelement(TipoOperacion;CabezeraFacturaVenta."Operation Type Detrac"){}
                fieldelement(TipoServicio;CabezeraFacturaVenta."Service Type Detrac"){}
                fieldelement(CodMetPago;CabezeraFacturaVenta."Payment Method Code Detrac"){}
                fieldelement(MotivoNotaCred;CabezeraFacturaVenta."EB NC/ND Support Description"){}
                fieldelement(ApplyDocType;CabezeraFacturaVenta."Applies-to Doc. Type"){}
                fieldelement(ApplyDocNo;CabezeraFacturaVenta."Applies-to Doc. No."){}
                fieldelement(LegalPropertyType;CabezeraFacturaVenta."Legal Property Type"){}
                fieldelement(MotiveDiscountCode;CabezeraFacturaVenta."EB Motive discount code"){}
                fieldelement(DescriptionType;CabezeraFacturaVenta."EB NC/ND Description Type"){}
                fieldelement(ApplyDocNoRef;CabezeraFacturaVenta."Applies-to Doc. No. Ref."){}
                fieldelement(CodFormaPago;CabezeraFacturaVenta."Payment Method Code"){}
                tableelement(LineaFacturaVenta;"Sales Doc. CargoWise Line"){
                    UseTemporary = true;
                    fieldelement(TipoCuenta;LineaFacturaVenta.Type){}
                    fieldelement(PrecioUni;LineaFacturaVenta."Unit Price"){}
                    fieldelement(CodDpto;LineaFacturaVenta."Shortcut Dimension 1 Code"){}
                    fieldelement(CodSegmento;LineaFacturaVenta."Shortcut Dimension 2 Code"){}
                    fieldelement(CodJob;LineaFacturaVenta."Shortcut Dimension 3 Code"){}
                    fieldelement(CodStanVentas;LineaFacturaVenta."Standard Sales Code"){}
                    fieldelement(GrupoContIVA;LineaFacturaVenta."VAT Prod. Posting Group"){}
                    fieldelement(Desc;LineaFacturaVenta.Description){}
                    fieldelement(Cant;LineaFacturaVenta.Quantity){}
                    trigger OnBeforeInsertRecord()
                    var

                    begin
                        NoLinea += 1000;
                        LineaFacturaVenta."Line No.":= NoLinea;
                    end;
                }
                trigger OnAfterInsertRecord()
                var
                    SaveSalesHeader: Record "Sales Doc. CargoWise";
                    SaveSalesLine: Record "Sales Doc. CargoWise Line";
                begin
                    CabezeraFacturaVenta.Reset();
                    if CabezeraFacturaVenta.FindFirst() then begin
                        SaveSalesHeader.Init();
                        SaveSalesHeader.TransferFields(CabezeraFacturaVenta);
                        SaveSalesHeader.Validate("Sales Detraction",CabezeraFacturaVenta."Sales Detraction");
                        SaveSalesHeader.Insert(true);
                    end;
                    LineaFacturaVenta.Reset();
                    if LineaFacturaVenta.FindFirst() then begin
                        repeat
                            SaveSalesLine.Init();
                            SaveSalesLine.TransferFields(LineaFacturaVenta);
                            SaveSalesLine."Document No.":= SaveSalesHeader."No.";
                            SaveSalesLine.Insert();
                        until LineaFacturaVenta.Next() = 0;
                    end;
                    ResponseXML.Init();
                    ResponseXML."Response Code" := '0000';
                    ResponseXML.Status := 'SUCCESS';
                    ResponseXML."Response Text" := StrSubstNo('Se registró correctamente la factura de Venta N° %1', SaveSalesHeader."No.");
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
