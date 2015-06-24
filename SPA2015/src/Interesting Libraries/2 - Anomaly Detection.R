library(AnomalyDetection)

results = AnomalyDetectionTs(raw_data, max_anoms=0.02, direction='both', plot=TRUE)
results$plot

results

AnomalyDetectionVec(raw_data[,2], max_anoms=0.02, period=1440, direction='both', only_last=FALSE, plot=TRUE)
head(raw_data)

results = AnomalyDetectionTs(raw_data, max_anoms=0.02, direction='both', only_last='day', plot=TRUE)
results$plot

results
