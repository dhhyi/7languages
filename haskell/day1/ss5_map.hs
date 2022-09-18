module Main where

main = do
  let colors = ["red", "green", "blue"]
  print
    [ (alabama, mississippi, georgia, tennessee, florida)
      | alabama <- colors,
        mississippi <- colors,
        georgia <- colors,
        tennessee <- colors,
        mississippi /= tennessee,
        mississippi /= alabama,
        alabama /= tennessee,
        alabama /= mississippi,
        alabama /= georgia,
        florida <- colors,
        alabama /= florida,
        georgia /= florida,
        georgia /= tennessee
    ]
