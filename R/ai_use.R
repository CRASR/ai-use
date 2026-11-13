# Helpers for the CRASR ai-use template. Base R only (R >= 4.1).
#
#   source("https://raw.githubusercontent.com/CRASR/ai-use/main/R/ai_use.R")
#   ai_use_init()          # copy the template into ./ai-use
#   ai_log(...)            # append a log row
#   ai_use_check()         # validate the tables against the data dictionary
#   ai_use_statement()     # draft an AI-use statement from the log
#
# Policy: https://github.com/CRASR/ai-use/blob/main/POLICY.md

ai_use_files <- c("README.md", "ai_log.csv", "tools.csv", "materials.csv", "data_dictionary.csv")

ai_use_url <- function(file, ref = "main") {
  sprintf("https://raw.githubusercontent.com/CRASR/ai-use/%s/template/ai-use/%s", ref, file)
}

# Copy the template into <path>/ai-use. Existing files are kept unless overwrite = TRUE.
# ref selects the branch to download from.
ai_use_init <- function(path = ".", ref = "main", overwrite = FALSE) {
  dir <- file.path(path, "ai-use")
  dir.create(dir, showWarnings = FALSE, recursive = TRUE)
  ai_use_files |>
    Filter(f = \(f) overwrite || !file.exists(file.path(dir, f))) |>
    lapply(\(f) utils::download.file(ai_use_url(f, ref), file.path(dir, f), quiet = TRUE))

  if (file.exists(file.path(path, "DESCRIPTION"))) {
    rbi <- file.path(path, ".Rbuildignore")
    lines <- if (file.exists(rbi)) readLines(rbi) else character()
    if (!"^ai-use$" %in% lines) writeLines(c(lines, "^ai-use$"), rbi)
  }
  message("ai-use template in ", normalizePath(dir))
  invisible(dir)
}

ai_use_read <- function(table, path = ".") {
  utils::read.csv(file.path(path, "ai-use", paste0(table, ".csv")),
                  colClasses = "character", na.strings = character())
}

# Append one row to ai_log.csv. Arguments match the log columns.
ai_log <- function(tool, stage, task, output_type, tier, disposition, human_contribution,
                   verification = "", shared_material = "none", link = "",
                   date = Sys.Date(), recorded = "contemporaneous", path = ".") {
  row <- data.frame(date = format(as.Date(date)), tool, stage, task, output_type,
                    tier = as.character(tier), disposition, human_contribution,
                    verification, shared_material, link, recorded)
  utils::write.table(row, file.path(path, "ai-use", "ai_log.csv"), append = TRUE, sep = ",",
                     row.names = FALSE, col.names = FALSE, qmethod = "double", fileEncoding = "UTF-8")
  invisible(row)
}

# Check every table against data_dictionary.csv. Returns a data frame of problems.
ai_use_check <- function(path = ".") {
  dd <- ai_use_read("data_dictionary", path)
  log <- ai_use_read("ai_log", path)
  tool_ids <- ai_use_read("tools", path)$tool_id

  problems <- split(dd, dd$table) |>
    lapply(\(spec) {
      tbl <- ai_use_read(spec$table[1], path)
      missing_cols <- setdiff(spec$field, names(tbl))
      out <- data.frame(table = rep(spec$table[1], length(missing_cols)),
                        row = rep(NA_integer_, length(missing_cols)), field = missing_cols,
                        problem = rep("column missing", length(missing_cols)))
      for (i in seq_len(nrow(spec))[spec$field %in% names(tbl)]) {
        f <- spec$field[i]; x <- trimws(tbl[[f]]); empty <- x == ""
        need <- switch(spec$required[i],
                       yes = rep(TRUE, nrow(tbl)),
                       `tier 2-3` = tbl$tier %in% c("2", "3"),
                       rep(FALSE, nrow(tbl)))
        bad <- need & empty
        if (spec$type[i] == "categorical") {
          ok <- strsplit(spec$allowed_values[i], "|", fixed = TRUE)[[1]]
          bad <- bad | (!empty & !x %in% ok)
        }
        if (spec$type[i] == "date") bad <- bad | (!empty & is.na(as.Date(x, format = "%Y-%m-%d")))
        if (spec$table[i] == "ai_log" && f == "tier") bad <- bad | (!empty & !x %in% c("1", "2", "3"))
        if (spec$table[i] == "ai_log" && f == "tool") {
          bad <- bad | vapply(strsplit(x, ";\\s*"), \(t) !all(t %in% tool_ids), logical(1))
        }
        if (any(bad)) out <- rbind(out, data.frame(table = spec$table[1], row = which(bad), field = f,
                                                   problem = paste0("invalid or missing: '", x[bad], "'")))
      }
      out
    }) |>
    do.call(what = rbind)
  rownames(problems) <- NULL

  message(if (nrow(problems)) paste(nrow(problems), "problem(s) found") else "ai-use tables look valid")
  invisible(problems)
}

# Draft a statement from the log. Bracketed text needs filling in by hand.
ai_use_statement <- function(path = ".", min_tier = 1) {
  log <- ai_use_read("ai_log", path) |> subset(as.integer(tier) >= min_tier & disposition != "rejected")
  tools <- ai_use_read("tools", path)
  if (!nrow(log)) return(message("No log rows at tier ", min_tier, " or above."))

  months <- format(range(as.Date(log$date)), "%B %Y") |> unique() |> paste(collapse = " to ")
  used <- unique(unlist(strsplit(log$tool, ";\\s*")))
  tool_txt <- tools[tools$tool_id %in% used, ] |>
    with(sprintf("%s (%s, %s)", product, model, provider)) |>
    paste(collapse = " and ")
  labels <- c(writing_original_draft = "drafting text",
              writing_review_editing = "editing text",
              writing_translation = "translation", data_collection_method = "data collection methods")
  stage <- ifelse(log$stage %in% names(labels), labels[log$stage], gsub("_", " ", log$stage))
  stage_txt <- split(log$task, stage) |>
    vapply(\(t) paste(unique(t), collapse = "; "), character(1))
  stage_txt <- paste0(names(stage_txt), " (", stage_txt, ")", collapse = ", ")
  hi <- log[log$tier %in% c("2", "3"), ]
  checks <- if (nrow(hi)) paste(unique(hi$verification[hi$verification != ""]), collapse = "; ") else ""
  shared <- if (all(log$shared_material %in% c("none", "public"))) {
    "No unpublished or restricted third-party material was shared with AI tools."
  } else {
    "[Restricted material] was shared under settings that exclude it from model training."
  }

  txt <- paste0(
    "**Use of AI tools.** ", tool_txt, ", used from ", months, ", assisted with ", stage_txt, ". ",
    "The authors [decisions or designs they made]. ",
    if (nzchar(checks)) paste0("Outputs were checked by: ", checks, ". ") else "",
    "AI tools were not used to [draft manuscript text | generate or alter data or figures]. ",
    shared, " The AI-use log and code are archived at [DOI]. ",
    "The authors take full responsibility for the content of this work."
  )
  cat(strwrap(txt, 90), sep = "\n")
  invisible(txt)
}
