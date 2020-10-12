# shiny-poppers
Playing around with using popper.js to add walkthrough balloons to a shiny app

## Example

Eventually the idea would be to allow creating a walkthrough with a function call in `ui.R`:

```r
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
```

Giving:

![](images/shiny-poppers-gif.gif)
