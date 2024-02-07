#coeficiente de correlação -1<r<1
# r =1 correção forte positiva
# r=-1 correlação forte negativa
# r= 0 ausência de correlação (linear)

x <- mtcars$mpg
y <- mtcars$wt

cor(x,y)
cor.test(x,y)

mtcars |>
  dplyr::select(mpg, cyl, disp, carb, wt) |>
  cor() |>
  corrplot::corrplot(diag = FALSE,
                     method="number",
                     type="upper",
                     tl.srt=45)
mtcars |>
  dplyr::select(mpg, cyl, disp, carb, wt) |>
  GGally::ggpairs()
