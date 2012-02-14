cond _ _ _ = 1
test _ _ = undefined
main _ _ = undefined

simplecheck a b c l | (x1 /= "o") = x1 
                           | (x2 /= "o") = x2 
                           | (x3 /= "o") = x3 
                           | otherwise = "o" where 
                             x1 = (test a l) 
                             x2 = (main b l) 
                             x3 = (main c l)

