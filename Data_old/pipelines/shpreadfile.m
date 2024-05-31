clear;clc;close all

pwrplnt = readtable("EPA_flight_GHG_powerplants_data.xls");
            facility = pwrplnt(:, 2)
            istring(facility)