<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Subscription.aspx.cs" Inherits="CMPE285Website.Subscription" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:SqlDataSource ID="dsHospitals" runat="server" ConnectionString="<%$ ConnectionStrings:cmpe285ConnectionString %>" ProviderName="<%$ ConnectionStrings:cmpe285ConnectionString.ProviderName %>" SelectCommand="select HOSPITAL.hid, hname,haddress,hphno,a.score
from cmpe285.HOSPITAL join 
(select hID, avg(score) as `Score` from cmpe285.H_RATING
group by hID) a on (HOSPITAL.hID = a.hID);"></asp:SqlDataSource>
        <asp:GridView ID="gdSubscription" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="hid" DataSourceID="dsHospitals" AllowPaging="True">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:CheckBox runat="server" ID="chkBox" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="hid" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="hid" />
                <asp:BoundField DataField="hname" HeaderText="Hospital" SortExpression="hname" />
                <asp:BoundField DataField="haddress" HeaderText="Address" SortExpression="haddress" />
                <asp:BoundField DataField="hphno" HeaderText="Phone No." SortExpression="hphno" />
                <asp:BoundField DataField="score" HeaderText="Score" SortExpression="score" />
            </Columns>
        </asp:GridView>
    </div>
       
        <asp:Button ID="btnSubscribe" runat="server" OnClick="btnSubscribe_Click" Text="Subscribe" />
    </form>
</body>
</html>
