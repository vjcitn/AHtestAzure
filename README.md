# AHtestAzure

Testing and benchmarking AnnotationHub on Azure

We would like to receive reports on performance of two cloud providers
for AnnotationHub resources.

## Azure

Start a fresh R session, and run
```
td = tempdir()
BiocManager::install("Bioconductor/AnnotationHub", ref="azureTesting", force=TRUE)
system.time(ah <- AnnotationHub::AnnotationHub(cache=td))
system.time(z <- ah[["AH90000"]])  # not great -- it includes the R conversion -- can we just use fetch API call?
system.time(z <- ah[["AH90001"]])
```

## Amazon

Start a fresh R session, and run
```
td = tempdir()
BiocManager::install("Bioconductor/AnnotationHub", ref="master", force=TRUE)
system.time(ah <- AnnotationHub::AnnotationHub(cache=td))
system.time(z <- ah[["AH90000"]])
system.time(z <- ah[["AH90001"]])
```


