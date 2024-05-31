README
Copyright (c) 2023 Sydney Sroka, Abigail Idiculla, and the MIT Climate and Sustainability Consortium


Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR
IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


Project: MIT Climate and Sustainability Consortium Resilience Pathway	
Developers: Abigail Idiculla, Sydney Sroka 	
Project Supervisor: Sydney Sroka
Date created: 2022-2023
Date of last update: --
Files location: https://www.dropbox.com/home/MCSC/MapApp/embedded_data/datasets/roads/macDonell_danikam_FAF5analysis	
README location: https://www.dropbox.com/home/MCSC/MapApp/embedded_data/datasets/roads

File types: * = "cpg", "dbf", "prj", or "shp"
Filename schema: One file (network_links_all.*) for all the highway networks, joined with the total freight flows (in tons/year) for each link (variable name of total flows: Refactored).
One file (network_links_[lower flow]_[upper flow].*) with the network links corresponding to each range of total freight flows.
Example filename: "network_links_0.0_3148.06.cpg"

File Description: The "Roads" layer includes sub layers corresponding to the lower and upper freight flow limits defined according to QGIS's Jenks classification. As the flow rate bounds increase, the line thickness displayed on the map increases. The data can be found at this link and is attributed to Danika MacDonell: https://github.com/danikam/FAF5_Networks
