module Tests
where 
import Test.HUnit
import PokerHand
import Data.Ord (comparing)
import Data.List (sort,sortBy)

ud = words "Ah 2h Th Kh 9h Qh Jh"
sd = words "2h 9h Th Jh Qh Kh Ah"

main = runTestTT $ TestList 
       [sortBy (comparing card) ud  ~?= sd
       ,map suit (cards "Ac Ad Ah As") ~?= ['c','d','h','s']
       ,flush (cards "Ah Th 3h 4h 2h") ~?= True
       ,flush (cards "Ad Th 3h 4h 2s") ~?= False
       ,flush (cards "Ad Td 3d 4d 2d") ~?= True]
    where cards = map card . words

