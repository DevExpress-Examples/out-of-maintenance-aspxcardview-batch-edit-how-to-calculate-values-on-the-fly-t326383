<%@ Page Language="VB" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register assembly="DevExpress.Web.v15.2, Version=15.2.20.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">
        function OnBatchEditEndEditing(s, e) {
            window.setTimeout(function () {
                var price = s.batchEditApi.GetCellValue(e.visibleIndex, "Price");
                var quantity = s.batchEditApi.GetCellValue(e.visibleIndex, "Quantity");
                s.batchEditApi.SetCellValue(e.visibleIndex, "Sum", price * quantity);
            }, 10);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <dx:ASPxCardView ID="Grid" runat="server" KeyFieldName="ID" OnBatchUpdate="ASPxCardView1_BatchUpdate" 
            OnCardInserting="ASPxCardView1_CardInserting" OnCardUpdating="ASPxCardView1_CardUpdating" OnCardDeleting="ASPxCardView1_CardDeleting"             
            OnCustomUnboundColumnData="ASPxCardView1_CustomUnboundColumnData" AutoGenerateColumns="False">
            <ClientSideEvents BatchEditEndEditing="OnBatchEditEndEditing" />
            <SettingsEditing Mode="Batch">
            </SettingsEditing>
            <Columns>
                <dx:CardViewSpinEditColumn FieldName="Quantity" VisibleIndex="0">
                    <PropertiesSpinEdit DisplayFormatString="g">
                    </PropertiesSpinEdit>
                </dx:CardViewSpinEditColumn>
                <dx:CardViewSpinEditColumn FieldName="Price" VisibleIndex="1">
                    <PropertiesSpinEdit DisplayFormatString="g">
                    </PropertiesSpinEdit>
                </dx:CardViewSpinEditColumn>
                <dx:CardViewTextColumn FieldName="Sum" ReadOnly="True" UnboundType="Decimal" VisibleIndex="2">
                </dx:CardViewTextColumn>
            </Columns>
            <CardLayoutProperties>
                <Items>
                    <dx:CardViewCommandLayoutItem HorizontalAlign="Right" ShowDeleteButton="True" ShowEditButton="True" ShowNewButton="True">
                    </dx:CardViewCommandLayoutItem>
                    <dx:CardViewColumnLayoutItem ColumnName="Quantity">
                    </dx:CardViewColumnLayoutItem>
                    <dx:CardViewColumnLayoutItem ColumnName="Price">
                    </dx:CardViewColumnLayoutItem>
                    <dx:CardViewColumnLayoutItem ColumnName="Sum">
                    </dx:CardViewColumnLayoutItem>
                    <dx:EditModeCommandLayoutItem HorizontalAlign="Right">
                    </dx:EditModeCommandLayoutItem>
                </Items>
            </CardLayoutProperties>
        </dx:ASPxCardView>
    
    </div>
    </form>
</body>
</html>
