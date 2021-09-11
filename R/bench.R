#' simple comparison of retrieval from Azure/AWS
#' @import microbenchmark
#' @import BiocFileCache
#' @param location character(1) description of location of run, please make informative
#' @param target_file character(1) file to which report is written in CSV
#' @param stub character(1) URL stub to which `fetch/[num]` is appended for retrieval
#' @param cache instance of BiocFileCache
#' @param tags character() `fetch_id` values from `AnnotationHub::getInfoOnIds`
#' @param hosts character() defaults to `c("azure", "fetch")` for use in API call
#' @param ntimes numeric() defaults to 2, number of retrievals to be benchmarked
#' @export
report_comparison = function(location="Boston", target_file = tempfile(),
   stub = "https://annotationhub.bioconductor.org/", 
   cache = BiocFileCache::BiocFileCache(),
   tags=c("5050", "2"),
   hosts = c("azure", "fetch"), ntimes=2) {
  targets = as.character(outer(hosts, tags, function(x,y) paste(x,y, sep="/")))
  ans = vapply(targets, function(x) microbenchmark( bfcadd( cache, paste0(stub, x) ), times=ntimes )$time/1e9, numeric(ntimes))
  ans = unlist(ans)
  targets = rep(targets , each=ntimes)
  ans = data.frame(location=location, target=targets, sec=as.numeric(ans))
  write.csv(ans, target_file)
}

