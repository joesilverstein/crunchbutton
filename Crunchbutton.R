# You need to implement a logistic regression classifier with online learning 
# where some of the weights might be fixed during learning.  
# How would you do this?

library("sgd")

setwd("/Users/joesilverstein/Google Drive/Jobs")

## Wine quality (Cortez et al., 2009): Logistic regression
set.seed(42)
data("winequality")
dat <- winequality
dat$quality <- as.numeric(dat$quality > 5) # transform to binary
test.set <- sample(1:nrow(dat), size=nrow(dat)/8, replace=FALSE)
dat.test <- dat[test.set, ]
dat <- dat[-test.set, ]
sgd.theta <- sgd(quality ~ ., data=dat,
                 model="glm", model.control=binomial(link="logit"),
                 sgd.control=list(reltol=1e-5, npasses=200),
                 lr.control=c(scale=1, gamma=1, alpha=30, c=1))
sgd.theta

# Need to understand the SGD algorithm, so as to be able to do it with fixed
# weights.