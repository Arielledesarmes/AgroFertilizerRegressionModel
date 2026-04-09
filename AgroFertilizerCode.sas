/*Import data*/
PROC import datafile= 'AgrofertilizerLossLessObs.csv' out=AgroFertilizer;
Delimiter=',';
getnames= yes;
Run;
Proc Print;
Run;
/*Dummy Variable created*/
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
Proc prints;
run;
proc means data=AgroFertilizer mean std min max;
var Total_Fertilizer_Loss_kg_ha  Rainfall Temperature Soil_pH Application_Rate Water_Amount;
run;
PROC FREQ;
Tables crop_type;
Run;
Proc FREQ;
Tables soil_type;
run;
proc sort data=AgroFertilizer;
by Crop_Type;
run;
proc boxplot data=AgroFertilizer;
plot Total_Fertilizer_Loss_kg_ha*Crop_Type;
run;
proc sort data=AgroFertilizer;
by Soil_Type;
run;
proc boxplot data=AgroFertilizer;
plot Total_Fertilizer_Loss_kg_ha*Soil_Type;
run;

Proc univariate data= AgroFertilizer;
Var Total_Fertilizer_Loss_kg_ha;
Histogram Total_Fertilizer_Loss_kg_ha/Normal;
Run;
Proc Sgscatter;
title"Scatterplot matrix for Fertilizer Loss";
Matrix Total_Fertilizer_Loss_kg_ha Rainfall Temperature Soil_pH Soil_Organic_Carbon Total_Nitrogen Available_Phosphorus Available_Potassium Bulk_Density Wind_Speed Evapotranspiration Application_Rate Water_Amount;
Run;
Proc gplot;
plot Total_Fertilizer_Loss_kg_ha*(Rainfall Temperature Soil_pH Soil_Organic_Carbon Total_Nitrogen Available_Phosphorus Available_Potassium Bulk_Density Wind_Speed Evapotranspiration Application_Rate Water_Amount);
Run;

PROC Corr;
var  Total_Fertilizer_Loss_kg_ha Temperature Soil_pH Soil_Organic_Carbon Total_Nitrogen Available_Phosphorus Available_Potassium Bulk_Density Wind_Speed Evapotranspiration Application_Rate Water_Amount;
Run;
PROC CORR data=AgroFertilizer;
var Total_Fertilizer_Loss_kg_ha 
Temperature Soil_pH Soil_Organic_Carbon Total_Nitrogen 
Available_Phosphorus Available_Potassium Bulk_Density 
Wind_Speed Evapotranspiration Application_Rate Water_Amount

/* Crop Type */
Crop_Citrus Crop_Corn Crop_Vegetable Crop_Wheat

/* Soil Type */
Soil_Loamy Soil_Sandy

/* Fertilizer Type */
Fert_Organic Fert_NPK Fert_PK Fert_Urea

/* Growth Stage */
Growth_Initial Growth_Mid

/* Application Method */
App_Drip App_Foliar

/* Coating Type */
Coat_Normal Coat_Biochar

/* Irrigation Type */
Irr_Drip Irr_Sprinkler
;
Run;

proc reg data=AgroFertilizer;

model Total_Fertilizer_Loss_kg_ha =

/* Crop Type (Rice reference) */
Crop_Citrus Crop_Corn Crop_Vegetable Crop_Wheat

/* Soil Type (Clay reference) */
Soil_Loamy Soil_Sandy

/* Fertilizer Type (NK reference) */
Fert_Organic Fert_NPK Fert_PK Fert_Urea

/* Growth Stage (Late reference) */
Growth_Initial Growth_Mid

/* Application Method (Broadcasting reference) */
App_Drip App_Foliar

/* Coating Type (Controlled release reference) */
Coat_Normal Coat_Biochar

/* Irrigation Type (Flood reference) */
Irr_Drip Irr_Sprinkler

/* Soil & environmental predictors */
Soil_pH
Soil_Organic_Carbon
Total_Nitrogen
Available_Phosphorus
Available_Potassium
Bulk_Density
Rainfall
Temperature
Humidity
Wind_Speed
Evapotranspiration

/* Management predictors */
Application_Rate
Water_Amount

/vif TOL;

run;
Proc reg data=AgroFertilizer;
model Total_Fertilizer_Loss_kg_ha =
/* Crop Type (Rice reference) */
Crop_Citrus Crop_Corn Crop_Vegetable Crop_Wheat
/* Soil Type (Clay reference) */
Soil_Loamy Soil_Sandy
/* Fertilizer Type (NK reference) */
Fert_Organic Fert_NPK Fert_PK Fert_Urea
/* Growth Stage (Late reference) */
Growth_Initial Growth_Mid
/* Application Method (Broadcasting reference) */
App_Drip App_Foliar
/* Coating Type (Controlled release reference) */
Coat_Normal Coat_Biochar
/* Irrigation Type (Flood reference) */
Irr_Drip Irr_Sprinkler
/* Soil & environmental predictors */
Soil_pH
Soil_Organic_Carbon
Total_Nitrogen
Available_Phosphorus
Available_Potassium
Bulk_Density
Rainfall
Temperature
Humidity
Wind_Speed
Evapotranspiration
/* Management predictors */
Application_Rate
Water_Amount;
plot students.*predicted.;
run;
Proc reg data=AgroFertilizer;
model  Total_Fertilizer_Loss_kg_ha=
Crop_Citrus Crop_Corn Crop_Vegetable Crop_Wheat Soil_Loamy Soil_Sandy Fert_Organic Fert_NPK Fert_PK Fert_Urea
Growth_Initial Growth_Mid App_Drip App_Foliar Coat_Normal Coat_Biochar Irr_Drip Irr_Sprinkler
Soil_pH
Soil_Organic_Carbon
Total_Nitrogen
Available_Phosphorus
Available_Potassium
Bulk_Density
Rainfall
Temperature
Humidity
Wind_Speed
Evapotranspiration
Application_Rate
Water_Amount;
plot npp.*student.;
run;

Proc reg data=AgroFertilizer;
model Total_Fertilizer_Loss_kg_ha =

/* Crop Type (Rice reference) */
Crop_Citrus Crop_Corn Crop_Vegetable Crop_Wheat

/* Soil Type (Clay reference) */
Soil_Loamy Soil_Sandy

/* Fertilizer Type (NK reference) */
Fert_Organic Fert_NPK Fert_PK Fert_Urea

/* Growth Stage (Late reference) */
Growth_Initial Growth_Mid

/* Application Method (Broadcasting reference) */
App_Drip App_Foliar

/* Coating Type (Controlled release reference) */
Coat_Normal Coat_Biochar

/* Irrigation Type (Flood reference) */
Irr_Drip Irr_Sprinkler

/* Soil & environmental predictors */
Soil_pH
Soil_Organic_Carbon
Total_Nitrogen
Available_Phosphorus
Available_Potassium
Bulk_Density
Rainfall
Temperature
Humidity
Wind_Speed
Evapotranspiration
/* Management predictors */
Application_Rate
Water_Amount/ r influence;
run;
PROC surveyselect data= AgroFertilizer out= Agro_all seed= 841693
samprate= 0.75 outall;
run;
proc print;
run;
data agro_all;
set Agro_all;
if selected = 1 then new_y=Total_Fertilizer_Loss_kg_ha;
run;
proc print data= Agro_all;
run;
proc reg data=Agro_all;

/* MODEL 1- Training set */
model new_y =

/* Crop Type (Rice reference) */
Crop_Citrus Crop_Corn Crop_Vegetable Crop_Wheat

/* Soil Type (Clay reference) */
Soil_Loamy Soil_Sandy

/* Fertilizer Type (NK reference) */
Fert_Organic Fert_NPK Fert_PK Fert_Urea

/* Growth Stage (Late reference) */
Growth_Initial Growth_Mid

/* Application Method (Broadcasting reference) */
App_Drip App_Foliar

/* Coating Type (Controlled_release reference) */
Coat_Normal Coat_Biochar

/* Irrigation Type (Flood reference) */
Irr_Drip Irr_Sprinkler

/* Soil & environmental predictors */
Soil_pH
Soil_Organic_Carbon
Total_Nitrogen
Available_Phosphorus
Available_Potassium
Bulk_Density
Rainfall
Temperature
Humidity
Wind_Speed
Evapotranspiration

/* Management predictors */
Application_Rate
Water_Amount

/selection=stepwise;

run;
Proc reg data=agro_all;
model new_y= 
Rainfall   
Application_Rate    
Soil_Organic_Carbon   
Temperature  
Coat_Normal  
Soil_Sandy   
Growth_Initial    
Soil_Loamy  
Growth_Mid  
Coat_Biochar  
/Vif influence r;
plot student.*predicted.;
plot student.*(Rainfall   
Application_Rate    
Soil_Organic_Carbon   
Temperature  
Coat_Normal  
Soil_Sandy   
Growth_Initial    
Soil_Loamy  
Growth_Mid  
Coat_Biochar 
Total_Nitrogen
Crop_Wheat 
);
plot npp.*student.;
run;
proc reg data=Agro_all;

/* MODEL 1- Training set */
model new_y =

/* Crop Type (Rice reference) */
Crop_Citrus Crop_Corn Crop_Vegetable Crop_Wheat

/* Soil Type (Clay reference) */
Soil_Loamy Soil_Sandy

/* Fertilizer Type (NK reference) */
Fert_Organic Fert_NPK Fert_PK Fert_Urea

/* Growth Stage (Late reference) */
Growth_Initial Growth_Mid

/* Application Method (Broadcasting reference) */
App_Drip App_Foliar

/* Coating Type (Controlled_release reference) */
Coat_Normal Coat_Biochar

/* Irrigation Type (Flood reference) */
Irr_Drip Irr_Sprinkler

/* Soil & environmental predictors */
Soil_pH
Soil_Organic_Carbon
Total_Nitrogen
Available_Phosphorus
Available_Potassium
Bulk_Density
Rainfall
Temperature
Humidity
Wind_Speed
Evapotranspiration

/* Management predictors */
Application_Rate
Water_Amount

/selection=Adjrsq;

run;
Proc reg data=agro_all;
model new_y= 
  Crop_Citrus
 Crop_Vegetable 
Soil_Loamy 
Soil_Sandy
 Fert_PK 
Growth_Initial
 Growth_Mid
 App_Drip 
Coat_Normal 
Coat_Biochar 
Irr_Drip 
Irr_Sprinkler
 Soil_Organic_Carbon 
Total_Nitrogen 
Rainfall 
Temperature 
Application_Rate
/Vif influence r;
plot student.*predicted.;
plot student.*(Rainfall   
Crop_Citrus
Crop_Vegetable 
Soil_Loamy 
Soil_Sandy
Fert_PK 
Growth_Initial
Growth_Mid
App_Drip 
Coat_Normal 
Coat_Biochar 
Irr_Drip 
Irr_Sprinkler
Soil_Organic_Carbon 
Total_Nitrogen 
Rainfall 
Temperature 
Application_Rate
);
plot npp.*student.;
run;
proc reg data=agro_all;
model new_y =
Application_Rate    
Soil_Organic_Carbon   
Temperature  
Coat_Normal  
Soil_Sandy   
Growth_Initial    
Soil_Loamy  
Growth_Mid  
Coat_Biochar
Crop_Wheat
Total_Nitrogen;
output out=outm1(where=(new_y=.)) p=yhat;
run;
proc reg data=agro_all;

/* MODEL- Validation test 1 */
model new_y =
Crop_Citrus
Crop_Vegetable 
Soil_Loamy 
Soil_Sandy
Fert_PK 
Growth_Initial
Growth_Mid
App_Drip 
Coat_Normal 
Coat_Biochar 
Irr_Drip 
Irr_Sprinkler
Soil_Organic_Carbon 
Total_Nitrogen 
Rainfall 
Temperature 
Application_Rate
;
output out=outm2(where=(new_y=.)) p=yhat;
run;


data outm1; 
set outm1;
d= Total_Fertilizer_Loss_kg_ha-yhat; 
absd=abs(d);
run;
proc print;
run;
PROC summary data=outm1;
var d absd;
output out= outm1_stats std(d)= rimse mean(absd)= mae;
run;
proc print data= outm1_stats;
title 'validation stats for model';
run;
proc corr data=outm1;
var Total_Fertilizer_Loss_kg_ha yhat;
run;
PROC PRINT;
RUN;

data outm2; 
set outm2;
d= Total_Fertilizer_Loss_kg_ha-yhat; 
absd=abs(d);
run;
proc print;
run;
PROC summary data=outm1;
var d absd;
output out= outm2_stats std(d)= rimse mean(absd)= mae;
run;
proc print data= outm2_stats;
title 'validation stats for model';
run;
proc corr data=outm2;
var Total_Fertilizer_Loss_kg_ha yhat;
run;
PROC PRINT;
RUN;
data pred;
input Application_Rate Rainfall Soil_Organic_Carbon Temperature
      Coat_Normal Soil_Sandy Growth_Initial Soil_Loamy Growth_Mid Coat_Biochar;

datalines;
120 800 2.5 25 1 0 1 0 0 0
;
run;
proc print data=pred;
run;
data prediction;
set pred Agro_new;
run;
proc print;
run;
PROC REG data=Agro_All;
Model new_y=Application_Rate Rainfall Soil_Organic_Carbon Temperature
 Coat_Normal Soil_Sandy Growth_Initial Soil_Loamy Growth_Mid Coat_Biochar/ p clm cli;
Run;
proc print;
run;

