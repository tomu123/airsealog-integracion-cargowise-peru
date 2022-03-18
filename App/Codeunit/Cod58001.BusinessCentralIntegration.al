codeunit 58001 "Business Central Integration"
{
  procedure ComprasCargoWise(XMLMessage: XmlPort "Purchase Invoice CargoWise"; var XMLResult: XmlPort "Response XML")
  var
      ResponseXML: Record "Response XML";
  begin
      XMLMessage.Import();
      XMLMessage.GetResponse(ResponseXML);

      XMLResult.SetResponse(ResponseXML);
      XMLResult.Export();
  end;
  procedure VentasCargoWise(XMLMessage: XmlPort "Sales Invoice CargoWise"; var XMLResult: XmlPort "Response XML")
  var
      ResponseXML: Record "Response XML";
  begin
      XMLMessage.Import();
      XMLMessage.GetResponse(ResponseXML);

      XMLResult.SetResponse(ResponseXML);
      XMLResult.Export();
  end;
  procedure LoadSalesData(SalesDocCW: Record "Sales Doc. CargoWise")
  var
      SalesH: Record "Sales Header";
      SalesL: Record "Sales Line";
      SalesDocCWL: Record "Sales Doc. CargoWise Line";
      DetracServOpe: Record "DetrAction Services Operation";
  begin
        SalesH.Init();
        if SalesDocCW."Legal Document" = '01' then
            SalesH.Validate("Document Type" , SalesH."Document Type"::Invoice)
        else begin
            if SalesDocCW."Legal Document" = '07' then begin
                SalesH.Validate("Document Type" , SalesH."Document Type"::"Credit Memo");
                SalesH.Validate("EB NC/ND Support Description" , SalesDocCW."EB NC/ND Support Description");
                case SalesDocCW."Applies-to Doc. Type" of
                    SalesH."Applies-to Doc. Type"::Payment.AsInteger():
                        SalesH.Validate("Applies-to Doc. Type" , SalesH."Applies-to Doc. Type"::Payment);
                    SalesH."Applies-to Doc. Type"::"Credit Memo".AsInteger():
                        SalesH.Validate("Applies-to Doc. Type" , SalesH."Applies-to Doc. Type"::"Credit Memo");
                    SalesH."Applies-to Doc. Type"::Invoice.AsInteger():
                        SalesH.Validate("Applies-to Doc. Type" , SalesH."Applies-to Doc. Type"::Invoice);
                    SalesH."Applies-to Doc. Type"::Refund.AsInteger():
                        SalesH.Validate("Applies-to Doc. Type" , SalesH."Applies-to Doc. Type"::Refund);
                    SalesH."Applies-to Doc. Type"::"Finance Charge Memo".AsInteger():
                        SalesH.Validate("Applies-to Doc. Type" , SalesH."Applies-to Doc. Type"::"Finance Charge Memo");
                    SalesH."Applies-to Doc. Type"::Reminder.AsInteger():
                        SalesH.Validate("Applies-to Doc. Type" , SalesH."Applies-to Doc. Type"::Reminder);
                end;
                SalesH.Validate("Applies-to Doc. No." , SalesDocCW."Applies-to Doc. No.");
            end;
        end;
        SalesH."No." := '';
        SalesH.Validate("Sell-to Customer No.",SalesDocCW."Sell-to Customer No.");
        SalesH.Validate("Bill-to Customer No.",SalesDocCW."Sell-to Customer No.");
        SalesH.Validate("Posting Date" , SalesDocCW."Posting Date");
        SalesH.Validate("EB Type Operation Document" , SalesDocCW."EB Type Operation Document");
        SalesH.Validate("Currency Code" , SalesDocCW."Currency Code");
        case SalesDocCW."Currency Code" of
            'EUR':
                SalesH.Validate("Customer Posting Group",'NAC-EU');
            'USD':
                SalesH.Validate("Customer Posting Group",'NAC-ME');
        else
            SalesH.Validate("Customer Posting Group",'NAC-MN');
        end;
        SalesH.Validate("Cargowise Invoice No." , SalesDocCW."Cargowise Invoice No.");
        SalesH.Validate("BL No." , SalesDocCW."BL No.");
        SalesH.Validate("Shipper Name" , SalesDocCW."Shipper Name");
        SalesH.Validate("Consignee Name" , SalesDocCW."Consignee Name");
        SalesH.Validate(Origin , SalesDocCW.Origin);
        SalesH.Validate(Destination , SalesDocCW.Destination);
        SalesH.Validate("Get Out Date" , SalesDocCW."Get Out Date");
        SalesH.Validate("Arrived Date" , SalesDocCW."Arrived Date");
        SalesH.Validate("Purchase order No." , SalesDocCW."Purchase order No.");
        SalesH.Validate("Routing No." , SalesDocCW."Routing No.");
        SalesH.Validate("No. Sales Shipment" , SalesDocCW."No. Sales Shipment");
        SalesH.Validate("Carrier Name" , SalesDocCW."Carrier Name");
        SalesH.Validate("Sales Detraction" , SalesDocCW."Sales Detraction");

        DetracServOpe.Reset();
        DetracServOpe.SetFilter(DetracServOpe."Type Services/Operation", '%1', 1);
        DetracServOpe.SetFilter(DetracServOpe.Code, '%1', SalesDocCW."Operation Type Detrac");
        DetracServOpe.FindFirst();
        SalesH.Validate("Operation Type Detrac" , DetracServOpe.Code);

        DetracServOpe.Reset();
        DetracServOpe.SetFilter(DetracServOpe."Type Services/Operation", '%1', 0);
        DetracServOpe.SetFilter(DetracServOpe.Code, '%1', SalesDocCW."Service Type Detrac");
        DetracServOpe.FindFirst();
        SalesH.Validate("Service Type Detrac" , DetracServOpe.Code);
        SalesH.Validate("Sales % Detraction",DetracServOpe."DetrAction Percentage");

        SalesH.Validate("Payment Method Code Detrac" , SalesDocCW."Payment Method Code Detrac");
        SalesH.Insert(true);
        Message('Inserto %1',SalesH."No.");
        SalesH.Validate("Legal Document" , SalesDocCW."Legal Document");
        SalesH.Validate("EB Electronic Bill" , SalesDocCW."EB Electronic Bill");
        SalesH.Validate("Shortcut Dimension 3 Code",SalesDocCW."Shortcut Dimension 3 Code");
        SalesH.Validate("Shortcut Dimension 1 Code",SalesDocCW."Shortcut Dimension 1 Code");
        SalesH.Validate("Shortcut Dimension 2 Code",SalesDocCW."Shortcut Dimension 2 Code");
        SalesH.Modify(true);
        Message('Modifico %1',SalesH."No.");

        SalesDocCWL.SetRange("Document No.",SalesDocCW."No.");
        SalesDocCWL.FindFirst();
        repeat begin
            SalesL.Init();
            SalesL.Validate("Document Type",SalesL."Document Type"::Invoice);
            SalesL.Validate("Document No.",SalesH."No.");
            SalesL.Validate("Line No.",SalesDocCWL."Line No.");
            SalesL.Validate(Type,SalesDocCWL.Type);
            SalesL.Validate("Standard Sales Code" , SalesDocCWL."Standard Sales Code");
            SalesL.Validate("VAT Prod. Posting Group" , SalesDocCWL."VAT Prod. Posting Group");
            SalesL.Validate(Description , SalesDocCWL.Description);
            SalesL.Validate(Quantity , SalesDocCWL.Quantity);
            SalesL.Insert(true);
            SalesL.Validate("Unit Price" , SalesDocCWL."Unit Price");
            SalesL.Validate("Shortcut Dimension 1 Code" , SalesDocCWL."Shortcut Dimension 1 Code");
            SalesL.Validate("Shortcut Dimension 2 Code" , SalesDocCWL."Shortcut Dimension 2 Code");
            SalesL.ValidateShortcutDimCode(3,SalesDocCWL."Shortcut Dimension 3 Code");
            SalesL.Modify(true);
        end until SalesDocCWL.Next( ) = 0;

        SalesH.Validate("Sales % Detraction");
        SalesH.Modify(true);
        SalesDocCW."Loaded?" := true;
        SalesDocCW.Modify();
  end;
  procedure LoadPurchaseData(PurchaseDocCW: Record "Purchase Doc. CargoWise")
  var
      PurchaseH: Record "Purchase Header";
      PurchaseL: Record "Purchase Line";
      PurchaseDocCWL: Record "Purchase Doc. CargoWise Line";
      Vendor: Record Vendor;
  begin
        PurchaseH.Init();
        if PurchaseDocCW."Legal Document" = '01' then
            PurchaseH.Validate("Document Type" , PurchaseH."Document Type"::Invoice)
        else begin
            if PurchaseDocCW."Legal Document" = '07' then begin
                PurchaseH.Validate("Document Type" , PurchaseH."Document Type"::"Credit Memo");
                case PurchaseDocCW."Applies-to Doc. Type" of
                    PurchaseH."Applies-to Doc. Type"::Payment.AsInteger():
                        PurchaseH.Validate("Applies-to Doc. Type" , PurchaseH."Applies-to Doc. Type"::Payment);
                    PurchaseH."Applies-to Doc. Type"::"Credit Memo".AsInteger():
                        PurchaseH.Validate("Applies-to Doc. Type" , PurchaseH."Applies-to Doc. Type"::"Credit Memo");
                    PurchaseH."Applies-to Doc. Type"::Invoice.AsInteger():
                        PurchaseH.Validate("Applies-to Doc. Type" , PurchaseH."Applies-to Doc. Type"::Invoice);
                    PurchaseH."Applies-to Doc. Type"::Refund.AsInteger():
                        PurchaseH.Validate("Applies-to Doc. Type" , PurchaseH."Applies-to Doc. Type"::Refund);
                    PurchaseH."Applies-to Doc. Type"::"Finance Charge Memo".AsInteger():
                        PurchaseH.Validate("Applies-to Doc. Type" , PurchaseH."Applies-to Doc. Type"::"Finance Charge Memo");
                    PurchaseH."Applies-to Doc. Type"::Reminder.AsInteger():
                        PurchaseH.Validate("Applies-to Doc. Type" , PurchaseH."Applies-to Doc. Type"::Reminder);
                end;
                PurchaseH.Validate("Applies-to Doc. No." , PurchaseDocCW."Applies-to Doc. No.");
            end;
        end;
        PurchaseH.Validate("Document Type" , PurchaseH."Document Type"::Invoice);
        PurchaseH."No." := '';
        PurchaseH.Validate("Buy-from Vendor No.",PurchaseDocCW."Buy-from Vendor No.");
        PurchaseH.Validate("Posting Date" , PurchaseDocCW."Posting Date");
        PurchaseH.Validate("Document Date" , PurchaseDocCW."Document Date");
        PurchaseH.Validate("Legal Document" , PurchaseDocCW."Legal Document");
        PurchaseH.Validate("Electronic Bill" , PurchaseDocCW."Electronic Bill");
        PurchaseH.Validate("Vendor Invoice No." , PurchaseDocCW."Vendor Invoice No.");
        PurchaseH.Validate("Posting Text" , PurchaseDocCW."Posting Text");
        PurchaseH.Validate("Legal Property Type" , PurchaseDocCW."Legal Property Type");
        PurchaseH.Validate("Payment Terms Code" , PurchaseDocCW."Payment Terms Code");
        Vendor.Reset();
        Vendor.Get(PurchaseDocCW."Buy-from Vendor No.");
        PurchaseH.Validate("Payment Method Code" , Vendor."Payment Method Code");
        PurchaseH.Validate("Purch. Detraction" , PurchaseDocCW."Purch. Detraction");
        PurchaseH.Validate("Type of Service" , PurchaseDocCW."Type of Service");
        PurchaseH.Validate("Type of Operation" , PurchaseDocCW."Type of Operation");
        PurchaseH.Validate("Purch Date Detraction" , PurchaseDocCW."Purch Date Detraction");
        PurchaseH.Insert(true);
        Message('Inserto %1',PurchaseH."No.");
        PurchaseH.Validate("Shortcut Dimension 1 Code",PurchaseDocCW."Shortcut Dimension 1 Code");
        PurchaseH.Validate("Shortcut Dimension 2 Code",PurchaseDocCW."Shortcut Dimension 2 Code");
        PurchaseH.Modify();
        Message('Modifico %1',PurchaseH."No.");

        PurchaseDocCWL.SetRange("Document No.",PurchaseDocCW."No.");
        PurchaseDocCWL.FindFirst();
        repeat begin
            PurchaseL.Init();
            PurchaseL.Validate("Document Type",PurchaseL."Document Type"::Invoice);
            PurchaseL.Validate("Document No.",PurchaseH."No.");
            PurchaseL.Validate("Line No.",PurchaseDocCWL."Line No.");
            PurchaseL.Validate(Type,PurchaseDocCWL.Type);
            PurchaseL.Validate("No." , PurchaseDocCWL."No.");
            PurchaseL.Validate("Direct Unit Cost" , PurchaseDocCWL."Direct Unit Cost");
            PurchaseL.Validate(Quantity , PurchaseDocCWL.Quantity);
            PurchaseL.Insert();
            PurchaseL.Validate("Shortcut Dimension 1 Code" , PurchaseDocCWL."Shortcut Dimension 1 Code");
            PurchaseL.Validate("Shortcut Dimension 2 Code" , PurchaseDocCWL."Shortcut Dimension 2 Code");
            PurchaseL.ValidateShortcutDimCode(3,PurchaseDocCWL."Shortcut Dimension 3 Code");
            PurchaseL.Modify();
        end until PurchaseDocCWL.Next( ) = 0;
        PurchaseDocCW."Loaded?" := true;
        PurchaseDocCW.Modify();
  end;
}
