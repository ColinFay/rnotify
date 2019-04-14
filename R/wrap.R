#' New notification
#'
#' @param title Title of the notification
#' @param message Message of the notification
#' @param subtitle Subtitle of the notification (not available on windows).
#' @param icon Icon of the notification
#' @param sound Sound of the notification
#' @param time Time in milliseconds of the notification.
#'
#' @return
#' @export
#'
#' @examples
new_notif <- function(
  title,
  message,
  subtitle = NULL,
  icon = NULL,
  sound = NULL,
  time = NULL
) {

  args <- c(
    "-t", title,
    "-m", message
  )

  if (not_null(subtitle)){
    args <- c(
      args,
      "-st", subtitle
    )
  }
  if (not_null(icon)){
    args <- c(
      args,
      "-i", icon
    )
  }
  if (not_null(sound)){
    args <- c(
      args,
      "-s", sound
    )
  }
  if (not_null(time)){
    args <- c(
      args,
      "-x", time
    )
  }
  res <- processx::process$new(
    command = "notify",
    args = c(
      "-t", title,
      "-m", message
    )
  )
  invisible(res)
}

not_null <- Negate(is.null)
