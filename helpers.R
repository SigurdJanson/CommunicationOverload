

FormatBib <- function(aut, title, year,
                      publ=NULL, journal=NULL, issue=NULL, nr=NULL, pg=NULL) {
  .a <- function(x) if (missing(x)) return(NULL) else return(x)
  .add <- function(pre, x, post) { if(is.null(x)) return(NULL); paste0(.a(pre), x, .a(post)) }
  allWS <- c("before", "after", "after-begin", "before-end", "outside", "inside")

  stopifnot(!missing(aut))
  stopifnot(!missing(title))
  stopifnot(!missing(year))

  p(aut,
    .add("(", year, ")."),
    "'", tag("em", title, .noWS = "outside"), "'",
    .add(". ", publ),
    .add(". ", journal),
    .add(", ", issue),
    .add(" (", nr, ")"),
    .add(", ", pg),
    .noWS = "inside"
  )
}
# p("Brooks, F. P. (1995).", tags$em("'The Mythical Man Month'"), ". Addison-Wesley"),
