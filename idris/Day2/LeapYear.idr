import Data.So

isLeap : Integer -> Bool
isLeap year = year `mod` 4 == 0 && (year `mod` 100 /= 0 || year `mod` 400 == 0)

numberOfDays : Integer -> Integer -> Integer
numberOfDays year 2 = if isLeap year then 29 else 28
numberOfDays _ 9 = 30
numberOfDays _ 4 = 30
numberOfDays _ 6 = 30
numberOfDays _ 11 = 30
numberOfDays _ _ = 31

validDate : Integer -> Integer -> Integer -> Bool
validDate year month day = 1 <= month && month <= 12 && 1 <= day && day <= numberOfDays year month

data Date : Integer -> Integer -> Integer -> Type where
    MakeDate : (year : Integer) -> (month : Integer) -> (day : Integer) -> So (validDate year month day) -> Date year month day

dateFromData : (year : Integer) -> (month : Integer) -> (day : Integer) -> Maybe (Date year month day)
dateFromData year month day = case So.choose (validDate year month day) of
    Left valid => Just (MakeDate year month day valid)
    Right _ => Nothing

-- Main> :l "Day2/LeapYear.idr"
-- 1/1: Building Day2.LeapYear (Day2/LeapYear.idr)
-- Loaded file Day2/LeapYear.idr
-- Main> dateFromData 2004 2 22
-- Just (MakeDate 2004 2 22 Oh)
-- Main> dateFromData 2004 2 30
-- Nothing
