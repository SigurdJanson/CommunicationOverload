
FormatBib <- function(aut, title, year,
                      publ=NULL, journal=NULL, issue=NULL, nr=NULL, pg=NULL) {

  stopifnot(!missing(aut))
  stopifnot(!missing(title))
  stopifnot(!missing(year))

  .a <- function(x) if (missing(x)) return(NULL) else return(x)
  .add <- function(pre, x, post) { if(is.null(x)) return(NULL); paste0(.a(pre), x, .a(post)) }
  allWS <- c("before", "after", "after-begin", "before-end", "outside", "inside")

  HTML(
    paste0(
      "<p>",
        aut, " (", year, "). ",   # author (year)
        "'<em>", title, "</em>'", # title
        paste0(
          .add(". ", publ),
          .add(". ", journal),
          .add(", ", issue),
          .add(" (", nr, ")"),
          .add(", ", pg)
        ),
      "</p>"),
    .noWS = allWS
  )
}
