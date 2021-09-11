# AHtestAzure

Testing and benchmarking AnnotationHub on Azure

We would like to receive reports on performance of two cloud providers
for AnnotationHub resources.

# Steps

```
BiocManager::install("vjcitn/AHtestAzure")
library(AHtestAzure)
report_comparisons([string describing your location], [CSV file destination for timings])
```

Upload the file generated as an issue on this repo.  Use your location to name the issue.


