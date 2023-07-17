<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="10.LeafletMaps.aspx.cs" Inherits="WebApplication5.WebForm8" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/leaflet/1.9.4/leaflet.css" integrity="sha512-Zcn6bjR/8RZbLEpLIeOwNtzREBAJnUKESxces60Mpoj+2okopSAcSUIUOseddDm0cxnGQzxIR7vJgsLZbdLE3w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
    </form>
    <div id="map" style="height: 95vh;"></div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/leaflet/1.9.4/leaflet.js" integrity="sha512-BwHfrr4c9kmRkLw6iXFdzcdWV/PGkVgiIyIWLLlTSXzWQzxuSg4DiQUCpauz/EWjgk5TYQqX/kvn9pG1NpYfqg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function ()
        {

            var map = L.map('map').setView([28.685339, 77.144332], 15); 

            L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            {
                attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors',
                maxZoom: 18
            }).addTo(map);

            var locations =
            [
                [28.692249, 77.145388], //1
                [28.678719, 77.140242], //2
                [28.686983, 77.153419], //3
                [28.686875, 77.135809], //4
                [28.678449, 77.150032], 
                [28.692249, 77.145388] 
            ];

            L.polyline(locations, { color: 'red' }).addTo(map);
        });
    </script>
</body>
</html>
