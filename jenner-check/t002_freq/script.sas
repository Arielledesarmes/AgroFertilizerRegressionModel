/* --- mock AgroFertilizer dataset (substituted for the external AgrofertilizerLossLessObs.csv) --- */
data AgroFertilizer;
  length Crop_Type $12 Soil_Type $8 Fertilizer_Type $8 Growth_Stage $8
         Application_Method $12 Coating_Type $18 Irrigation_Type $10;
  input Total_Fertilizer_Loss_kg_ha Rainfall Temperature Soil_pH Application_Rate
        Water_Amount Soil_Organic_Carbon Total_Nitrogen Available_Phosphorus
        Available_Potassium Bulk_Density Wind_Speed Evapotranspiration Humidity
        Crop_Type $ Soil_Type $ Fertilizer_Type $ Growth_Stage $
        Application_Method $ Coating_Type $ Irrigation_Type $;
  datalines;
38.86 841.5 19.2 4.87 56.8 422.6 3.6 2.21 19.2 126.9 1.66 4.4 4.11 88.6 Vegetable Sandy NK Late Drip Biochar Flood
24.27 912.3 36.0 6.45 150.1 265.0 3.36 3.13 38.1 199.5 1.52 9.5 3.36 52.9 Citrus Sandy PK Initial Drip Normal Flood
35.79 1095.3 14.7 7.68 138.2 575.9 2.87 2.79 57.7 130.9 1.4 6.9 2.74 48.9 Citrus Clay Urea Initial Foliar Controlled_release Drip
15.64 345.0 29.4 7.59 211.0 127.8 1.52 0.35 57.6 251.1 1.13 2.5 7.57 59.7 Wheat Sandy PK Mid Broadcasting Controlled_release Drip
48.83 1168.8 33.3 6.16 198.3 362.4 0.75 1.13 23.9 173.6 1.65 2.8 6.65 80.8 Citrus Loamy Organic Mid Broadcasting Biochar Drip
25.78 1069.8 15.6 7.41 185.0 181.1 3.85 1.86 35.1 238.5 1.14 7.7 6.32 37.0 Corn Sandy NK Initial Foliar Normal Sprinkler
12.26 303.8 28.6 4.62 242.2 106.4 3.52 3.28 13.8 230.7 1.01 8.2 2.69 86.4 Vegetable Sandy NK Late Foliar Biochar Sprinkler
22.61 768.4 16.4 7.83 125.3 230.9 2.55 1.53 30.9 120.3 1.02 4.0 6.83 35.9 Vegetable Clay Urea Late Broadcasting Biochar Sprinkler
41.7 1024.8 36.8 6.26 149.3 480.2 3.15 0.88 18.0 99.3 1.18 10.7 5.85 47.3 Rice Clay NK Initial Foliar Biochar Flood
13.78 437.3 26.6 4.96 153.2 248.4 3.08 1.49 25.6 123.2 1.11 6.4 2.09 62.2 Wheat Loamy PK Mid Drip Controlled_release Flood
11.3 530.7 23.0 6.81 102.5 292.5 3.12 2.04 50.7 288.1 1.39 5.7 4.27 82.4 Corn Sandy NPK Mid Foliar Biochar Drip
30.64 300.6 31.3 4.61 175.6 406.4 2.01 1.27 32.1 215.4 1.6 5.7 5.4 63.8 Citrus Sandy Urea Mid Drip Normal Drip
17.66 948.4 25.2 4.7 190.6 461.7 3.59 1.25 46.6 264.1 1.51 5.8 7.87 92.2 Corn Sandy NK Mid Foliar Normal Flood
21.37 466.5 12.8 6.82 127.0 146.2 3.06 1.29 55.8 140.8 1.2 7.9 3.46 52.4 Corn Loamy PK Late Foliar Normal Sprinkler
30.09 705.4 37.5 8.06 126.8 397.8 0.68 3.46 21.6 220.9 1.37 10.4 7.8 30.4 Corn Sandy NPK Late Drip Normal Flood
42.21 988.7 19.2 7.57 102.4 333.6 2.92 1.93 56.8 236.1 1.49 5.1 8.61 94.5 Rice Clay Urea Initial Foliar Controlled_release Flood
31.55 743.2 28.8 7.28 128.8 440.8 2.6 1.88 55.2 115.4 1.12 7.0 4.28 88.3 Wheat Loamy PK Late Broadcasting Controlled_release Flood
7.9 332.7 14.4 7.47 104.1 253.7 2.84 0.42 21.7 185.3 1.15 0.7 8.91 82.2 Wheat Sandy Urea Late Drip Controlled_release Sprinkler
54.02 1052.3 37.3 6.16 199.0 545.8 1.91 1.37 25.4 118.4 1.41 11.6 8.44 47.8 Rice Sandy Organic Initial Foliar Controlled_release Flood
7.76 485.7 15.7 7.76 58.3 526.6 1.47 1.85 22.2 222.2 1.02 7.4 4.84 55.1 Citrus Clay NPK Mid Foliar Controlled_release Sprinkler
29.01 1181.4 10.0 8.21 233.2 115.5 2.67 2.95 25.3 252.0 1.04 2.9 3.56 56.3 Corn Clay Organic Late Foliar Controlled_release Flood
39.5 323.8 31.8 8.42 150.4 480.0 0.73 0.46 23.8 255.3 1.33 8.0 3.44 48.1 Citrus Loamy NPK Mid Drip Controlled_release Flood
18.46 600.0 15.0 4.66 123.8 534.1 1.89 2.53 54.3 203.6 1.42 11.8 7.42 45.9 Vegetable Sandy Organic Late Broadcasting Controlled_release Flood
30.65 447.9 25.1 8.28 196.7 109.0 2.47 2.79 42.6 122.1 1.24 8.2 2.58 60.4 Wheat Loamy NPK Mid Foliar Controlled_release Drip
31.3 1031.0 37.3 5.1 85.3 332.5 3.95 2.43 17.5 256.8 1.39 7.1 4.57 78.4 Vegetable Clay Organic Initial Broadcasting Biochar Flood
44.46 1046.6 25.7 4.84 233.3 189.9 1.42 3.13 6.0 114.4 1.56 7.0 5.18 64.0 Vegetable Clay Urea Mid Drip Controlled_release Flood
40.68 414.2 36.0 7.32 101.5 332.4 2.89 0.33 34.9 123.9 1.27 0.6 8.82 82.4 Corn Loamy NK Late Foliar Biochar Drip
30.01 765.8 24.6 6.83 138.5 534.5 3.47 3.04 51.7 143.1 1.67 5.8 7.47 48.6 Citrus Clay NPK Initial Foliar Controlled_release Drip
27.26 719.4 16.5 6.6 186.7 391.2 2.48 1.89 19.2 293.7 1.14 1.8 2.52 47.3 Rice Sandy Urea Initial Foliar Biochar Drip
35.56 478.6 31.0 7.54 124.5 182.3 0.73 1.68 44.5 214.0 1.56 0.7 2.35 87.1 Vegetable Sandy PK Mid Drip Biochar Sprinkler
35.83 921.4 22.4 6.05 187.7 248.2 1.11 1.92 6.5 133.8 1.04 8.7 5.05 39.2 Rice Clay Organic Late Drip Normal Flood
16.76 484.7 19.5 4.55 139.6 281.7 2.38 3.42 46.8 88.7 1.32 0.6 5.58 65.9 Rice Sandy Organic Initial Broadcasting Controlled_release Drip
40.5 899.2 25.4 7.39 216.1 568.1 1.08 3.05 55.4 138.5 1.05 1.7 4.46 87.7 Vegetable Clay Organic Mid Broadcasting Normal Sprinkler
40.77 817.8 35.6 6.92 137.2 487.4 2.86 0.63 41.6 250.3 1.27 4.3 8.17 87.0 Citrus Loamy NPK Late Broadcasting Normal Flood
48.76 958.8 37.7 6.69 198.0 328.2 1.09 1.08 30.2 65.9 1.56 11.3 2.35 82.1 Vegetable Sandy PK Mid Foliar Controlled_release Flood
33.0 631.9 20.8 6.81 142.2 155.6 2.03 0.38 18.7 85.8 1.11 8.1 2.75 44.4 Corn Clay Organic Initial Foliar Normal Sprinkler
19.12 485.0 17.8 4.68 241.6 493.6 2.81 0.37 22.4 238.3 1.58 3.7 3.32 76.9 Corn Clay Organic Mid Drip Controlled_release Drip
33.88 1056.7 23.2 5.51 54.4 185.7 1.58 0.62 31.3 224.2 1.17 1.7 8.73 64.2 Rice Loamy Organic Initial Broadcasting Normal Flood
39.15 1187.9 19.1 7.06 99.5 264.4 3.03 3.23 25.7 149.3 1.62 9.3 6.34 45.7 Citrus Clay Urea Initial Broadcasting Controlled_release Flood
21.08 977.7 29.9 5.9 94.7 360.7 2.9 2.82 14.9 58.7 1.18 11.0 6.96 49.4 Vegetable Loamy PK Mid Drip Normal Flood
50.83 924.2 34.8 5.17 213.1 262.6 1.81 2.36 59.7 175.4 1.09 2.0 3.25 63.7 Corn Loamy PK Late Broadcasting Controlled_release Flood
30.48 410.7 12.4 4.95 57.8 522.4 1.31 3.41 24.9 214.4 1.12 4.0 3.73 68.8 Vegetable Sandy Organic Initial Foliar Normal Drip
33.8 1032.9 20.5 6.32 89.5 143.7 0.67 1.29 27.6 145.6 1.27 8.0 4.46 38.4 Rice Clay NK Late Foliar Biochar Sprinkler
24.04 1102.2 22.5 5.14 98.1 388.2 0.9 1.92 45.6 62.4 1.65 2.3 8.18 40.4 Citrus Clay NPK Mid Drip Normal Flood
21.82 642.4 20.7 7.81 68.0 427.2 2.01 1.27 49.0 234.5 1.02 1.4 3.84 40.4 Rice Clay PK Initial Broadcasting Biochar Flood
26.94 663.2 25.0 6.12 110.1 439.2 1.53 2.13 17.0 176.6 1.65 11.2 7.25 78.9 Citrus Sandy NK Initial Foliar Controlled_release Sprinkler
29.43 546.4 20.2 6.27 94.3 220.2 1.68 2.82 21.1 295.5 1.31 8.1 4.89 55.8 Corn Clay Urea Late Drip Normal Sprinkler
20.85 840.5 30.4 4.67 81.7 252.0 2.57 3.11 10.2 83.6 1.47 11.3 2.65 31.6 Vegetable Clay PK Mid Drip Biochar Drip
49.59 1014.0 37.2 7.32 237.7 472.7 1.81 0.77 15.7 191.6 1.1 11.3 7.54 88.1 Rice Sandy Urea Initial Foliar Controlled_release Drip
34.67 1114.8 23.0 8.23 152.1 433.0 3.99 2.44 17.7 295.3 1.06 1.5 7.64 70.0 Vegetable Clay PK Initial Broadcasting Controlled_release Drip
35.14 995.5 22.9 7.02 233.8 104.7 0.78 1.36 39.6 275.3 1.31 7.0 2.65 81.9 Vegetable Sandy Organic Initial Foliar Controlled_release Flood
51.19 1099.9 28.2 5.35 213.1 510.0 1.7 1.86 24.9 161.7 1.34 2.2 4.19 59.8 Citrus Sandy NPK Mid Foliar Biochar Drip
26.14 766.3 11.8 4.71 142.5 260.5 0.62 1.87 21.8 56.8 1.17 7.0 6.71 74.8 Corn Clay NPK Mid Broadcasting Normal Drip
17.41 453.4 12.9 8.42 53.8 167.2 2.05 1.76 46.8 253.3 1.66 5.0 3.03 58.1 Corn Sandy PK Late Drip Biochar Sprinkler
34.97 1065.7 23.3 5.78 84.9 355.2 1.06 3.26 29.1 118.3 1.0 4.9 8.83 79.1 Wheat Loamy NK Mid Foliar Normal Flood
28.27 699.9 15.8 7.01 111.2 184.6 2.98 3.48 38.2 193.0 1.22 9.1 2.06 80.1 Vegetable Clay PK Late Foliar Normal Drip
51.04 973.2 27.6 6.93 61.6 182.0 1.71 1.31 44.9 275.7 1.45 9.8 3.89 83.1 Wheat Loamy Urea Late Foliar Controlled_release Flood
15.45 394.0 19.3 5.53 129.9 248.3 3.47 0.63 58.9 56.6 1.37 2.1 7.15 48.4 Corn Clay PK Initial Foliar Controlled_release Sprinkler
42.29 445.0 30.8 6.18 161.7 544.0 1.57 3.12 26.8 72.7 1.25 11.7 3.76 31.7 Corn Sandy PK Mid Foliar Normal Drip
34.65 859.3 33.6 8.28 211.0 556.9 1.46 2.41 33.0 152.7 1.65 4.2 8.64 31.7 Vegetable Sandy PK Mid Broadcasting Controlled_release Flood
;
run;

/* --- dummy variables (author's DATA step, verbatim) --- */
Data AgroFertilizer;
set AgroFertilizer;
if Crop_Type = "Citrus" then Crop_Citrus = 1; else Crop_Citrus = 0;
if Crop_Type = "Corn" then Crop_Corn = 1; else Crop_Corn = 0;
if Crop_Type = "Vegetable" then Crop_Vegetable = 1; else Crop_Vegetable = 0;
if Crop_Type = "Wheat" then Crop_Wheat = 1; else Crop_Wheat = 0;
/* Rice omitted */
if Soil_Type = "Loamy" then Soil_Loamy = 1; else Soil_Loamy = 0;
if Soil_Type = "Sandy" then Soil_Sandy = 1; else Soil_Sandy = 0;
/* Clay omitted */
if Fertilizer_Type = "Organic" then Fert_Organic = 1; else Fert_Organic = 0;
if Fertilizer_Type = "NPK" then Fert_NPK = 1; else Fert_NPK = 0;
if Fertilizer_Type = "PK" then Fert_PK = 1; else Fert_PK = 0;
if Fertilizer_Type = "Urea" then Fert_Urea = 1; else Fert_Urea = 0;
/* Nk Omitted */
if Growth_Stage = "Initial" then Growth_Initial = 1; else Growth_Initial = 0;
if Growth_Stage = "Mid" then Growth_Mid = 1; else Growth_Mid = 0;
/* Late omitted */
if Application_Method = "Drip" then App_Drip = 1; else App_Drip = 0;
if Application_Method = "Foliar" then App_Foliar = 1; else App_Foliar = 0;
/* Broadcasting omitted */
if Coating_Type = "Normal" then Coat_Normal = 1; else Coat_Normal = 0;
if Coating_Type = "Biochar" then Coat_Biochar = 1; else Coat_Biochar = 0;
/* Controlled_release omitted */
if Irrigation_Type = "Drip" then Irr_Drip = 1; else Irr_Drip = 0;
if Irrigation_Type = "Sprinkler" then Irr_Sprinkler = 1; else Irr_Sprinkler = 0;
/* Flood omitted */
run;

/* PROC FREQ — frequency tables for the categorical predictors
   (verbatim from AgroFertilizerCode.sas). */
PROC FREQ data=AgroFertilizer;
Tables crop_type;
Run;
Proc FREQ data=AgroFertilizer;
Tables soil_type;
run;
