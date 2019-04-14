#' New notification
#'
#' @param title Title of the notification
#' @param message Message of the notification
#' @param subtitle Subtitle of the notification (not available on windows).
#' @param sound Sound of the notification
#'
#' @return
#' @export
#'
#' @examples
new_notif <- function(
  title,
  message,
  subtitle = NULL,
  sound = NULL
) {

  arguments <- c(
    "-t", title,
    "-m", message
  )

  if (not_null(subtitle)){
    arguments <- c(
      arguments,
      "-st", subtitle
    )
  }
  if (not_null(sound)){
    arguments <- c(
      arguments,
      "-s", sound
    )
  }
  invisible(processx::process$new(
    command = "notify",
    args = arguments
  ))
}

not_null <- Negate(is.null)
