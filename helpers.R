
#' FormatBib
#'
#' @param aut Author (correctly formatted string)
#' @param title Main title of the article or book
#' @param year Year
#' @param publ Publisher (for books)
#' @param journal Journal
#' @param issue Journal issue (may be numeric)
#' @param nr Journal number (may be numeric)
#' @param pg Pages (correctly formatted string)
#'
#' @return A formatted reference as HTML
#' @examples
#' FormatBib("Brooks, F. P.", "The Mythical Man Month", 1995, "Addison-Wesley")
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
      "<p><small>",
        aut, " (", year, "). ",   # author (year)
        "'<em>", title, "</em>'", # title
        paste0(
          .add(". ", publ),
          .add(". ", journal),
          .add(", ", issue),
          .add(" (", nr, ")"),
          .add(", ", pg)
        ),
      "</small></p>"),
    .noWS = allWS
  )
}
