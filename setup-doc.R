library(tidyverse)
library(downlit)
library(gt)
library(northstar)
library(provider)

knitr::opts_chunk$set(
  comment   = "#>",
  dev       = "ragg_png",
  out.width = "100%",
  fig.align = "center",
  # fig.asp   = 0.618 # 1 / phi
  fig.width = 8
)

gt_style <- function(gt_tbl) {
  gt_tbl |> 
    # opt_all_caps() |>
    fmt_markdown() |> 
    fmt_integer() |> 
    cols_align("left") |> 
    tab_style(
      style = cell_text(align = "center", 
                        size = px(18),
                        weight = "bold"),
      locations = cells_stub()) |> 
    tab_options(
      quarto.disable_processing = TRUE,
      column_labels.hidden       = TRUE,
      table.font.size            = px(14),
      table.width                = pct(100),
      heading.align = "left",
      heading.title.font.size    = px(16),
      heading.subtitle.font.size = px(16),
      source_notes.font.size     = px(16),
      row_group.as_column        = TRUE,
      row_group.font.size        = px(24)
    )
}

gt_marks <- function(gt_tbl, cols) {
  
  gt_tbl |>
    gt::text_case_when(
      x == TRUE ~ gt::html(
        fontawesome::fa("check",
                        prefer_type = "solid",
                        fill = "red")),
      x == FALSE ~ gt::html(
        fontawesome::fa("xmark",
                        prefer_type = "solid",
                        fill = "white")),
      .default = NA,
      .locations = gt::cells_body(
        columns = {{ cols }}))
}