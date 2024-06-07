ccc

s = shaperead('../USCensus_small_states/cb_2018_us_state_20m.shp');
s_GT = struct2geotable(s,'geographic',["Y","X"],'CoordinateReferenceSystem',geocrs(4326));% using WGS 84 from https://epsg.org/search/by-name?sessionkey=wvoik7m2sc&searchedTerms=WGS+84#crs


TCTAC_GT = s_GT;
TCTAC_GT.Region = zeros(size(s_GT,1),1);
%%

% region 1
reg{1} = ["VT","NH","ME","MA","CT","RI"];
center_name{1} = "TBA";

% Region 2
reg{2} = ["NY","PR","NJ"];
center_name{2} = ["West Harlem Environmental Action, Inc."; "Inter-American University of Puerto Rico-Metro Campus"];

% region 3
reg{3} = ["PA","WV","MD","VA","DE","DC"];
center_name{3} = ["National Wildlife Federation"];

% Region 4
reg{4} = ["TN","AL","GA","MS","SC","NC","FL"];
center_name{4} = ["Reserach Triangle Institute"; "Deep South Center for EJ"];

% region 5
reg{5} = ["MN","WI","MI","IN","IL","OH","KY"];
center_name{5} = ["Blacks in Green"; "University of Minnesota"];


% Region 6
reg{6} = ["NM","OK","TX","LA","AR"];
center_name{6} = ["New Mexico State University"; "Deep South Center for EJ"];


% region 7
reg{7} = ["NE","KS","IA","MO"];
center_name{7} = "Wichita State University";


% Region 8
reg{8} = ["MT","WY","UT","CO","SD","ND"];
center_name{8} = "TBA";


% region 9
reg{9} = ["CA","NV","AZ","HI"];
center_name{9} = ["University of Arizona"; "San Diego State University"];


% Region 10
reg{10} = ["WA","OR","ID","AK"];
center_name{10} = ["Willamette Partnership"; "University of Washington"];

%%
for i = 1:length(reg)
    for j = 1:length(reg{i})
        state_id = find(strcmp(TCTAC_GT.STUSPS,reg{i}(j)));
        TCTAC_GT.Region(state_id) = i;
    end
end

save('TCTAC_GT','TCTAC_GT')

%% national and regional centers

center_points{2} = [40.829794450086766, -73.94475246012729;18.369341207814177, -66.07742463612962];

center_points{3} = [39.06222163842879, -77.34254505894327];

center_points{4} = [36.00880924879912, -78.90326878071293; 30.030091902094078, -89.97978354511444];

center_points{5} = [41.77792762054117, -87.60557582675831;44.97418730737921, -93.22767485813218];

center_points{6} = [32.27947915925839, -106.74910691621795; 30.030091902094078, -89.97978354511444];

center_points{7} = [37.71936482613679, -97.28992064488952];

center_points{9} = [32.232093809693005, -110.9500557585488;32.77763920864711, -117.07137461620395];

center_points{10} = [45.519024227587565, -122.6520701157824;47.6548068899861, -122.30744717337159];

national = [44.25560458924657, -72.57355926931096;38.91718106106212, -77.0048380370576;38.900057013617754, -77.00858773216373];

national_center = ["Institute for Sustainable Communities", "National Indian Health Board", "International City/County Management Association"];
%%
cp_T = table;
centers = [2:7 9,10];
count = 1;
for i = 1:length(centers)
    for j = 1:size(center_points{centers(i)},1)
    cp_T.Latitude(count) = center_points{centers(i)}(j,1);
    cp_T.Longitude(count) = center_points{centers(i)}(j,2);
    cp_T.Name(count) = center_name{centers(i)}(j);
    cp_T.Region(count) = centers(i);
    cp_T.R_or_N(count) = "R";
    count = count + 1;
    end
end


for i = 1:size(national,1)
    cp_T.Latitude(count) = national(i,1);
    cp_T.Longitude(count) = national(i,2);
    cp_T.Name(count) = national_center(i);
    cp_T.Region(count) = 0;
    cp_T.R_or_N(count) = "N";
    count = count + 1;
end

TCTAC_center_GT = table2geotable(cp_T,"geographic");

save('TCTAC_center_GT','TCTAC_center_GT')

shapewrite(TCTAC_center_GT,'TCTAC_Awardees.shp')

%% partner facilities


% {"Environmental Protection Network (nonprofit, technical assistance)},...
% {"Community Engineering Corps},...
% {"Environmental Protection Network},...
% {"Environmental Protection Network (non-profit)},...
% {"The Midwest Tribal Energy Resources Association (MTERA)},...
% {"Jackson State Univ.},...
% {"Xavier University (Louisiana or Ohio?)},...
% {"Government: U.S. Representative, 2nd District},...
% {"New Orleans City Council District E.},...
% {"Midwest Tribal Energy Resources Association (non-profit)},...
% {"Environmental Protection Network (non-profit)},...
% {"Environmental Protection Network},...
% {"Health Impacts of Degraded Environments},...
% {"Union of Concerned Scientist},...
% {"Metropolitan Group},...
% {"Center for Earth Energy and Democracy},...
% {"G.A.A.P. Grant Writing Training (Non-profit)},...
% {"Community Engineering Corps},...
% {"Environmental Protection Network},...
% {"International City/County Management Association is a national EJ TCTAC that will serve Region 8 until a Region 8-focused EJ TCTAC is selected, expected in early 2024.},...
% {"Larson Institute for Health Impact and Equity (NV academic)},...
% {"Environmental Protection Network (industry)},...
% {"Climate Science Alliance (non-profit education)", 32.732019471737416, -117.14740458798576 (this is where their conference was)},...
% {"Public Health Alliance (non-profit)},...
% {"Community Engineering Corps (nonprofit)},...
% {"Center for American Indian & Indigenous Studies (academic)},...
% {"National Network of Public Health Institutes (NNPHI) (practice)},...
% {"Institute for Tribal Environmental Professionals (academic, tribal)},...



TCTAC_partners = ...
{{"New York University School of Law Institute for Policy Integrity (academic)", 40.73138913288111, -73.99990514394723},...
{"Inter American University (academic)", 40.800827478445825, -73.9707445555873},...
{"Columbia University Climate School (academic)", 40.806592754432934, -73.9645726202264},...
{"Clean Energy Group (nonprofit, technical assistance)", 41.00177579364271, -73.45161551766728},...
{"New Jersey Environmental Justice Alliance (nonprofit, environmental justice)", 40.73831107466248, -74.17326256583868},...
{"South Ward Environmental Alliance (nonprofit, environmental justice)", 40.71039187810492, -74.21398920934881},...
{"WEACT", 40.830057147678424, -73.94465829456702},...
{"NJ Science and Technology University", 40.75785700673459, -74.16160646045164},...
{"Vitrina Solidaria", 18.427610101635658, -66.05806701946118},...
{"Energy Justice PR", 18.42469204540892, -66.06436395286471},...
{"Department of Economic Development and Commerce of PR &", 18.42098963663718, -66.06781598064504},...
{"SBDC for Region 2", 18.493017006492828, -64.9700013338196},...
{"University of Maryland's (UMD) Center for Community Engagement Environmental Justice and Health (CEEJH)", 38.984952981912706, -76.940695626956},...
{"Environmental Finance Center (EFC)", 39.02658458752401, -76.9186922252166},...
{"Morgan State University", 39.3439411009861, -76.58438469998535},...
{"West Virginia State University", 38.37938601708026, -81.76658964830999},...
{"Centro De Apoyo Familiar", 38.97079985575867, -76.91525762881759},...
{"South Baltimore Community Land Trust", 39.32734843418486, -76.61379599082332},...
{"Overbrook Education Center", 39.97408392745048, -75.25475620943722},...
{"Sussex Health & Environmental Network/Sentinels of Eastern Shore Health", 38.54081195051759, -76.06493212769388},...
{"North Carolina Central University (academic/Minority-serving Institution [MSI])", 35.97564861508329, -78.89960604564178},...
{"University of Memphis (academic)", 35.11870286583257, -89.93748855391851},...
{"University of South Carolina (academic)", 34.096690806813704, -80.85422916431992},...
{"University of Georgia (academic)", 33.95798972842355, -83.37308131637738},...
{"Florida Agricultural and Mechanical University (academic/MSI)", 30.42300450455109, -84.28766436104554},...
{"Alabama Agricultural and Mechanical University (academic/MSI)", 34.90556387244104, -86.58320999347812},...
{"University of Kentucky (academic)", 38.04600041294646, -84.50300279929107},...
{"Jackson State University (academic/MSI)", 32.29834808759719, -90.20590998093088},...
{"Black Environmental Leaders (BEL)", 41.38427810933647, -81.4363766545317},...
{"Environmental Health Watch (EHW)", 41.503583943359295, -81.65481871033681},...
{"The School of Public Health, University of Illinois, Chicago", 41.869002474100235, -87.6676217477647},...
{"The Smart Energy Design Center, University of Illinois at Urbana-Champaign (SEDAC)", 40.09252437612284, -88.23867175123148},...
{"University of Minnesota (academic)", 44.974107642942904, -93.22770704230139},...
{"University of Illinois Urbana-Champaign (academic)", 40.10206308739771, -88.22716149996882},...
{"Michigan State University (academic)", 42.72977686468226, -84.48043975186286},...
{"Purdue University (academic)", 40.423864666875595, -86.92116241346795},...
{"Ohio State University (academic)", 40.00680789622505, -83.0304116846314},...
{"Great Plains Institute (non-profit)", 44.95101593379215, -93.24190813252089},...
{"Community Engineering Corps (non-profit)", 44.948137682841825, -93.08875314231408},...
{"Academic: Alabama A&M University", 34.783951046195035, -86.57224515765114},...
{"Bethune Cookman University", 29.211204170661663, -81.0315418134693},...
{"Spelman College", 33.74532685055149, -84.41143343981419},...
{"Dillard University", 29.99733912135318, -90.06644205580201},...
{"North Carolina Central University", 35.9754527392786, -78.89963254231307},...
{"South Carolina State University", 33.555409363829796, -80.82181736185204},...
{"Tennessee State University", 36.16849588789868, -86.82584587114376},...
{"Texas Southern University", 29.72159377204069, -95.35923691345488},...
{"Community-Based: Clean, Healthy, Educated, Safe and Sustainable", 30.741669720630544, -88.05473662334414},...
{"Unity in the Family Ministry", 30.42002575219532, -87.2509314999773},...
{"Education, Economics, Environmental, Climate, and Health Organization", 29.507262578239786, -82.28147452880488},...
{"East New Orleans Neighborhood Advisory Commission", 30.03972537021384, -89.97844888463557},...
{"Coalition of Community Organizations", 29.773328898993995, -95.31198204835077},...
{"City of New Orleans Office of Hazard Mitigation", 29.952150352178034, -90.07704288685109},...
{"Louisiana Department of Environmental Quality", 29.675586869470845, -90.53958858554554},...
{"Research and Policy: Bullard Center for Environmental and Climate Justice", 29.721318002779707, -95.35914482881338},...
{"Alliance for Affordable Energy", 29.940648115514527, -90.10502328294773},...
{"Environmental Defense Fund (NC)", 35.80265588652405, -78.70826409996978},...
{"Environmental Defense Fund (TX)", 30.26547943117562, -97.74318309997933},...
{"Healthy Gulf", 29.9531730853971, -90.07312875765008},...
{"Land Loss Prevention Project", 35.997198762474746, -78.89911975764802},...
{"Ocean Conservancy", 25.751065808865146, -80.22855948463511},... %or 27.77199019901508, -82.64206521346296
{"West Atlanta Watershed Alliance", 33.730475870693745, -84.43491677113713},...
{"People Organized in Defense of Earth and Her Resources", 30.252273803546306, -97.70086936233069},...
{"Faith-Based: Louisiana General Missionary Baptist Convention and the Baptist Pastors Conference of New Orleans", 30.27753992479542, -97.70559090183043},...
{"NMSU (Academic-College of Engineering and Cooperative Extension Service)", 32.27952907448212, -106.74913909998008},...
{"Beloved Community (Non-profit)", 29.99979111779582, -90.05988677114593},...
{"UT Arlington-based Texas Manufacturing Extension Program (Academic, TMAC)", 32.72923426368025, -97.11541167669787},...
{"Life City (Business/Industry)", 29.964617063573616, -90.08228461531972},...
{"Santa Fe Green Chamber of Commerce (Non-profit, SFGCC)", 35.68398052432348, -105.94365710970656},...
{"Inter-Tribal Council of Louisiana(Non-profit)", 29.581665031220563, -90.69308229998448},...
{"Arkansas Capital Corporation (Business/Industry, ACC)", 36.104423284732746, -94.14856590077513},...
{"Gulf States Renewable Energy Industry Association (Non-profit, GSREIA)", 29.94703128824969, -90.06886446458974},...%  Together Louisiana (Non-profit)
{"Center for Rural Affairs", 41.93730127139427, -96.4777681711383},...
{"Climate and Energy Project", 38.05393610856558, -97.92928227708211},...
{"Iowa Environment Council", 41.58831496776453, -93.62400393539696},...
{"Kansas Rural Center", 38.48846516194459, -98.38018925361725},...
{"Kansas State University Engineering Extension", 39.18859817339914, -96.59999247113879},...
{"Metropolitan Congregations United", 38.6477542103822, -90.25590292882188},...
{"Sonoran Environmental Research Institute (SERI) (AZ non-profit)", 32.25034672135379, -110.9240104576495},...
{"Public Health Institute (PHI) (CA non-profit)", 37.803617726234265, -122.27532161999198},...
{"University of Southern California (USC) (CA academic)", 34.02231188478418, -118.28512772880823},...
{"Hawaii Public Health Institute (HIPHI) (HI non-profit)", 21.30540040875306, -157.86217008810198},...
{"SDSU Community Climate Action Network (academic)", 33.037785014742894, -117.29386306929604},...
{"Center for Creative Land Recycling (non-profit)", 37.86606768852407, -122.26837193811811},...
{"University of San Diego’s Energy Policy Initiatives Center (academic)", 32.77239082306487, -117.18784258771511},...
{"Institute for Tribal Environmental Professionals (tribal)", 35.18020052837708, -111.65404084699394},...
{"Desert Research Institute (non-profit, NV)", 36.113955777867474, -115.14853308516122},...
{"Pacific RISA (research)", 21.296948113403648, -157.81464369997786},...
{"University of Guam’s Center of Island Sustainability (academic)", 13.43166484693074, 144.79956192886044},...
{"Arizona State University (academic)", 33.4229985834665, -111.9264027260695},...
{"Portland State University (academic)", 45.51111154076257, -122.68333849997833},...
{"Rural Community Assistance Corporation (nonprofit)", 38.57448716946199, -121.55234351347566},...
{"Alai Community Consulting (business)", 37.70679269028744, -122.04861151930282},...
{"Oregon Public Health Institute (nonprofit)", 45.52605399648758, -122.64662871436008},...
{"Verde (nonprofit)", 45.55356355795116, -122.60288208806556},...
{"Boise State University (academic)", 43.602335981546894, -116.20097617890896},...
{"Kearns and West (private)", 45.52168844147799, -122.66003115765294},...
{"Akiak Native Community, Swinomish Tribe- Education Division", 60.90739470759823, -161.22406343436296},...
{"Kuskokwim River Intertribal Fish Commission (KRIFC) (Tribe)", 60.79188021622854, -161.75471360060686},...
{"Northwest Indian College", 48.79460077297617, -122.61440722076954},...
{"American Indian Studies Department (academic)", 47.65615393688512, -122.30406903525419},...
{"Aldo Leopold Wilderness Research Institute (Federal agency research institute)", 46.857373939429095, -113.98509409099128},...
{"Clean Energy Institute, Center for Exposures, Diseases, Genomics, and Environment, Industrial Assessment Center, Northwest Center for Occupational Health and Safety, NW Pediatric Environmental Health", 47.65815896461708, -122.31834586942128},...
{"Specialty Unit, Pacific Northwest Agricultural Safety and Health Center,(academic)", 47.658166860351805, -122.31812424230418},...
{"El Centro de la Raza", 47.58028238139712, -122.31144699998133},... % El Proyecto Bienestar
{"Front and Centered, Sound Defense Alliance (community orgs)", 47.556718098838225, -122.33322869997352},...
{"National League of Cities (elected officials, local government)", 38.89652832469284, -77.0094894999728},...
{"National Forum for Black Public Administrators (local government)", 38.89902657535941, -77.01404479997967},...
{"Urban Sustainability Directors Network (local government, community organizations)", 43.40778882566871, -87.87339842881727},...
{"Atma Connect (Atma), a non-profit technology organization", 37.80707770842539, -122.22247742880957},...
{"American Society for Adaptation Professionals (ASAP), a non-profit association", 42.24119835545271, -83.61293779894508}};

%%

p_T = table;
count = 1;
for i = 1:size(TCTAC_partners,2)
    p_T.Latitude(count) = TCTAC_partners{i}{2};
    p_T.Longitude(count)= TCTAC_partners{i}{3};
    p_T.Name(count) = TCTAC_partners{i}{1};
    count = count + 1;
end

%%
TCTAC_partners_GT = table2geotable(p_T,"geographic");

save('TCTAC_partners_GT','TCTAC_partners_GT')

shapewrite(TCTAC_partners_GT,'TCTAC_partners_GT.shp')