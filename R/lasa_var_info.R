#' Open a LASA variable-information codebook
#'
#' Opens the variable-information codebook associated with a LASA data-file
#' code. This is for conveniently looking up the variable- and value labels,
#' but not always self-explanatory. For more information on a variable,
#' its references, original questionnaire, and other relevant information
#' search the LASA website: https://lasa-vu.nl/topics/
#'
#' Codebooks are downloaded directly from the public LASA website, and exported
#' wit this package in the `inst/codebooks/` directory.
#' In RStudio, the function first attempts to display the PDF in
#' the Viewer pane. If the RStudio Viewer is unavailable or cannot open the
#' file, the PDF is opened with the system's default browser or PDF viewer.
#'
#' Codebook filenames are derived automatically from `filecode` according to
#' the LASA naming conventions:
#'
#' - Standard data files: `LASA[filecode]_varinfo.pdf`, for example
#'   `LASA046_varinfo.pdf`.
#' - Z-files: `LASAz[number]_varinfo.pdf`, for example
#'   `LASAz004_varinfo.pdf`.
#' - Algorithm-based osteoarthritis files `zoa1`, `zoa2`, and `zoa3`:
#'   `LASAzoa1_2_3_varinfo.pdf`.
#'
#' Filename matching is case-insensitive. Consequently, file codes may be
#' supplied with or without the `LASA` prefix and in upper- or lowercase.
#'
#' @param filecode A single non-empty character string containing a LASA
#'   data-file code, such as `"046"`, `"z004"`, or `"zoa2"`. The optional
#'   `"LASA"` prefix is accepted.
#' @param viewer Where to open the codebook. One of:
#'   \describe{
#'     \item{`"auto"`}{Use the RStudio Viewer when available and otherwise use
#'       the system's default browser or PDF viewer.}
#'     \item{`"rstudio"`}{Attempt to use the RStudio Viewer and fall back to
#'       the system's default browser or PDF viewer if it is unavailable.}
#'     \item{`"system"`}{Use the system's default browser or PDF viewer.}
#'   }
#' @param open Logical. Should the codebook be opened? The default is `TRUE`
#'   during interactive use and `FALSE` otherwise. Set `open = FALSE` to
#'   retrieve the codebook path without opening the PDF.
#'
#' @return Invisibly returns the full path to the codebook PDF.
#'
#' @examples
#' \dontrun{
#' lasa_var_info("046")
#' lasa_var_info("LASA046")
#' lasa_var_info("z004")
#' lasa_var_info("LASAz095")
#' lasa_var_info("zoa2")
#'
#' # Explicitly use the system's default PDF viewer
#' lasa_var_info("046", viewer = "system")
#'
#' # Retrieve the installed path without opening the PDF
#' codebook_path <- lasa_var_info("046", open = FALSE)
#' }
#'
#' @export
lasa_var_info <- function(
    filecode,
    viewer = c("auto", "rstudio", "system"),
    open = interactive()
) {
  viewer <- match.arg(viewer)

  if (!is.character(filecode) ||
      length(filecode) != 1L ||
      is.na(filecode) ||
      !nzchar(trimws(filecode))) {
    stop(
      "`filecode` must be a single, non-empty character string.",
      call. = FALSE
    )
  }

  if (!is.logical(open) || length(open) != 1L || is.na(open)) {
    stop("`open` must be either `TRUE` or `FALSE`.", call. = FALSE)
  }

  normalized_filecode <- trimws(filecode)
  normalized_filecode <- sub(
    pattern = "^LASA",
    replacement = "",
    x = normalized_filecode,
    ignore.case = TRUE
  )

  if (!grepl("^[[:alnum:]_]+$", normalized_filecode)) {
    stop(
      paste0(
        "`filecode` may contain only letters, numbers, and underscores, ",
        "optionally preceded by `LASA`."
      ),
      call. = FALSE
    )
  }

  lowercase_filecode <- tolower(normalized_filecode)

  if (lowercase_filecode %in% c("zoa1", "zoa2", "zoa3", "zoa1_2_3")) {
    expected_codebook_filename <- "LASAzoa1_2_3_varinfo.pdf"
  } else if (grepl("^z[0-9]+$", lowercase_filecode)) {
    expected_codebook_filename <- paste0(
      "LASA",
      lowercase_filecode,
      "_varinfo.pdf"
    )
  } else {
    expected_codebook_filename <- paste0(
      "LASA",
      toupper(normalized_filecode),
      "_varinfo.pdf"
    )
  }

  codebook_directory <- system.file(
    "codebooks",
    package = "CleanLASA"
  )

  if (!nzchar(codebook_directory) || !dir.exists(codebook_directory)) {
    stop(
      paste0(
        "The CleanLASA codebook directory could not be found. ",
        "Codebook PDFs must be stored in `inst/codebooks/` before the ",
        "package is installed."
      ),
      call. = FALSE
    )
  }

  available_codebook_filenames <- list.files(
    path = codebook_directory,
    pattern = "^LASA.+_varinfo[.]pdf$",
    ignore.case = TRUE,
    full.names = FALSE
  )

  matching_codebook_index <- match(
    tolower(expected_codebook_filename),
    tolower(available_codebook_filenames)
  )

  if (is.na(matching_codebook_index)) {
    available_filecodes <- sub(
      pattern = "^LASA(.+)_varinfo[.]pdf$",
      replacement = "\\1",
      x = available_codebook_filenames,
      ignore.case = TRUE
    )

    combined_zoa_index <- tolower(available_filecodes) == "zoa1_2_3"
    available_filecodes[combined_zoa_index] <- "zoa1, zoa2, zoa3"

    available_filecodes_text <- if (length(available_filecodes) == 0L) {
      "none"
    } else {
      paste(available_filecodes, collapse = ", ")
    }

    stop(
      sprintf(
        paste0(
          "No bundled codebook was found for LASA file code %s. ",
          "Expected package file: `inst/codebooks/%s`. ",
          "Currently available file codes: %s."
        ),
        shQuote(normalized_filecode),
        expected_codebook_filename,
        available_filecodes_text
      ),
      call. = FALSE
    )
  }

  codebook_path <- file.path(
    codebook_directory,
    available_codebook_filenames[matching_codebook_index]
  )

  if (!open) {
    return(invisible(codebook_path))
  }

  rstudio_viewer <- getOption("viewer")
  use_rstudio_viewer <-
    viewer == "rstudio" ||
    (viewer == "auto" && is.function(rstudio_viewer))

  if (use_rstudio_viewer && is.function(rstudio_viewer)) {
    viewer_succeeded <- tryCatch(
      {
        rstudio_viewer(codebook_path)
        TRUE
      },
      error = function(error) {
        FALSE
      }
    )

    if (viewer_succeeded) {
      return(invisible(codebook_path))
    }
  } else if (viewer == "rstudio") {
    warning(
      "The RStudio Viewer is unavailable; using the system PDF viewer.",
      call. = FALSE
    )
  }

  utils::browseURL(codebook_path)

  invisible(codebook_path)
}
