
Mal-Prec is a supervised machine learning classification to predict malonylated sites. In Mal-Prec, three encoding method including One-hot encoding, physiochemical properties (AAindex), and composition of k-spaced acid pairs (CKSAAP) were initially performed to extract sequence features. PCA was then applied to select optimal feature subsets while SVM was adopted to predict the malonylation sites. Five-fold cross-validation test and independent test results showed that Mal-Prec can achieve better prediction performance compared with other approaches. 

Dataset
---------
Negative data set and positive dataset are both in csv format which includes protein window size of 17. homoN.csv is the negative data set and homoP.csv is the positive data set.
The training data set and the independent data set are obtained by random segmentation, which are used to build the model and evaluate the generalization ability of the model respectively. homoTrainData.csv is the training data set and homoIndepData.csv is the independent data set.

Algorithm
----------
Feature.m is used to generate all the features used in Mal-Prec. The input of it is homoN.csv and homoP.csv, the output is different kinds of feature representation of each segment.
Datapre.m is used to integrate features, divide data sets, and normalize data.
Splitdata_AC.m is used to split the training data into several parts(5).
Malon_svm_main.m is used to build the Mal-Prec model through the grid search and 5-fold cross-validation.
Plot_roc.m is used to showed the ROC curves of the 5-fold cross-validation obtained by the Mal-Prec.
Malon_svm_main_Indep.m is used to evaluate the performance of Mal-Prec by independent data set.
PCA.m is used to do principal component analysis.
Roc1.m is used to compute each indicator used in Mal-Prec.

Contact
----------
Feel free to contact us if you need any help: flyinsky6#gmail.com

