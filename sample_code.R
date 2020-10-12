walkthrough(
  auto_start = FALSE,
  animation = "fade-in-out",
  styles = list(
    tip_colour = "#ddddff"
  ),
  steps = walthroughSteps(
    addTip(
      target = "bins",
      placement = "bottom",
      header = "Change the bins",
      body = "Why not try 20 bins?",
      back = FALSE,
      end = FALSE
    ),
    addTip(
      target = "distPlot",
      placement = "left",
      header = "Check out the graph!",
      body = "The graph updates automatically!",
      back = FALSE,
      end = TRUE
    )
  )
)