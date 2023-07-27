
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="10_Map.aspx.cs" Inherits="WebApplication5.WebForm8" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/leaflet/1.9.4/leaflet.css" integrity="sha512-Zcn6bjR/8RZbLEpLIeOwNtzREBAJnUKESxces60Mpoj+2okopSAcSUIUOseddDm0cxnGQzxIR7vJgsLZbdLE3w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/leaflet/1.9.4/leaflet.js" integrity="sha512-BwHfrr4c9kmRkLw6iXFdzcdWV/PGkVgiIyIWLLlTSXzWQzxuSg4DiQUCpauz/EWjgk5TYQqX/kvn9pG1NpYfqg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <script type="text/javascript">
        function loadMap() {
            var gridView = document.getElementById('GridView1');
            var locations = [];
            for (var i = 1; i < gridView.rows.length; i++) {
                var row = gridView.rows[i];

                var val = row.cells[0].innerHTML;
                var lat = parseFloat(val);

                val = row.cells[1].innerHTML;
                var long = parseFloat(val);

                var location = [lat, long];
                locations.push(location);
            }

            var first_loc_lat = locations[0][0];
            var first_loc_long = locations[0][1];
            var map = L.map('map').setView([first_loc_lat, first_loc_long], 15);

            L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors',
                maxZoom: 18
            }).addTo(map);

            function random_col() {
                return '#' + Math.floor(Math.random() * 16777215).toString(16);
            }

            for (var i = 0; i < locations.length - 1; i++) {
                var color = random_col();
                L.polyline([locations[i], locations[i + 1]], { color: color }).addTo(map);
                L.marker(locations[i]).addTo(map);
            }
            L.marker(locations[locations.length - 1]).addTo(map);
        };
    </script>

<body>
    <form id="form1" runat="server">

        <div>
            <div id="map" style="height: 95vh;"></div>
        </div>
        <div>
            <asp:GridView ID="GridView1" runat="server"> </asp:GridView>
        </div>
    </form>
    

    
</body>
</html>

