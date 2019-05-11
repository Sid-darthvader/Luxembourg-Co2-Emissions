library(readxl)
#CO2_Emissions_2019 <- read_excel("C:/Users/Siddharth/Desktop/Luxembourg~Research/CO2_Emissions_2019_new")
guideco2_012019 <- read_excel("guideco2-012019.xlsx")
View(guideco2_012019)
attach(guideco2_012019)
set.seed(1)
#train=sample(1:nrow(guideco2_012019),nrow(guideco2_012019)/4)
train=sample(1:nrow(guideco2_012019),nrow(guideco2_012019)*4/5)
test=-train
train_set=guideco2_012019[train,]
test_set=guideco2_012019[test,]
library(tree)
tree.model1=tree(Emission_Min~Displacement+Power+Fuel+Consumption_Min+Consumption_Max,train_set)
summary(tree.model1)
plot(tree.model1)
text(tree.model1,pretty = 0)
tree.predictions=predict(tree.model1,test_set)
Emission_Min.test=Emission_Min[test]
mse_tree_model1=mean((Emission_Min.test-tree.predictions)^2)
rmse=sqrt(mse_tree_model1)#RMSE turns out to be 17.31
rmse
##########
#model.bagging=randomForest(Emission_Min~.,train_set)
#bagging.predictions=predict(model.bagging,test_set)
#mse_test=mean((Emission_Min.test-bagging.predictions)^2)
#We can also change the number of trees grown by random forest












