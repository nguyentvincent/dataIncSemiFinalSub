rm(list = ls())

n = 10000
m = 20

vector.number.of.rolls.until.m = vector()
vector.sum.of.rolls.greater.than.m = vector()

for (i in 1:n)
{
  nubmer.of.dice.rolls = m
  dice.rolls = sample(1:6,m,replace=TRUE)
  cumDiceSum = cumsum(dice.rolls) 
  number.of.rolls.until.m = sum(cumDiceSum<m)+1
  vector.number.of.rolls.until.m[i] = number.of.rolls.until.m
  vector.sum.of.rolls.greater.than.m[i] =  cumDiceSum[sum(cumDiceSum < m)+1]
}
print(paste("the mean of the sum minus M when M = 20 is",mean(vector.sum.of.rolls.greater.than.m) - m ))
print(paste("the standard deviation of the sum minus M when M = 20 is",sd(vector.sum.of.rolls.greater.than.m) - m))
print(paste("the mean number of rolls when M = 20 is", mean(vector.number.of.rolls.until.m)))
print(paste("the standard deviation of the number of rolls M = 20 is", sd(vector.number.of.rolls.until.m)))

#--------------------------------------------------------------------------------
n = 10000
m = 10000

vector.number.of.rolls.until.m = vector()
vector.sum.of.rolls.greater.than.m = vector()

for (i in 1:n)
{
  nubmer.of.dice.rolls = m
  dice.rolls = sample(1:6,m,replace=TRUE)
  cumDiceSum = cumsum(dice.rolls) 
  number.of.rolls.until.m = sum(cumDiceSum<m)+1
  vector.number.of.rolls.until.m[i] = number.of.rolls.until.m
  vector.sum.of.rolls.greater.than.m[i] =  cumDiceSum[sum(cumDiceSum < m)+1]
}
print(paste("the mean of the sum minus M when M = 10000 is",mean(vector.sum.of.rolls.greater.than.m) - m ))
print(paste("the standard deviation of the sum minus M when M = 10000 is",sd(vector.sum.of.rolls.greater.than.m) - m))
print(paste("the mean number of rolls when M = 10000 is", mean(vector.number.of.rolls.until.m)))
print(paste("the standard deviation of the number of rolls M = 10000 is", sd(vector.number.of.rolls.until.m)))








mean(vector.sum.of.rolls.greater.than.m) - m

sd(vector.sum.of.rolls.greater.than.m) - m

mean(vector.number.of.rolls.until.m)

sd(vector.number.of.rolls.until.m)
