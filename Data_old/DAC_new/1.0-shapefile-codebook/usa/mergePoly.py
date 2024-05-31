
import sys
import os


import numpy as np
import pandas as pd

import geopandas as gpd
import geopy
from tqdm import tqdm, trange
import matplotlib.pyplot as plt

os.chdir("/Users/sydneysroka/MCSC/CCUS/UnifiedPlatform/CCUS_mapping/Data_old/DAC_new/1.0-shapefile-codebook/usa")
target_shapefiles = "usa.shp"

# os.chdir("/Users/sydneysroka/MCSC/CCUS/UnifiedPlatform/CCUS_mapping/Data_old/DAC_new/DAC Shapefiles (v2022c)(2)/")
# target_shapefiles = "DAC Shapefiles (v2022c).shp"
# target_shapefiles = "ED21-39003.shp"
#
df_all = gpd.read_file(target_shapefiles)
print(df_all['SN_C'][0:10])
df_DAC = df_all.dissolve(by="SN_C")
print(df_DAC)
df_DAC.to_file('CEQ_DAC_C.shp')

df_DAC_0 = df_DAC[df_DAC['SN_C']==0]
df_DAC_1 = df_DAC[df_DAC['SN_C']==1]

df_DAC_1_dissolve = df_DAC_1.dissolve

df_DAC_0.to_file('CEQ_DAC_C_0.shp')
df_DAC_1_dissolve.to_file('df_DAC_1_dissolve.shp')

# df_DAC = df_all[df_all['SN_C']==1].reset_index(drop=True)
# df_all.plot()
# plt.show()

# print('done reading in shp file\n')
# col = df_all.columns
# print(col)
# print(df_all['geometry'])
#
# polys_all = df_all['geometry']
# polys = polys_all.iloc[[0,4,5,6,7]].reset_index(drop=True)
#
# polys.plot()
# plt.show()
#
# poly1 = polys[0]
# poly2 = polys[1]
# poly3 = polys[2]
#
# mergeRegions = np.zeros(len(polys_all))
# df_all['mergeRegions'] = mergeRegions.tolist()
# print(df_all.columns)

# print(poly2.touches(poly3))
#
# ind = 1
# for i in range(len(polys)):




# df_all.plot()
# plt.show()
#
# df_all_2_1.plot()
# plt.show()
# df_all_2_1.to_file('CEQ_DAC_C.shp')
# #
# # # create the plot
# # fig, ax = plt.subplots(figsize = (10,6))
# #
# # # plot the data
# # df_all.reset_index().plot(column = 'DISTRICT', ax=ax)
# #
# # # Set plot axis to equal ratio
# # ax.set_axis_off()
# # plt.axis('equal')
#




















